# Display projection parameters
# WARNING: seems that key press does not work correctly with Python 3.9 (I have used 3.7)
# By uko from The Arctic Land (T.AL) 2019-2020
# Contact: uko.tal@gmail.com or uko at http://www.atari-forum.com
import pygame
import os

# TBD le dernier niveau n'est pas forcément noir...

REG_D0 = "d0"
REG_A0 = "a0"
REG_A1 = "a1"
REG_A2 = "a2"


class CodeGen:
    def __init__(self, maxCylesPerSlice, alignSectionEveryNbCycles=None):
        self.nb_cycles = 0
        self.lines = []

        self.cur_slice_id = None
        self.cur_slice_cycles = 0
        self.max_cycles_per_slice = maxCylesPerSlice

        self.cur_section = None
        self.cur_subsection_id = 0

        self.max_nb_cycles_align_section = alignSectionEveryNbCycles
        self.cur_nb_cycles_align_section = 0

    def startSlicing(self):
        self.add_line("swc_proj\tmacro", 0, True)
        self.next_slice()

    def process_slice_for_line(self, nbCyclesOfLine):
        if self.cur_slice_id is not None:
            nbRemainingCycles = self.max_cycles_per_slice - self.cur_slice_cycles
            if nbCyclesOfLine > nbRemainingCycles:
                self.next_slice()

            self.cur_slice_cycles += nbCyclesOfLine

    def next_slice(self):
        self.close_slice()
        if self.cur_slice_id is None:
            self.cur_slice_id = 0
        else:
            self.cur_slice_id += 1

        self.add_line("; Slice_" + str(self.cur_slice_id), 0, True)
        self.add_line("\tifeq \\1-" + str(self.cur_slice_id), 0, True)

        # Split section
        if self.cur_section is not None:
            # Start sub-section
            self.cur_subsection_id += 1
            self.add_line(";" + self.cur_section + "_" + str(self.cur_subsection_id) + ":", 0, True)

    def close_slice(self):
        if self.cur_slice_id is not None:
            self.fill_slice_to_max_cycles()
            self.add_line("\tendif", 0, True)
            # self.add_line("\tendm",0, True)
            self.add_line(
                "\t; Total cycles for Slice:\t" + str(self.cur_slice_cycles) + " / " + str(self.nb_cycles), 0,
                True)
            self.cur_slice_cycles = 0

    def fill_slice_to_max_cycles(self):
        if self.cur_slice_id is not None and self.max_cycles_per_slice is not None:
            nbRemainingCycles = self.max_cycles_per_slice - self.cur_slice_cycles
            if nbRemainingCycles % 4 == 0:
                self.add_line("\t; Fill to " + str(self.max_cycles_per_slice) + " cycles per slice", 0, True)
                for i in range(0, nbRemainingCycles, 4):
                    self.add_line("\tnop\t", 4, True)
                    self.cur_slice_cycles += 4
            else:
                print("ERROR: Number of cycles is not multiple of 4 !", self.cur_section, nbRemainingCycles)

    def align_section_with_slice(self):
        if self.cur_slice_id is not None:
            if self.cur_nb_cycles_align_section >= self.max_nb_cycles_align_section:
                self.add_line("; Align next section with slice", 0, True)
                self.next_slice()
                self.cur_nb_cycles_align_section = 0

    def add_line(self, strLine, nbCycles, ignoreSlices=False):
        if not ignoreSlices:
            self.process_slice_for_line(nbCycles)

        self.lines.append((strLine, nbCycles))
        self.nb_cycles += nbCycles
        self.cur_nb_cycles_align_section += nbCycles

    def begin_section(self, strSection, fillSectionToNbCycles=None):
        self.end_section()

        self.align_section_with_slice()
        self.cur_section = strSection
        self.cur_subsection_id = 0
        self.add_line(";" + strSection + ":", 0)

    def end_section(self):
        self.cur_section = None
        self.cur_subsection_id = 0

    def write_to_file(self, tf):
        self.end_section()
        self.close_slice()
        self.add_line("\tendm", 0, True)

        for line in self.lines:
            strLine = line[0]
            nbCycles = line[1]

            if nbCycles > 0:
                strLine += "\t; " + str(nbCycles)

            strLine += "\n"

            tf.write(strLine)

        tf.write("; Total: " + str(self.nb_cycles) + "\n")


class Bitplan:
    def __init__(self):
        self.is_used = False
        self.is_char_begin = False
        self.char_col = -1
        self.is_char_single_word = False
        self.char_posx = -1
        self.char_w = -1

    def debug(self):
        if not self.is_used:
            print("[ ]", end='')
        else:
            if not self.is_char_begin:
                print("[x]", end='')
            else:
                print("[", self.char_col, self.char_posx, self.char_w, self.is_char_single_word, "]", end='')

    def set_single_word(self, char_col, x, w):
        if not self.is_used:
            self.is_used = True
            self.is_char_begin = True
            self.char_col = char_col
            self.is_char_single_word = True
            self.char_posx = x
            self.char_w = w

            return True
        else:
            return False

    def set_dual_word(self, char_col, x, w):
        if self.set_single_word(char_col, x, w):
            self.is_char_single_word = False
            return True
        else:
            return False

    def set_ending_word(self):
        if not self.is_used:
            self.is_used = True
            self.is_char_begin = False
            return True
        else:
            return False

    def write_code(self, codeGen: CodeGen, bp_offset):
        if self.is_used and self.is_char_begin:
            codeGen.add_line("\tmove.l (" + REG_A0 + ")+," + REG_A1 + "\t", 12)

            nb_cycles_int = 0
            strLine = ""
            if self.is_char_single_word:
                strLine = "\tmove.w "
                nb_cycles_int += 12
            else:
                strLine = "\tmove.l "
                nb_cycles_int += 20  # (An),(An)

            # Source offset
            # 16*4=64 bytes per size (one .L per X shift)
            src_offset = 64 * (16 - self.char_w) + 4 * self.char_posx
            if src_offset == 0:
                strLine += "(" + REG_A1 + "),"
            else:
                strLine += str(src_offset) + "(" + REG_A1 + "),"
                nb_cycles_int += 4

            # Dest offset
            if bp_offset == 0:
                strLine += "(" + REG_A2 + ")"
            else:
                strLine += str(bp_offset) + "(" + REG_A2 + ")"
                nb_cycles_int += 4

            codeGen.add_line(strLine, nb_cycles_int)

    def write_code_conflict(self, codeGen: CodeGen, bp_offset, bp_conflicts):
        if self.is_used and self.is_char_begin:

            # Determine data length
            is_single_word = True
            if not self.is_char_single_word:
                is_single_word = False
            for conflict in bp_conflicts:
                if not conflict.is_char_single_word:
                    is_single_word = False

            # First char
            codeGen.add_line("\tmove.l (" + REG_A0 + ")+," + REG_A1 + "\t", 12)

            nb_cycles_int = 0
            strLine = ""

            if is_single_word:
                strLine = "\tmove.w "
                nb_cycles_int += 8
            else:
                strLine = "\tmove.l "
                nb_cycles_int += 12  # Basis (An),d0

            # Source offset
            # 16*4=64 bytes per size (one .L per X shift)
            src_offset = 64 * (16 - self.char_w) + 4 * self.char_posx
            if src_offset == 0:
                strLine += "(" + REG_A1 + ")," + REG_D0
            else:
                strLine += str(src_offset) + "(" + REG_A1 + ")," + REG_D0
                nb_cycles_int += 4

            codeGen.add_line(strLine, nb_cycles_int)

            # Next char
            for conflict in bp_conflicts:
                codeGen.add_line("\tmove.l (" + REG_A0 + ")+," + REG_A1 + "\t", 12)
                nb_cycles_int = 0
                strLine = ""

                if is_single_word:
                    strLine = "\tor.w "
                    nb_cycles_int += 8
                else:
                    strLine = "\tor.l "
                    nb_cycles_int += 16  # Basis (An),d0

                # Source offset
                # 16*4=64 bytes per size (one .L per X shift)
                src_offset = 64 * (16 - conflict.char_w) + 4 * conflict.char_posx
                if src_offset == 0:
                    strLine += "(" + REG_A1 + ")," + REG_D0
                else:
                    strLine += str(src_offset) + "(" + REG_A1 + ")," + REG_D0 + "\t"
                    nb_cycles_int += 4

                codeGen.add_line(strLine, nb_cycles_int)

            # Write back
            nb_cycles_int = 0
            strLine = ""

            if is_single_word:
                strLine = "\tmove.w " + REG_D0 + ","
                nb_cycles_int += 8
            else:
                strLine = "\tmove.l " + REG_D0 + ","
                nb_cycles_int += 12  # Basis d0,(An)

            # Dest offset
            if bp_offset == 0:
                strLine += "(" + REG_A2 + ")"
            else:
                strLine += str(bp_offset) + "(" + REG_A2 + ")"
                nb_cycles_int += 4

            codeGen.add_line(strLine, nb_cycles_int)

        else:
            codeGen.add_line("; *** Unsolved conflict", 0)


class PixelsWord:
    def __init__(self, numWord):
        self.id = numWord
        self.bp1 = Bitplan()
        self.bp2 = Bitplan()
        self.bp_conflicts = []

    def debug(self):
        print("**", self.id, end='')
        self.bp1.debug()
        self.bp2.debug()
        for conflict in self.bp_conflicts:
            print("[CONFLICT]", end='')
            conflict.debug()

    def write_code(self, codeGen: CodeGen):
        self.bp1.write_code(codeGen, self.id * 8)
        if len(self.bp_conflicts) == 0:
            self.bp2.write_code(codeGen, self.id * 8 + 6)
        else:
            # Conflict between two or more chars
            self.bp2.write_code_conflict(codeGen, self.id * 8 + 6, self.bp_conflicts)


class PixelsLine:
    def __init__(self, numLine, nbWords, scrLineDelta, mapLineDelta):
        self.line = numLine
        self.nb_words = nbWords
        self.words = [PixelsWord(i) for i in range(0, nbWords)]
        self.scr_line_delta = scrLineDelta
        self.map_line_delta = mapLineDelta

    def debug(self):
        print("Line:", self.line, end='')
        for word in self.words:
            word.debug()
        print()

    def write_code(self, codeGen: CodeGen):
        codeGen.begin_section("swc_L" + str(self.line))
        # If map delta = 0, nothing to do
        # moreover, if it is 2, nothing to do because read is performed with (a0)+ !!
        if self.map_line_delta > 1:
            codeGen.add_line("\tlea (" + str(self.map_line_delta - 1) + "*SWMAP_LINE_LEN)(" + REG_A0 + ")," + REG_A0, 8)
        codeGen.add_line("\tlea (" + str(self.scr_line_delta) + "*DST_LINE_LEN)(" + REG_A2 + ")," + REG_A2, 8)

        for word in self.words:
            word.write_code(codeGen)

        codeGen.end_section()


# Original Map = 640/1520
# Map Line = 60
# Char Size = 25x30
# Screen = 1065 x 511 (equiv 400x200 ou 560*272)
# Base = 1000 Height= 400 TopW=220
# Objective= 400*210(ou160) / TopW=90

BK_IMG = ".\\data\\Crawl_full2.png"
MAP_IMG: str = ".\\data\\crawl.png"

SKY_IMG = ".\\data\\Stars6_400_273_red4_Line.png"

COL_WHITE = (255, 255, 255)
COL_BLACK = (0, 0, 0)
COL_BLUE1 = (0, 0, 120)
COL_GREY1 = (125, 125, 125)
COL_GREY2 = (0, 255, 0)
COL_GREY1T = (125, 125, 125, 30)
COL_YELLOW_STARWARS_TRUE = (229, 177, 58)
COL_YELLOW_STARWARS = (
    240, 224, 128)  # More like Episode 5 (252, 239, 139), Multiple of 16 to be compatible with STE palette

ZOOM = 2

FNT_ZOOM_Y = 2

FNT_NAME = "lucidaconsole"
FNT_ANTI_ALIAS = 0

FNT_SIZE = 26  # Found using FontCrawl.py
FNT_BOLD = False
FNT_X_SIZE = 16
FNT_Y0_SIZE = 24
FNT_Y_SIZE = FNT_Y0_SIZE * FNT_ZOOM_Y
LINE_Y_SPACE = 8
FNT_Y_STEP = 1

CAR_NEWLINE = chr(255)
CAR_SPACE = " "

SAMPLE_TEXT_OLD = "Episode IX" + CAR_NEWLINE * 2 + "THE RISE OF SKYWALKER" + CAR_NEWLINE * 2 + \
                  "The dead speak! The galaxy has heard a mysterious broadcast, a threat of REVENGE in the sinister " \
                  "voice of the late EMPEROR PALPATINE. GENERAL LEIA ORGANA dispatches secret agents to gather " \
                  "intelligence, while REY, the last hope of the Jedi, trains for battle against the diabolical FIRST " \
                  "ORDER. Meanwhile, Supreme Leader KYLO REN rages in search of the phantom Emperor, determined to " \
                  "destroy any threat to his power.... " \
                  + CAR_NEWLINE * 20

SAMPLE_TEXT = "Episode II" + CAR_NEWLINE * 2 + \
              "THE ARCTIC LAND AWAKENS" + CAR_NEWLINE * 2 + \
              "The galaxy has heard of a" + CAR_NEWLINE + \
              "return  in the  demoscene" + CAR_NEWLINE + \
              "world.  Twenty five years" + CAR_NEWLINE + \
              "after  having   abandoned" + CAR_NEWLINE + \
              "their Falcon,  the really" + CAR_NEWLINE + \
              "mega unknown T.AL band is" + CAR_NEWLINE + \
              "back in its STE ship.    " + CAR_NEWLINE * 2 + \
              "Hidden  in a distant  arm" + CAR_NEWLINE + \
              "of the galaxy, and acting" + CAR_NEWLINE + \
              "almost  secretly  in  the" + CAR_NEWLINE + \
              "ATARI   Rebel    Alliance" + CAR_NEWLINE + \
              "during all the old period" + CAR_NEWLINE + \
              "of  the  Demos  War,  the" + CAR_NEWLINE + \
              "Commander UKO has decided" + CAR_NEWLINE + \
              "to  strike  back  and  to" + CAR_NEWLINE + \
              "finally end  the sinister" + CAR_NEWLINE + \
              "curse  of the  unfinished" + CAR_NEWLINE + \
              "demos.                   " + CAR_NEWLINE * 2 + \
              "The  Arctic  Land is back" + CAR_NEWLINE + \
              "for  a  last  move !  Hey" + CAR_NEWLINE + \
              "ZPK, it is fun to go back" + CAR_NEWLINE + \
              "to these amazing times of" + CAR_NEWLINE + \
              "coding ! May the Force be" + CAR_NEWLINE + \
              "with you !               " + CAR_NEWLINE + \
              CAR_NEWLINE * 20

CHAR_LIST = (
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
    "W",
    "X", "Y", "Z",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
    "w",
    "x", "y", "z",
    "!", ".", ",", CAR_SPACE)

EXPORT_PATH = "D:\\Computer\\Atari\\Sources\\Ressources\\"
FONT_FILE = "SWFONT.bin"
FONT_LINES_FILE = "SWFONT_L.bin"
SWC_TEXT_FILE = "SWCTEXT.bin"
SWC_ASM_FILE = "SWCPROJ.s"


def my_main():
    # Inits
    pygame.init()

    # Projection parameters
    # Screen Size (pixels)
    scrXsize = 400
    scrYsize = 272
    # Viewer Position (pixels)
    viewXpos = scrXsize / 2
    viewYpos = -26
    viewZpos = -550
    # Map area
    mapXsize = scrXsize
    # mapZsize = int(mapXsize * 1520 / 640) * 2
    mapZsize = 1045

    mapDYpos = 0
    mapDZpos = 0
    # Font
    fntXSize = 16
    fntYSize = 30
    fntYSpace = 15

    # Intermediate variables
    winXsize = int(scrXsize * 1.2)
    winYsize = int(scrYsize * 1.2)

    # Open window
    win: pygame.Surface = pygame.display.set_mode((winXsize * ZOOM, winYsize * ZOOM), flags=pygame.DOUBLEBUF)

    # Background image
    bk_img = pygame.image.load(BK_IMG)
    bk_ratio = bk_img.get_height() / bk_img.get_width()
    zi_h = int(scrXsize * bk_ratio)
    zoomed_img = pygame.transform.scale(bk_img, (scrXsize * ZOOM, zi_h * ZOOM))
    bk_img = zoomed_img

    # Sky image
    if SKY_IMG != "":
        sky_img = pygame.image.load(SKY_IMG)
        sky_img = pygame.transform.scale(sky_img, (scrXsize * ZOOM, scrYsize * ZOOM))
    else:
        sky_img = None

    # Map image
    map_img = pygame.image.load(MAP_IMG)

    # render font & text
    nb_chars_per_line = int(scrXsize / FNT_X_SIZE)
    get_nb_cars(SAMPLE_TEXT)
    font_map = renderFonts(win)
    sampleText = format_text(SAMPLE_TEXT, nb_chars_per_line)
    print(sampleText)
    get_nb_cars(SAMPLE_TEXT)

    # Infinite Loop
    exitLoop = 0
    firstLoop = 1
    firstLineHeight = 0
    keyPressed = set()
    displayMode = 2
    scrollStep = 0
    textStep = 0
    doScroll = False
    projMode = 0
    charProjTable = None
    lineProjTable = None
    mapLineTable = None
    nbFadeLines = 50
    nbFadeShifts = 10

    min_col_size = 0

    clock = pygame.time.Clock()

    while not exitLoop:
        # Events Management
        for event in pygame.event.get():
            # print(event)
            if event.type == pygame.QUIT:
                exitLoop = 1
                break
            elif event.type == pygame.KEYDOWN:
                keyPressed.add(event.key)
            elif event.type == pygame.KEYUP:
                keyPressed.remove(event.key)

        # Manage pressed keys
        keyManaged = 0
        for keyNumber in keyPressed:
            keyManaged += 1
            if keyNumber == 114:  # R key
                viewYpos += 1
            elif keyNumber == 102:  # F key
                viewYpos -= 1
            elif keyNumber == 116:  # T key
                viewZpos -= 1
            elif keyNumber == 103:  # G key
                viewZpos += 1
            elif keyNumber == 117:  # U key
                mapZsize += fntYSize + fntYSpace
            elif keyNumber == 106:  # J key
                mapZsize -= fntYSize + fntYSpace
            elif keyNumber == 48:  # 0 key
                # Default projection parameters
                scrXsize = 400
                scrYsize = 272
                viewXpos = scrXsize / 2
                viewYpos = 0
                viewZpos = -430
                mapXsize = scrXsize
                mapZsize = int(mapXsize * 1520 / 640 * 1.3)
                mapDYpos = 0
                mapDZpos = 0
            elif keyNumber == 49:  # 1 key
                # Preset 1
                scrXsize = 400
                scrYsize = 272
                viewXpos = scrXsize / 2
                viewYpos = 50
                viewZpos = -430
                mapXsize = scrXsize
                mapZsize = int(mapXsize * 1520 / 640 * 1.30)
                mapDYpos = 0
                mapDZpos = 0
            elif 256 <= keyNumber <= 258:  # Keypad numbers
                displayMode = keyNumber - 256
                scrollStep = 0
            elif keyNumber == 266:  # Keypad .
                doScroll = not doScroll
                pygame.time.wait(100)
            elif keyNumber == 271:  # Keypad Enter
                projMode = (projMode + 1) % 3
                print("ProjMode:", projMode)
                pygame.time.wait(100)
            elif keyNumber == 92:  # * Main
                print("FPS:", clock.get_fps())
            elif keyNumber == 105:  # I
                nbFadeLines += 1
            elif keyNumber == 107:  # K
                nbFadeLines -= 1
            elif keyNumber == 111:  # O
                nbFadeShifts += 1
            elif keyNumber == 108:  # L
                nbFadeShifts -= 1
            elif keyNumber == 115:  # S key
                save_font(win, min_col_size, sampleText)
                keyManaged = 0
            elif keyNumber == 99:  # C key
                generate_proj_code(hiLine, charProjTable, mapLineTable, mapXsize)
                keyManaged = 0
            elif keyNumber == 27:  # ESC key
                exitLoop = True
                keyManaged = 0
            else:
                keyManaged = 0
                print(keyNumber)

            if keyManaged:
                charProjTable = None

        # Force mapXsize to be multiples of fntSize
        mapXsize = round(mapXsize / fntXSize) * fntXSize
        mapDXpos = (scrXsize - mapXsize) / 2

        # Computes some useful vars
        deltaX = int((winXsize - scrXsize) / 2)
        deltaY = int((winYsize - scrYsize) / 2)
        loLine = int(getScrLineFromMapLine(0, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos)) - 1
        hiLine = int(getScrLineFromMapLine(mapZsize, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos)) - 1
        loLX = getLeftXFromMapLine(0, viewXpos, viewZpos, mapDXpos, mapDZpos)
        hiLX = getLeftXFromMapLine(mapZsize, viewXpos, viewZpos, mapDXpos, mapDZpos)
        loRX = getRightXFromMapLine(0, viewXpos, viewZpos, mapDXpos, mapDZpos, mapXsize)
        hiRX = getRightXFromMapLine(mapZsize, viewXpos, viewZpos, mapDXpos, mapDZpos, mapXsize)
        totalHeight = scrYsize - hiLine

        # Display the contents
        nbCols = 0
        nbLines = 0

        win.fill(COL_WHITE)
        pygame.draw.rect(win, COL_BLACK, (deltaX * ZOOM, deltaY * ZOOM, scrXsize * ZOOM, scrYsize * ZOOM),
                         0)  # The screen
        pygame.draw.circle(win, COL_BLUE1, (int(deltaX + viewXpos) * ZOOM, int(deltaY + viewYpos) * ZOOM),
                           5, 1)  # The viewer (conversion to int required surprisingly...)
        pygame.draw.rect(win, COL_BLUE1, (10 * ZOOM, (winYsize - 10) * ZOOM, -viewZpos * ZOOM, 1), 1)

        if displayMode == 0:
            firstLineHeight, nbCols, nbLines = display_sw_grid(deltaX, deltaY, fntXSize, fntYSize,
                                                               fntYSpace, hiLX,
                                                               hiLine, hiRX,
                                                               loLX, loLine, loRX, mapDXpos, mapDYpos, mapDZpos,
                                                               mapXsize,
                                                               mapZsize, scrXsize, scrYsize, viewXpos, viewYpos,
                                                               viewZpos, win, winYsize, zi_h, bk_img)
        elif displayMode == 1:
            display_sw_bitmap(deltaX, deltaY,
                              hiLine, loLine, mapDXpos, mapDYpos, mapDZpos,
                              mapXsize,
                              scrXsize, scrYsize, viewXpos, viewYpos,
                              viewZpos, win, winYsize, map_img, scrollStep, projMode)
            if doScroll:
                scrollStep += 1
                # VBL 50Hz
                clock.tick(25)

        elif displayMode == 2:
            if charProjTable is None:
                charProjTable, lineProjTable, min_col_size, mapLineTable = compute_char_projection(hiLine, loLine,
                                                                                                   mapDXpos, mapDYpos,
                                                                                                   mapDZpos,
                                                                                                   mapXsize,
                                                                                                   scrXsize, scrYsize,
                                                                                                   viewXpos,
                                                                                                   viewYpos,
                                                                                                   viewZpos)
            if sky_img is not None:
                win.blit(sky_img, (deltaX, deltaY))

            display_sw_text(deltaX, deltaY, hiLine, loLine, win, scrollStep, textStep, charProjTable, lineProjTable,
                            font_map, sampleText)

            display_colorfade_ste(win, deltaX, deltaY, hiLine, loLine, nbFadeLines, nbFadeShifts)

            if doScroll:
                scrollStep += 1
                if scrollStep >= FNT_Y_SIZE + LINE_Y_SPACE:
                    scrollStep = 0
                    textStep += 1
                # VBL 50Hz
                clock.tick(50)

        pygame.display.update()

        # Manage key repeats
        if keyManaged or firstLoop:
            print('Screen Size X,Y: ({0},{1}) ;'.format(scrXsize, scrYsize), end=' ')
            print('Viewer Position: ({0},{1},{2}) ;'.format(viewXpos, viewYpos, viewZpos), end=' ')
            print('Map Size X,Z: ({0},{1}) ;'.format(mapXsize, mapZsize), end=' ')
            print('Map Position Y,Z: ({0},{1}) ;'.format(mapDYpos, mapDZpos), end=' ')
            print('First Row, Total Height: {0},{1} ;'.format(firstLineHeight, totalHeight), end=' ')
            print('Nb Cols, Lines: {0},{1} ;'.format(nbCols, nbLines), end=' ')
            print()

            print("Displayed size (Base, Height, TopW);", loRX - loLX + 1, abs(hiLine - loLine) + 1, hiRX - hiLX + 1)

            print(" Map lines :", end="")
            for scrLine in range(int(loLine), int(hiLine), -1):
                mapLine = int(getMapLineFromScrLine(scrLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos))
                print(mapLine, ",", end="")
            print()

            print("Fade: Nblines", nbFadeLines, "Shifts:", nbFadeShifts)
            print("Min Col Size :", min_col_size)

            pygame.time.wait(50)

        firstLoop = 0

    pygame.quit()


def display_sw_grid(deltaX, deltaY, fntXSize, fntYSize, fntYSpace, hiLX, hiLine, hiRX, loLX, loLine,
                    loRX, mapDXpos,
                    mapDYpos, mapDZpos, mapXsize, mapZsize, scrXsize, scrYsize, viewXpos, viewYpos, viewZpos,
                    win, winYsize, zi_h, bk_img):
    win.fill(COL_WHITE)
    # Bk
    win.blit(bk_img, (deltaX * ZOOM, (deltaY + scrYsize - zi_h) * ZOOM))

    pygame.draw.rect(win, COL_BLACK, (deltaX * ZOOM, deltaY * ZOOM, scrXsize * ZOOM, scrYsize * ZOOM),
                     1)  # The screen
    pygame.draw.circle(win, COL_BLUE1, (int(deltaX + viewXpos) * ZOOM, int(deltaY + viewYpos) * ZOOM),
                       5, 1)  # The viewer (conversion to int required surprisingly...)
    pygame.draw.rect(win, COL_BLUE1, (10 * ZOOM, (winYsize - 10) * ZOOM, -viewZpos * ZOOM, 1), 1)

    pygame.draw.polygon(win, COL_GREY1,
                        [((deltaX + hiLX) * ZOOM, (deltaY + hiLine) * ZOOM),
                         ((deltaX + hiRX) * ZOOM, (deltaY + hiLine) * ZOOM),
                         ((deltaX + loRX) * ZOOM, (deltaY + loLine) * ZOOM),
                         ((deltaX + loLX) * ZOOM, (deltaY + loLine) * ZOOM)], 1)
    # Display intermediate lines
    nbLines = 0
    for mapLine in range(fntYSize, mapZsize - 1, fntYSize + fntYSpace):
        # print("Map line",mapLine)
        col = COL_GREY1
        for loopLine in (mapLine, mapLine + fntYSpace):
            # print(loopLine)
            curLine = getScrLineFromMapLine(loopLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos)
            chkMapLine = getMapLineFromScrLine(curLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos)
            if round(chkMapLine) != loopLine:
                print("Error checking mapLine: ", loopLine, chkMapLine)
            curLX = getLeftXFromMapLine(loopLine, viewXpos, viewZpos, mapDXpos, mapDZpos)
            curRX = getRightXFromMapLine(loopLine, viewXpos, viewZpos, mapDXpos, mapDZpos, mapXsize)
            pygame.draw.rect(win, col,
                             ((deltaX + curLX) * ZOOM, (deltaY + curLine) * ZOOM, (curRX - curLX) * ZOOM, 1), 1)
            col = COL_GREY2
        if mapLine == fntYSize:
            firstLineHeight = scrYsize - round(curLine)
        nbLines += 1

    # Display intermediate columns
    nbCols = 0
    for mapCol in range(0, mapXsize, fntXSize):
        loX = getXFromMapLineAndMapXcol(0, mapCol, viewXpos, viewZpos, mapDXpos, mapDZpos)
        hiX = getXFromMapLineAndMapXcol(mapZsize, mapCol, viewXpos, viewZpos, mapDXpos, mapDZpos)
        pygame.draw.line(win, COL_GREY1,
                         ((deltaX + loX) * ZOOM, (deltaY + loLine) * ZOOM),
                         ((deltaX + hiX) * ZOOM, (deltaY + hiLine) * ZOOM), 1)
        nbCols += 1
    return firstLineHeight, nbCols, nbLines


def display_sw_bitmap(deltaX, deltaY, hiLine, loLine, mapDXpos,
                      mapDYpos, mapDZpos, mapXsize, scrXsize, scrYsize, viewXpos, viewYpos, viewZpos,
                      win, winYsize, map_img, scrollStep, projMode):
    map_h = map_img.get_height()
    map_w = map_img.get_width()

    prevSourceLine = 0
    for scrLine in range(int(loLine), int(hiLine), -1):
        mapLine = int(getMapLineFromScrLine(scrLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos))

        LX = int(getLeftXFromMapLine(mapLine, viewXpos, viewZpos, mapDXpos, mapDZpos))
        RX = int(getRightXFromMapLine(mapLine, viewXpos, viewZpos, mapDXpos, mapDZpos, mapXsize))

        sourceLine = map_h - ((mapLine - int(scrollStep)) % map_h) - 1
        if projMode == 0:
            bitmapLine = map_img.subsurface((0, sourceLine, map_w, 1))
            scaledLine = pygame.transform.scale(bitmapLine, ((RX - LX + 1), 1))
        elif projMode == 1:
            bitmapLine = map_img.subsurface((0, sourceLine, map_w, prevSourceLine - sourceLine))
            scaledLine = pygame.transform.scale(bitmapLine, ((RX - LX + 1), ZOOM))
        elif projMode == 2:
            bitmapLine = map_img.subsurface((0, sourceLine, map_w, 1))
            scaledLine = bitmapLine
            LX = 0

        scaledLine = pygame.transform.scale(scaledLine, (scaledLine.get_width() * ZOOM, ZOOM))
        win.blit(scaledLine, ((deltaX + LX) * ZOOM, (deltaY + scrLine) * ZOOM))
        prevSourceLine = sourceLine
    return


def display_sw_text(deltaX, deltaY, hiLine, loLine, win, scrollStep, textStep, charProjTable, lineProjTable,
                    font_car_map, sampleText):
    y = (deltaY + hiLine) * ZOOM
    nbLines = len(charProjTable)
    table_line = lineProjTable[scrollStep]
    nbCols = len(charProjTable[0])

    for line in range(0, nbLines):
        char_line = table_line[line][0]
        proj_line = charProjTable[line]

        if char_line >= 0:
            txt_line = table_line[line][1]
            txt_line_contents = sampleText[(txt_line + textStep) % len(sampleText)]

            x = (deltaX + proj_line[0]) * ZOOM

            for iCol in range(1, nbCols):
                colSize = proj_line[iCol]
                car_display = txt_line_contents[iCol - 1]
                bitmapLine = font_car_map[car_display][colSize][char_line]
                win.blit(bitmapLine, (x, y))
                x += colSize * ZOOM

        y += ZOOM
    return


def compute_char_projection(hiLine, loLine, mapDXpos,
                            mapDYpos, mapDZpos, mapXsize, scrXsize, scrYsize, viewXpos, viewYpos, viewZpos):
    proj_table = []
    line_table = []
    map_line_table = []

    pos_stats = {}

    min_col_size = 0

    # Compute X projections
    print("X projection table")
    for scrLine in range(int(hiLine), int(loLine) + 1, 1):
        proj_line = []
        mapLine = int(getMapLineFromScrLine(scrLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos))

        lX = int(getXFromMapLineAndMapXcol(mapLine, 0, viewXpos, viewZpos, mapDXpos, mapDZpos))
        proj_line.append(lX)

        for mapCol in range(FNT_X_SIZE, mapXsize + FNT_X_SIZE, FNT_X_SIZE):
            rX = int(getXFromMapLineAndMapXcol(mapLine, mapCol - 1, viewXpos, viewZpos, mapDXpos, mapDZpos))
            colSize = rX - lX + 1
            proj_line.append(colSize)

            if colSize not in pos_stats:
                pos_stats[colSize] = {}

            shift = lX % 16
            pos_stats[colSize][shift] = 1

            lX = rX + 1

        proj_table.append(proj_line)
        map_line_table.append(mapLine // 2)
        # map_line_table.append(mapLine)
        print(scrLine, mapLine, proj_line)

    print("Stats of positions per size")
    for colSize in pos_stats.keys():
        print(colSize, len(pos_stats[colSize].keys()), pos_stats[colSize].keys())
    min_col_size = min(pos_stats.keys())

    # Compute source mapping
    print("Source mapping projection: ")
    mapLine = int(getMapLineFromScrLine(int(hiLine), viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos))
    maxTxtLines = int((mapLine + 1) / (FNT_Y_SIZE + LINE_Y_SPACE))

    for step in range(0, FNT_Y_SIZE + LINE_Y_SPACE):
        nbBlankLines = 0
        step_line = []
        for scrLine in range(int(hiLine), int(loLine) + 1, 1):
            table_line = []
            mapLine = int(getMapLineFromScrLine(scrLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos))
            mapLine += FNT_Y_SIZE + LINE_Y_SPACE - 1
            mapLine -= step

            charLine = mapLine % (FNT_Y_SIZE + LINE_Y_SPACE)
            txtLine = maxTxtLines - int(mapLine / (FNT_Y_SIZE + LINE_Y_SPACE)) + 1

            if charLine >= FNT_Y_SIZE:
                charLine = -1
                table_line.append(charLine)
                nbBlankLines += 1
            else:
                charLine = int((FNT_Y_SIZE - charLine - 1) / FNT_ZOOM_Y)
                table_line.append(charLine)
                table_line.append(txtLine)

            step_line.append(table_line)
        print("Step #", step, "First line:", step_line[0], "Last line: ", table_line, "Nb blank lines:", nbBlankLines)
        line_table.append(step_line)

    return proj_table, line_table, min_col_size, map_line_table


def display_colorfade(win, deltaX, deltaY, hiLine, loLine, nbLines):
    pygame.draw.rect(win, COL_YELLOW_STARWARS, (
        deltaX / 4 * ZOOM, (deltaY + hiLine + nbLines) * ZOOM, 2 * deltaX / 4 * ZOOM,
        (loLine - hiLine - nbLines) * ZOOM))

    step = [0, 0, 0]
    curCol = [0, 0, 0]
    w_zone = int((win.get_width() / ZOOM - 2 * deltaX))
    for i in range(0, 3):
        step[i] = COL_YELLOW_STARWARS[i] / nbLines
        curCol[i] = COL_YELLOW_STARWARS[i]

    for line in range(0, nbLines):
        for i in range(0, 3):
            curCol[i] -= step[i]
        line = int((deltaY + hiLine + nbLines - line - 1) * ZOOM)
        pygame.draw.rect(win, curCol, (
            deltaX / 4 * ZOOM, line, 2 * deltaX / 4 * ZOOM,
            ZOOM))
        for x in range(0, w_zone):
            xzoom = int((deltaX + x) * ZOOM)

            if win.get_at((xzoom, line)) != COL_BLACK:
                for dx in range(0, ZOOM):
                    for dy in range(0, ZOOM):
                        win.set_at((xzoom + dx, line + dy), curCol)

    return


def display_colorfade_ste(win, deltaX, deltaY, hiLine, loLine, nbLines, nbShifts):
    pygame.draw.rect(win, COL_YELLOW_STARWARS, (
        deltaX / 4 * ZOOM, (deltaY + hiLine + nbLines) * ZOOM, 2 * deltaX / 4 * ZOOM,
        (loLine - hiLine - nbLines) * ZOOM))

    step = [0, 0, 0]
    curCol = [0, 0, 0]
    curStep = [0, 0, 0]
    w_zone = int((win.get_width() / ZOOM - 2 * deltaX))
    for i in range(0, 3):
        delta = COL_YELLOW_STARWARS[i] / nbLines
        step[i] = int(16 / delta)  # 16 levels for STE
        curCol[i] = COL_YELLOW_STARWARS[i]

    for line in range(0, nbLines):
        for i in range(0, 3):
            curStep[i] += 1
            if curStep[i] >= step[i]:
                curCol[i] = max(curCol[i] - 16, 0)
                curStep[i] = 0
        line = int((deltaY + hiLine + nbLines - nbShifts - line - 1) * ZOOM)
        pygame.draw.rect(win, curCol, (
            deltaX / 4 * ZOOM, line, 2 * deltaX / 4 * ZOOM,
            ZOOM))
        for x in range(0, w_zone):
            xzoom = int((deltaX + x) * ZOOM)

            if win.get_at((xzoom, line)) != COL_BLACK:
                for dx in range(0, ZOOM):
                    for dy in range(0, ZOOM):
                        win.set_at((xzoom + dx, line + dy), curCol)

    return


def getScrLineFromMapLine(mapLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos):
    scrLine = viewYpos + (-viewZpos * (scrYsize + mapDYpos - viewYpos)) / (mapDZpos - viewZpos + mapLine)
    return scrLine


def getLeftXFromMapLine(mapLine, viewXpos, viewZpos, mapDXpos, mapDZpos):
    leftX = viewXpos - (-viewZpos * (viewXpos - mapDXpos)) / (-viewZpos + mapDZpos + mapLine)
    return leftX


def getRightXFromMapLine(mapLine, viewXpos, viewZpos, mapDXpos, mapDZpos, mapXsize):
    rightX = viewXpos + (-viewZpos * (-viewXpos + mapDXpos + mapXsize)) / (-viewZpos + mapDZpos + mapLine)
    return rightX


def getXFromMapLineAndMapXcol(mapLine, mapXcol, viewXpos, viewZpos, mapDXpos, mapDZpos):
    X = (viewXpos * (mapDZpos + mapLine) - viewZpos * (mapDXpos + mapXcol)) / (-viewZpos + mapDZpos + mapLine)
    return X


def getmapXcolFromMapLineAndX(mapLine, X, viewXpos, viewZpos, mapDXpos, mapDZpos):
    mapXcol = (viewXpos * (mapDZpos + mapLine) - X * (-viewZpos + mapDZpos + mapLine) - viewZpos * mapDXpos) / viewZpos
    return mapXcol


def getMapLineFromScrLine(scrLine, viewYpos, viewZpos, scrYsize, mapDYpos, mapDZpos):
    mapLine = (-viewZpos * (scrYsize + mapDYpos - viewYpos)) / (scrLine - viewYpos) + viewZpos - mapDZpos
    return mapLine


def get_x_reduced_pixels(w_init, red):
    ret_array = [False] * w_init

    w_final = w_init - red
    if w_final > 0:
        step = w_init / w_final

        x = 0
        while int(round(x)) < w_init:
            ret_array[int(round(x))] = True
            x += step
    return ret_array


def setZoomPoint(surf, x, y, val):
    for dx in range(0, ZOOM):
        for dy in range(0, ZOOM):
            surf.set_at((x * ZOOM + dx, y * ZOOM + dy), val)


def renderFonts(win):
    font_car_map = {}

    # Get font
    curFontName = pygame.font.match_font(FNT_NAME, bold=FNT_BOLD)
    curFont = pygame.font.Font(curFontName, FNT_SIZE)
    if curFont.get_bold() != FNT_BOLD:
        curFont.set_bold(FNT_BOLD)

    src_img: pygame.Surface = pygame.Surface((FNT_X_SIZE, FNT_Y0_SIZE))
    for car in CHAR_LIST:

        if car != CAR_NEWLINE:
            src_img.fill(COL_BLACK)
            renderText = curFont.render(car, FNT_ANTI_ALIAS, COL_YELLOW_STARWARS)
            src_img.blit(renderText, (0, -FNT_Y_STEP))

            # if car == 'W':
            #     print(renderText.get_width())
            #     win.blit(src_img, (0, 0))
            #     pygame.display.update()
            #     pygame.time.wait(5000)

            size_map = {}
            for redX in range(0, FNT_X_SIZE):
                colSize = FNT_X_SIZE - redX
                dst_img: pygame.Surface = pygame.Surface((FNT_X_SIZE * ZOOM, FNT_Y0_SIZE * ZOOM))
                red_pix = get_x_reduced_pixels(FNT_X_SIZE, redX)
                x_dst = 0
                for x_src in range(0, FNT_X_SIZE):
                    if red_pix[x_src]:
                        for y in range(0, FNT_Y0_SIZE):
                            setZoomPoint(dst_img, x_dst, y, src_img.get_at((x_src, y)))
                        x_dst += 1

                line_map = {}
                for y in range(0, FNT_Y0_SIZE):
                    bitmapLine = dst_img.subsurface((0, y * ZOOM, colSize * ZOOM, ZOOM))
                    line_map[y] = bitmapLine

                size_map[colSize] = line_map

            font_car_map[car] = size_map

    # Stats
    line_values = {}
    for car in CHAR_LIST:
        # print("CHAR:", car)
        line_map = font_car_map[car][FNT_X_SIZE]
        for y in range(0, FNT_Y0_SIZE):
            line_key = ""
            for x_src in range(0, FNT_X_SIZE * ZOOM):
                if line_map[y].get_at((x_src, 0)) != COL_BLACK:
                    line_key += "1"
                else:
                    line_key += "0"
            # print(line_key)
            if line_key in line_values:
                line_values[line_key] += 1
            else:
                line_values[line_key] = 1
    print("FONT line keys", len(line_values), line_values)

    # # Little Test
    # # Display all chars
    # x_car = 0
    # y_car = 0
    # for car in CHAR_LIST:
    #     line_map = font_car_map[car][FNT_X_SIZE]
    #     for y in range(0, FNT_Y0_SIZE):
    #         win.blit(line_map[y], (x_car * ZOOM, (y_car + y) * ZOOM))
    #     x_car += FNT_X_SIZE
    #     if x_car > win.get_width() / ZOOM - FNT_X_SIZE:
    #         x_car = 0
    #         y_car += FNT_Y0_SIZE
    #
    # # Display all sizes for one char
    # y_car += FNT_Y0_SIZE
    # x_car = 0
    # for size in range(FNT_X_SIZE, 0, -1):
    #     line_map = font_car_map['A'][size]
    #     for y in range(0, FNT_Y0_SIZE):
    #         win.blit(line_map[y], (x_car * ZOOM, (y_car + y) * ZOOM))
    #     x_car += FNT_X_SIZE
    #
    # for y_car in range(1, 3):
    #     pygame.draw.rect(win, COL_GREY1T,
    #                      (0, (y_car * FNT_Y0_SIZE - 1) * ZOOM, (win.get_width()) * ZOOM, ZOOM))
    #
    # pygame.display.update()
    #
    # while not pygame.event.peek(pygame.KEYDOWN):
    #     pass

    return font_car_map


def center_line(line, nb_cars_per_line):
    nb_spaces = int((nb_cars_per_line - len(line)) / 2)
    line = " " * nb_spaces + line
    nb_ending_spaces = nb_cars_per_line - len(line)
    if nb_ending_spaces > 0:
        line += " " * nb_ending_spaces

    return line


def format_text(init_text, nb_cars_per_line):
    text_lines = []
    split_lines = init_text.split(CAR_NEWLINE)
    if len(split_lines) > 1:
        for line in split_lines:
            text_lines += format_text(line, nb_cars_per_line)
    else:
        if len(split_lines[0]) != nb_cars_per_line:
            split_words = split_lines[0].split()
            cur_line = ""
            for word in split_words:
                if len(cur_line) == 0:
                    cur_line = word
                else:
                    tmp_line = cur_line + " " + word
                    if len(tmp_line) < nb_cars_per_line:
                        cur_line = tmp_line
                    else:
                        text_lines.append(center_line(cur_line, nb_cars_per_line))
                        cur_line = word

            text_lines.append(center_line(cur_line, nb_cars_per_line))
        else:
            text_lines.append(split_lines[0])

    return text_lines


def get_nb_cars(text):
    cars = {}
    for car in text:
        cars[car] = "1"

    print(len(cars), cars)
    return


def save_font(win, min_col_size, sampleText):
    print("Saving FONT file...")
    print("Number of chars:", len(CHAR_LIST))
    print("Number of sizes:", FNT_X_SIZE - min_col_size + 1)

    # Get font
    curFontName = pygame.font.match_font(FNT_NAME, bold=FNT_BOLD)
    curFont = pygame.font.Font(curFontName, FNT_SIZE)
    if curFont.get_bold() != FNT_BOLD:
        curFont.set_bold(FNT_BOLD)

    src_img: pygame.Surface = pygame.Surface((FNT_X_SIZE, FNT_Y0_SIZE))

    # Look for all distinct char lines
    line_values = {}
    font_lines = {}
    for car in CHAR_LIST:
        car_lines = []
        src_img.fill(COL_BLACK)
        renderText = curFont.render(car, FNT_ANTI_ALIAS, COL_YELLOW_STARWARS)
        src_img.blit(renderText, (0, -FNT_Y_STEP))

        for y in range(0, FNT_Y0_SIZE):
            line_key = ""
            for x_src in range(0, FNT_X_SIZE):
                if src_img.get_at((x_src, y)) != COL_BLACK:
                    line_key += "1"
                else:
                    line_key += "0"

            if line_key not in line_values:
                line_img: pygame.Surface = pygame.Surface((FNT_X_SIZE, 1))
                line_img.blit(src_img.subsurface((0, y, FNT_X_SIZE, 1)), (0, 0))
                line_values[line_key] = line_img

            key_index = list(line_values.keys()).index(line_key)
            car_lines.append(key_index)

        # Automatically add line spaces to simplify ASM code
        for iSpace in range(0, int(LINE_Y_SPACE / 2)):
            car_lines.append(0)
        font_lines[car] = car_lines

    print("Number of individual font lines: ", len(line_values))

    # Debug
    # dbg_car_lines = font_lines['s']
    # iLine = 0
    # for line in dbg_car_lines:
    #     print(list(line_values.keys())[line])
    #     src_img.blit(list(line_values.values())[line], (0, iLine))
    #     iLine += 1
    # win.blit(src_img, (0,0))
    # pygame.display.update()
    # pygame.time.wait(2000)

    with open(EXPORT_PATH + FONT_LINES_FILE, "wb") as bf:
        for src_line_img in line_values.values():
            for redX in range(0, FNT_X_SIZE - min_col_size + 1):
                colSize = FNT_X_SIZE - redX
                red_pix = get_x_reduced_pixels(FNT_X_SIZE, redX)
                bitplanes = bytearray(2)
                x_dst = 0
                for x_src in range(0, FNT_X_SIZE):
                    if red_pix[x_src]:
                        i_bitplane = x_dst // 8
                        i_bit = x_dst % 8
                        if src_line_img.get_at((x_src, 0)) != COL_BLACK:
                            bitplanes[i_bitplane] |= (1 << (7 - i_bit))
                        x_dst += 1

                bf.write(bitplanes)

    bf.close()
    print("Font Lines binary file saved in", os.path.getsize(EXPORT_PATH + FONT_LINES_FILE), "bytes")

    with open(EXPORT_PATH + FONT_FILE, "wb") as bf:
        for car in CHAR_LIST:
            car_lines = font_lines[car]
            for line in car_lines:
                line_byte = bytearray(4)
                line_bin = dec2bin(line, 8)
                if car == 's':
                    print(line_bin, line)
                for i in range(0, 8):
                    if line_bin[i] == "1":
                        line_byte[3] |= 1 << (7 - i)
                bf.write(line_byte)

    bf.close()
    print("Font binary file saved in", os.path.getsize(EXPORT_PATH + FONT_FILE), "bytes")

    with open(EXPORT_PATH + SWC_TEXT_FILE, "wb") as bf:
        for txt_line in sampleText:
            for car in txt_line:
                car_byte = bytearray(4)
                car_index = CHAR_LIST.index(car)
                car_bin = dec2bin(car_index, 8)
                for i in range(0, 8):
                    if car_bin[i] == "1":
                        car_byte[3] |= 1 << (7 - i)
                bf.write(car_byte)

    bf.close()
    print("Text file saved in", os.path.getsize(EXPORT_PATH + SWC_TEXT_FILE), "bytes")

    return


def generate_proj_code(hiLine, charProjTable, mapLineTable, mapXsize):
    print("Generating ASM Projection code")
    st_screen = allocate_st_screen(hiLine, charProjTable, mapLineTable, mapXsize)
    codeGen = CodeGen(90 * 4, 90000)  # Split into sub sections of 90 NOPs, and align lines every xxx cycles

    codeGen.add_line("; Starwars Scroller projection code", 0)
    codeGen.add_line("; The Arctic Land 2020", 0)
    codeGen.add_line("", 0)
    codeGen.add_line("\tTEXT\n", 0)
    codeGen.add_line("\t; " + REG_D0 + " = reserved for mixing bitplan data", 0)
    codeGen.add_line("\t; " + REG_A0 + " = Map address", 0)
    codeGen.add_line("\t; " + REG_A1 + " = reserved for line address", 0)
    codeGen.add_line("\t; " + REG_A2 + " = Screen address", 0)
    codeGen.add_line("", 0)

    codeGen.startSlicing()
    for st_line in st_screen:
        st_line.write_code(codeGen)

    with open(EXPORT_PATH + SWC_ASM_FILE, "w") as tf:
        codeGen.write_to_file(tf)

    tf.close()
    print("ASM Projection Code file saved in", os.path.getsize(EXPORT_PATH + SWC_ASM_FILE), "bytes")


def allocate_st_screen(hiLine, charProjTable, mapLineTable, mapXsize):
    st_screen = []

    nbLines = len(charProjTable)
    nbCols = len(charProjTable[0])
    # nbCols = 21
    nbPixelsWords = mapXsize // 16

    scr_line_prev = 0
    map_line_prev = mapLineTable[0]

    for line in range(0, nbLines):
        proj_line = charProjTable[line]
        map_line = mapLineTable[line]
        scr_line = hiLine + line
        st_line = PixelsLine(line, nbPixelsWords, abs(scr_line - scr_line_prev), abs(map_line - map_line_prev))

        x = proj_line[0]

        # loop on "text" columns
        for iCol in range(1, nbCols):
            colSize = proj_line[iCol]

            # Compute position in ST line
            i_word = x // 16
            x_word = x % 16
            single_word = False
            if x_word + colSize <= 16:
                single_word = True

            word_cur: PixelsWord = st_line.words[i_word]
            word_next: PixelsWord = None
            if i_word < nbPixelsWords:
                word_next = st_line.words[i_word + 1]
            bp_cur: Bitplan = None
            bp_next: Bitplan = None

            if single_word:
                if not word_cur.bp1.is_used:
                    bp_cur = word_cur.bp1
                else:
                    if not word_cur.bp2.is_used:
                        bp_cur = word_cur.bp2
                    else:
                        bp_cur = Bitplan()
                        word_cur.bp_conflicts.append(bp_cur)

                if not bp_cur.set_single_word(iCol - 1, x_word, colSize):
                    print("Error set_single_word (line, col)", line, iCol - 1)

            else:
                if not word_cur.bp2.is_used:
                    bp_cur = word_cur.bp2
                else:
                    bp_cur = Bitplan()
                    word_cur.bp_conflicts.append(bp_cur)

                if not bp_cur.set_dual_word(iCol - 1, x_word, colSize):
                    print("Error set_dual_word (line, col)", line, iCol - 1)

                if not word_next is None:
                    bp_next = word_next.bp1
                    if not bp_next.set_ending_word():
                        print("Error set_ending_word (line, col)", line, iCol - 1)
                else:
                    print("Missing word (line, col)", line, iCol - 1)

            # Next col
            x += colSize

        st_screen.append(st_line)
        scr_line_prev = scr_line
        map_line_prev = map_line
        st_line.debug()

    return st_screen


def dec2bin(d, nb=0):
    """dec2bin(d,nb=0): conversion nombre entier positif ou nul -> chaîne binaire
    (si nb>0, complète à gauche par des zéros)"""
    if d == 0:
        b = "0"
    else:
        b = ""
        while d != 0:
            b = "01"[d & 1] + b
            d = d >> 1
    return b.zfill(nb)


# Main call
my_main()
