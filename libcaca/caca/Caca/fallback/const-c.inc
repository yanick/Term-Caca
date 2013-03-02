#define PERL_constant_NOTFOUND	1
#define PERL_constant_NOTDEF	2
#define PERL_constant_ISIV	3
#define PERL_constant_ISNO	4
#define PERL_constant_ISNV	5
#define PERL_constant_ISPV	6
#define PERL_constant_ISPVN	7
#define PERL_constant_ISSV	8
#define PERL_constant_ISUNDEF	9
#define PERL_constant_ISUV	10
#define PERL_constant_ISYES	11

#ifndef NVTYPE
typedef double NV; /* 5.6 and later define NVTYPE, and typedef NV to it.  */
#endif
#ifndef aTHX_
#define aTHX_ /* 5.6 or later define this for threading support.  */
#endif
#ifndef pTHX_
#define pTHX_ /* 5.6 or later define this for threading support.  */
#endif

static int
constant_9 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_BLUE CACA_BOLD CACA_CYAN CUCUL_RED */
  /* Offset 6 gives the best switch position.  */
  switch (name[6]) {
  case 'L':
    if (memEQ(name, "CACA_BLUE", 9)) {
    /*                     ^        */
      *iv_return = CACA_BLUE;
      return PERL_constant_ISIV;
    }
    break;
  case 'O':
    if (memEQ(name, "CACA_BOLD", 9)) {
    /*                     ^        */
      *iv_return = CACA_BOLD;
      return PERL_constant_ISIV;
    }
    break;
  case 'R':
    if (memEQ(name, "CUCUL_RED", 9)) {
    /*                     ^        */
#ifdef CUCUL_RED
      *iv_return = CUCUL_RED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'Y':
    if (memEQ(name, "CACA_CYAN", 9)) {
    /*                     ^        */
      *iv_return = CACA_CYAN;
      return PERL_constant_ISIV;
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_10 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_BLACK CACA_BLINK CACA_BROWN CACA_GREEN CACA_WHITE CUCUL_BLUE
     CUCUL_BOLD CUCUL_CYAN cucul_blit cucul_flip cucul_flop cucul_rand */
  /* Offset 8 gives the best switch position.  */
  switch (name[8]) {
  case 'A':
    if (memEQ(name, "CUCUL_CYAN", 10)) {
    /*                       ^        */
#ifdef CUCUL_CYAN
      *iv_return = CUCUL_CYAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'C':
    if (memEQ(name, "CACA_BLACK", 10)) {
    /*                       ^        */
      *iv_return = CACA_BLACK;
      return PERL_constant_ISIV;
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_GREEN", 10)) {
    /*                       ^        */
      *iv_return = CACA_GREEN;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CUCUL_BOLD", 10)) {
    /*                       ^        */
#ifdef CUCUL_BOLD
      *iv_return = CUCUL_BOLD;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "CACA_BLINK", 10)) {
    /*                       ^        */
      *iv_return = CACA_BLINK;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CACA_WHITE", 10)) {
    /*                       ^        */
      *iv_return = CACA_WHITE;
      return PERL_constant_ISIV;
    }
    break;
  case 'U':
    if (memEQ(name, "CUCUL_BLUE", 10)) {
    /*                       ^        */
#ifdef CUCUL_BLUE
      *iv_return = CUCUL_BLUE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'W':
    if (memEQ(name, "CACA_BROWN", 10)) {
    /*                       ^        */
      *iv_return = CACA_BROWN;
      return PERL_constant_ISIV;
    }
    break;
  case 'i':
    if (memEQ(name, "cucul_blit", 10)) {
    /*                       ^        */
#ifdef cucul_blit
      *iv_return = cucul_blit;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_flip", 10)) {
    /*                       ^        */
#ifdef cucul_flip
      *iv_return = cucul_flip;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_rand", 10)) {
    /*                       ^        */
#ifdef cucul_rand
      *iv_return = cucul_rand;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'o':
    if (memEQ(name, "cucul_flop", 10)) {
    /*                       ^        */
#ifdef cucul_flop
      *iv_return = cucul_flop;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_11 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_KEY_F1 CACA_KEY_F2 CACA_KEY_F3 CACA_KEY_F4 CACA_KEY_F5 CACA_KEY_F6
     CACA_KEY_F7 CACA_KEY_F8 CACA_KEY_F9 CACA_KEY_UP CACA_YELLOW CUCUL_BLACK
     CUCUL_BLINK CUCUL_BROWN CUCUL_GREEN CUCUL_WHITE */
  /* Offset 10 gives the best switch position.  */
  switch (name[10]) {
  case '1':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         1      */
      *iv_return = CACA_KEY_F1;
      return PERL_constant_ISIV;
    }
    break;
  case '2':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         2      */
      *iv_return = CACA_KEY_F2;
      return PERL_constant_ISIV;
    }
    break;
  case '3':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         3      */
      *iv_return = CACA_KEY_F3;
      return PERL_constant_ISIV;
    }
    break;
  case '4':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         4      */
      *iv_return = CACA_KEY_F4;
      return PERL_constant_ISIV;
    }
    break;
  case '5':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         5      */
      *iv_return = CACA_KEY_F5;
      return PERL_constant_ISIV;
    }
    break;
  case '6':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         6      */
      *iv_return = CACA_KEY_F6;
      return PERL_constant_ISIV;
    }
    break;
  case '7':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         7      */
      *iv_return = CACA_KEY_F7;
      return PERL_constant_ISIV;
    }
    break;
  case '8':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         8      */
      *iv_return = CACA_KEY_F8;
      return PERL_constant_ISIV;
    }
    break;
  case '9':
    if (memEQ(name, "CACA_KEY_F", 10)) {
    /*                         9      */
      *iv_return = CACA_KEY_F9;
      return PERL_constant_ISIV;
    }
    break;
  case 'E':
    if (memEQ(name, "CUCUL_WHIT", 10)) {
    /*                         E      */
#ifdef CUCUL_WHITE
      *iv_return = CUCUL_WHITE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'K':
    if (memEQ(name, "CUCUL_BLAC", 10)) {
    /*                         K      */
#ifdef CUCUL_BLACK
      *iv_return = CUCUL_BLACK;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_BLIN", 10)) {
    /*                         K      */
#ifdef CUCUL_BLINK
      *iv_return = CUCUL_BLINK;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "CUCUL_BROW", 10)) {
    /*                         N      */
#ifdef CUCUL_BROWN
      *iv_return = CUCUL_BROWN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_GREE", 10)) {
    /*                         N      */
#ifdef CUCUL_GREEN
      *iv_return = CUCUL_GREEN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'P':
    if (memEQ(name, "CACA_KEY_U", 10)) {
    /*                         P      */
      *iv_return = CACA_KEY_UP;
      return PERL_constant_ISIV;
    }
    break;
  case 'W':
    if (memEQ(name, "CACA_YELLO", 10)) {
    /*                         W      */
      *iv_return = CACA_YELLOW;
      return PERL_constant_ISIV;
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_12 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_DEFAULT CACA_ITALICS CACA_KEY_END CACA_KEY_F10 CACA_KEY_F11
     CACA_KEY_F12 CACA_KEY_F13 CACA_KEY_F14 CACA_KEY_F15 CACA_KEY_TAB
     CACA_MAGENTA CUCUL_YELLOW cucul_file_t cucul_font_t cucul_gotoxy
     cucul_invert cucul_printf */
  /* Offset 11 gives the best switch position.  */
  switch (name[11]) {
  case '0':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          0      */
      *iv_return = CACA_KEY_F10;
      return PERL_constant_ISIV;
    }
    break;
  case '1':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          1      */
      *iv_return = CACA_KEY_F11;
      return PERL_constant_ISIV;
    }
    break;
  case '2':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          2      */
      *iv_return = CACA_KEY_F12;
      return PERL_constant_ISIV;
    }
    break;
  case '3':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          3      */
      *iv_return = CACA_KEY_F13;
      return PERL_constant_ISIV;
    }
    break;
  case '4':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          4      */
      *iv_return = CACA_KEY_F14;
      return PERL_constant_ISIV;
    }
    break;
  case '5':
    if (memEQ(name, "CACA_KEY_F1", 11)) {
    /*                          5      */
      *iv_return = CACA_KEY_F15;
      return PERL_constant_ISIV;
    }
    break;
  case 'A':
    if (memEQ(name, "CACA_MAGENT", 11)) {
    /*                          A      */
      *iv_return = CACA_MAGENTA;
      return PERL_constant_ISIV;
    }
    break;
  case 'B':
    if (memEQ(name, "CACA_KEY_TA", 11)) {
    /*                          B      */
      *iv_return = CACA_KEY_TAB;
      return PERL_constant_ISIV;
    }
    break;
  case 'D':
    if (memEQ(name, "CACA_KEY_EN", 11)) {
    /*                          D      */
      *iv_return = CACA_KEY_END;
      return PERL_constant_ISIV;
    }
    break;
  case 'S':
    if (memEQ(name, "CACA_ITALIC", 11)) {
    /*                          S      */
      *iv_return = CACA_ITALICS;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CACA_DEFAUL", 11)) {
    /*                          T      */
      *iv_return = CACA_DEFAULT;
      return PERL_constant_ISIV;
    }
    break;
  case 'W':
    if (memEQ(name, "CUCUL_YELLO", 11)) {
    /*                          W      */
#ifdef CUCUL_YELLOW
      *iv_return = CUCUL_YELLOW;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_print", 11)) {
    /*                          f      */
#ifdef cucul_printf
      *iv_return = cucul_printf;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_file_", 11)) {
    /*                          t      */
#ifdef cucul_file_t
      *iv_return = cucul_file_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_font_", 11)) {
    /*                          t      */
#ifdef cucul_font_t
      *iv_return = cucul_font_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_inver", 11)) {
    /*                          t      */
#ifdef cucul_invert
      *iv_return = cucul_invert;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'y':
    if (memEQ(name, "cucul_gotox", 11)) {
    /*                          y      */
#ifdef cucul_gotoxy
      *iv_return = cucul_gotoxy;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_13 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_DARKGRAY CACA_KEY_DOWN CACA_KEY_HOME CACA_KEY_LEFT CACA_LIGHTRED
     CUCUL_DEFAULT CUCUL_ITALICS CUCUL_MAGENTA cucul_event_t cucul_getchar
     cucul_put_str cucul_putchar */
  /* Offset 11 gives the best switch position.  */
  switch (name[11]) {
  case 'A':
    if (memEQ(name, "CACA_DARKGRAY", 13)) {
    /*                          ^        */
      *iv_return = CACA_DARKGRAY;
      return PERL_constant_ISIV;
    }
    break;
  case 'C':
    if (memEQ(name, "CUCUL_ITALICS", 13)) {
    /*                          ^        */
#ifdef CUCUL_ITALICS
      *iv_return = CUCUL_ITALICS;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_LIGHTRED", 13)) {
    /*                          ^        */
      *iv_return = CACA_LIGHTRED;
      return PERL_constant_ISIV;
    }
    break;
  case 'F':
    if (memEQ(name, "CACA_KEY_LEFT", 13)) {
    /*                          ^        */
      *iv_return = CACA_KEY_LEFT;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CUCUL_DEFAULT", 13)) {
    /*                          ^        */
#ifdef CUCUL_DEFAULT
      *iv_return = CUCUL_DEFAULT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'M':
    if (memEQ(name, "CACA_KEY_HOME", 13)) {
    /*                          ^        */
      *iv_return = CACA_KEY_HOME;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CUCUL_MAGENTA", 13)) {
    /*                          ^        */
#ifdef CUCUL_MAGENTA
      *iv_return = CUCUL_MAGENTA;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'W':
    if (memEQ(name, "CACA_KEY_DOWN", 13)) {
    /*                          ^        */
      *iv_return = CACA_KEY_DOWN;
      return PERL_constant_ISIV;
    }
    break;
  case '_':
    if (memEQ(name, "cucul_event_t", 13)) {
    /*                          ^        */
#ifdef cucul_event_t
      *iv_return = cucul_event_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_getchar", 13)) {
    /*                          ^        */
#ifdef cucul_getchar
      *iv_return = cucul_getchar;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_putchar", 13)) {
    /*                          ^        */
#ifdef cucul_putchar
      *iv_return = cucul_putchar;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_put_str", 13)) {
    /*                          ^        */
#ifdef cucul_put_str
      *iv_return = cucul_put_str;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_14 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_C40 CACA_CONIO_C80 CACA_CONIO_RED CACA_EVENT_ANY CACA_KEY_PAUSE
     CACA_KEY_RIGHT CACA_LIGHTBLUE CACA_LIGHTCYAN CACA_LIGHTGRAY CACA_UNDERLINE
     CUCUL_DARKGRAY CUCUL_LIGHTRED cucul_canvas_t cucul_dither_t cucul_draw_box
     cucul_file_eof cucul_fill_box cucul_get_attr cucul_get_char cucul_put_attr
     cucul_put_char cucul_set_attr */
  /* Offset 11 gives the best switch position.  */
  switch (name[11]) {
  case 'A':
    if (memEQ(name, "CACA_EVENT_ANY", 14)) {
    /*                          ^         */
      *iv_return = CACA_EVENT_ANY;
      return PERL_constant_ISIV;
    }
    break;
  case 'C':
    if (memEQ(name, "CACA_CONIO_C40", 14)) {
    /*                          ^         */
      *iv_return = CACA_CONIO_C40;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_CONIO_C80", 14)) {
    /*                          ^         */
      *iv_return = CACA_CONIO_C80;
      return PERL_constant_ISIV;
    }
    break;
  case 'G':
    if (memEQ(name, "CACA_KEY_RIGHT", 14)) {
    /*                          ^         */
      *iv_return = CACA_KEY_RIGHT;
      return PERL_constant_ISIV;
    }
    break;
  case 'I':
    if (memEQ(name, "CACA_UNDERLINE", 14)) {
    /*                          ^         */
      *iv_return = CACA_UNDERLINE;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CACA_LIGHTBLUE", 14)) {
    /*                          ^         */
      *iv_return = CACA_LIGHTBLUE;
      return PERL_constant_ISIV;
    }
    break;
  case 'R':
    if (memEQ(name, "CACA_CONIO_RED", 14)) {
    /*                          ^         */
      *iv_return = CACA_CONIO_RED;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_LIGHTGRAY", 14)) {
    /*                          ^         */
      *iv_return = CACA_LIGHTGRAY;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_DARKGRAY", 14)) {
    /*                          ^         */
#ifdef CUCUL_DARKGRAY
      *iv_return = CUCUL_DARKGRAY;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_LIGHTRED", 14)) {
    /*                          ^         */
#ifdef CUCUL_LIGHTRED
      *iv_return = CUCUL_LIGHTRED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'U':
    if (memEQ(name, "CACA_KEY_PAUSE", 14)) {
    /*                          ^         */
      *iv_return = CACA_KEY_PAUSE;
      return PERL_constant_ISIV;
    }
    break;
  case 'Y':
    if (memEQ(name, "CACA_LIGHTCYAN", 14)) {
    /*                          ^         */
      *iv_return = CACA_LIGHTCYAN;
      return PERL_constant_ISIV;
    }
    break;
  case 'b':
    if (memEQ(name, "cucul_draw_box", 14)) {
    /*                          ^         */
#ifdef cucul_draw_box
      *iv_return = cucul_draw_box;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_fill_box", 14)) {
    /*                          ^         */
#ifdef cucul_fill_box
      *iv_return = cucul_fill_box;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "cucul_file_eof", 14)) {
    /*                          ^         */
#ifdef cucul_file_eof
      *iv_return = cucul_file_eof;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "cucul_get_char", 14)) {
    /*                          ^         */
#ifdef cucul_get_char
      *iv_return = cucul_get_char;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_put_char", 14)) {
    /*                          ^         */
#ifdef cucul_put_char
      *iv_return = cucul_put_char;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_dither_t", 14)) {
    /*                          ^         */
#ifdef cucul_dither_t
      *iv_return = cucul_dither_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_canvas_t", 14)) {
    /*                          ^         */
#ifdef cucul_canvas_t
      *iv_return = cucul_canvas_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_get_attr", 14)) {
    /*                          ^         */
#ifdef cucul_get_attr
      *iv_return = cucul_get_attr;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_put_attr", 14)) {
    /*                          ^         */
#ifdef cucul_put_attr
      *iv_return = cucul_put_attr;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_attr", 14)) {
    /*                          ^         */
#ifdef cucul_set_attr
      *iv_return = cucul_set_attr;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_15 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_BLUE CACA_CONIO_BW40 CACA_CONIO_BW80 CACA_CONIO_CYAN
     CACA_CONIO_MONO CACA_DEPRECATED CACA_EVENT_NONE CACA_EVENT_QUIT
     CACA_KEY_CTRL_A CACA_KEY_CTRL_B CACA_KEY_CTRL_C CACA_KEY_CTRL_D
     CACA_KEY_CTRL_E CACA_KEY_CTRL_F CACA_KEY_CTRL_G CACA_KEY_CTRL_J
     CACA_KEY_CTRL_K CACA_KEY_CTRL_L CACA_KEY_CTRL_N CACA_KEY_CTRL_O
     CACA_KEY_CTRL_P CACA_KEY_CTRL_Q CACA_KEY_CTRL_R CACA_KEY_CTRL_T
     CACA_KEY_CTRL_U CACA_KEY_CTRL_V CACA_KEY_CTRL_W CACA_KEY_CTRL_X
     CACA_KEY_CTRL_Y CACA_KEY_CTRL_Z CACA_KEY_DELETE CACA_KEY_ESCAPE
     CACA_KEY_INSERT CACA_KEY_PAGEUP CACA_KEY_RETURN CACA_LIGHTGREEN
     CUCUL_COLOR_RED CUCUL_LIGHTBLUE CUCUL_LIGHTCYAN CUCUL_LIGHTGRAY
     CUCUL_UNDERLINE cucul_display_t cucul_draw_line cucul_file_gets
     cucul_file_open cucul_file_read cucul_file_tell cucul_free_font
     cucul_load_font cucul_set_frame */
  /* Offset 14 gives the best switch position.  */
  switch (name[14]) {
  case '0':
    if (memEQ(name, "CACA_CONIO_BW4", 14)) {
    /*                             0      */
      *iv_return = CACA_CONIO_BW40;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_CONIO_BW8", 14)) {
    /*                             0      */
      *iv_return = CACA_CONIO_BW80;
      return PERL_constant_ISIV;
    }
    break;
  case 'A':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             A      */
      *iv_return = CACA_KEY_CTRL_A;
      return PERL_constant_ISIV;
    }
    break;
  case 'B':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             B      */
      *iv_return = CACA_KEY_CTRL_B;
      return PERL_constant_ISIV;
    }
    break;
  case 'C':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             C      */
      *iv_return = CACA_KEY_CTRL_C;
      return PERL_constant_ISIV;
    }
    break;
  case 'D':
    if (memEQ(name, "CACA_DEPRECATE", 14)) {
    /*                             D      */
#ifdef CACA_DEPRECATED
      *iv_return = CACA_DEPRECATED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             D      */
      *iv_return = CACA_KEY_CTRL_D;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_COLOR_RE", 14)) {
    /*                             D      */
#ifdef CUCUL_COLOR_RED
      *iv_return = CUCUL_COLOR_RED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_CONIO_BLU", 14)) {
    /*                             E      */
      *iv_return = CACA_CONIO_BLUE;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_EVENT_NON", 14)) {
    /*                             E      */
      *iv_return = CACA_EVENT_NONE;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             E      */
      *iv_return = CACA_KEY_CTRL_E;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_DELET", 14)) {
    /*                             E      */
      *iv_return = CACA_KEY_DELETE;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_ESCAP", 14)) {
    /*                             E      */
      *iv_return = CACA_KEY_ESCAPE;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_LIGHTBLU", 14)) {
    /*                             E      */
#ifdef CUCUL_LIGHTBLUE
      *iv_return = CUCUL_LIGHTBLUE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_UNDERLIN", 14)) {
    /*                             E      */
#ifdef CUCUL_UNDERLINE
      *iv_return = CUCUL_UNDERLINE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'F':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             F      */
      *iv_return = CACA_KEY_CTRL_F;
      return PERL_constant_ISIV;
    }
    break;
  case 'G':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             G      */
      *iv_return = CACA_KEY_CTRL_G;
      return PERL_constant_ISIV;
    }
    break;
  case 'J':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             J      */
      *iv_return = CACA_KEY_CTRL_J;
      return PERL_constant_ISIV;
    }
    break;
  case 'K':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             K      */
      *iv_return = CACA_KEY_CTRL_K;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             L      */
      *iv_return = CACA_KEY_CTRL_L;
      return PERL_constant_ISIV;
    }
    break;
  case 'N':
    if (memEQ(name, "CACA_CONIO_CYA", 14)) {
    /*                             N      */
      *iv_return = CACA_CONIO_CYAN;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             N      */
      *iv_return = CACA_KEY_CTRL_N;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_RETUR", 14)) {
    /*                             N      */
      *iv_return = CACA_KEY_RETURN;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_LIGHTGREE", 14)) {
    /*                             N      */
      *iv_return = CACA_LIGHTGREEN;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_LIGHTCYA", 14)) {
    /*                             N      */
#ifdef CUCUL_LIGHTCYAN
      *iv_return = CUCUL_LIGHTCYAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'O':
    if (memEQ(name, "CACA_CONIO_MON", 14)) {
    /*                             O      */
      *iv_return = CACA_CONIO_MONO;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             O      */
      *iv_return = CACA_KEY_CTRL_O;
      return PERL_constant_ISIV;
    }
    break;
  case 'P':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             P      */
      *iv_return = CACA_KEY_CTRL_P;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_PAGEU", 14)) {
    /*                             P      */
      *iv_return = CACA_KEY_PAGEUP;
      return PERL_constant_ISIV;
    }
    break;
  case 'Q':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             Q      */
      *iv_return = CACA_KEY_CTRL_Q;
      return PERL_constant_ISIV;
    }
    break;
  case 'R':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             R      */
      *iv_return = CACA_KEY_CTRL_R;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CACA_EVENT_QUI", 14)) {
    /*                             T      */
      *iv_return = CACA_EVENT_QUIT;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             T      */
      *iv_return = CACA_KEY_CTRL_T;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_INSER", 14)) {
    /*                             T      */
      *iv_return = CACA_KEY_INSERT;
      return PERL_constant_ISIV;
    }
    break;
  case 'U':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             U      */
      *iv_return = CACA_KEY_CTRL_U;
      return PERL_constant_ISIV;
    }
    break;
  case 'V':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             V      */
      *iv_return = CACA_KEY_CTRL_V;
      return PERL_constant_ISIV;
    }
    break;
  case 'W':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             W      */
      *iv_return = CACA_KEY_CTRL_W;
      return PERL_constant_ISIV;
    }
    break;
  case 'X':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             X      */
      *iv_return = CACA_KEY_CTRL_X;
      return PERL_constant_ISIV;
    }
    break;
  case 'Y':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             Y      */
      *iv_return = CACA_KEY_CTRL_Y;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_LIGHTGRA", 14)) {
    /*                             Y      */
#ifdef CUCUL_LIGHTGRAY
      *iv_return = CUCUL_LIGHTGRAY;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'Z':
    if (memEQ(name, "CACA_KEY_CTRL_", 14)) {
    /*                             Z      */
      *iv_return = CACA_KEY_CTRL_Z;
      return PERL_constant_ISIV;
    }
    break;
  case 'd':
    if (memEQ(name, "cucul_file_rea", 14)) {
    /*                             d      */
#ifdef cucul_file_read
      *iv_return = cucul_file_read;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "cucul_draw_lin", 14)) {
    /*                             e      */
#ifdef cucul_draw_line
      *iv_return = cucul_draw_line;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_fram", 14)) {
    /*                             e      */
#ifdef cucul_set_frame
      *iv_return = cucul_set_frame;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_file_tel", 14)) {
    /*                             l      */
#ifdef cucul_file_tell
      *iv_return = cucul_file_tell;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_file_ope", 14)) {
    /*                             n      */
#ifdef cucul_file_open
      *iv_return = cucul_file_open;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_file_get", 14)) {
    /*                             s      */
#ifdef cucul_file_gets
      *iv_return = cucul_file_gets;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_display_", 14)) {
    /*                             t      */
#ifdef cucul_display_t
      *iv_return = cucul_display_t;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_free_fon", 14)) {
    /*                             t      */
#ifdef cucul_free_font
      *iv_return = cucul_free_font;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_load_fon", 14)) {
    /*                             t      */
#ifdef cucul_load_font
      *iv_return = cucul_load_font;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_16 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_BLACK CACA_CONIO_BLINK CACA_CONIO_BROWN CACA_CONIO_C4350
     CACA_CONIO_GREEN CACA_CONIO_WHITE CACA_KEY_UNKNOWN CACA_TRANSPARENT
     CUCUL_COLOR_BLUE CUCUL_COLOR_CYAN CUCUL_LIGHTGREEN cucul_file_close
     cucul_file_write cucul_free_frame cucul_rotate_180 */
  /* Offset 14 gives the best switch position.  */
  switch (name[14]) {
  case '5':
    if (memEQ(name, "CACA_CONIO_C4350", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_C4350;
      return PERL_constant_ISIV;
    }
    break;
  case '8':
    if (memEQ(name, "cucul_rotate_180", 16)) {
    /*                             ^        */
#ifdef cucul_rotate_180
      *iv_return = cucul_rotate_180;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'A':
    if (memEQ(name, "CUCUL_COLOR_CYAN", 16)) {
    /*                             ^        */
#ifdef CUCUL_COLOR_CYAN
      *iv_return = CUCUL_COLOR_CYAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'C':
    if (memEQ(name, "CACA_CONIO_BLACK", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_BLACK;
      return PERL_constant_ISIV;
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_CONIO_GREEN", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_GREEN;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_LIGHTGREEN", 16)) {
    /*                             ^        */
#ifdef CUCUL_LIGHTGREEN
      *iv_return = CUCUL_LIGHTGREEN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'N':
    if (memEQ(name, "CACA_CONIO_BLINK", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_BLINK;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_TRANSPARENT", 16)) {
    /*                             ^        */
      *iv_return = CACA_TRANSPARENT;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CACA_CONIO_WHITE", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_WHITE;
      return PERL_constant_ISIV;
    }
    break;
  case 'U':
    if (memEQ(name, "CUCUL_COLOR_BLUE", 16)) {
    /*                             ^        */
#ifdef CUCUL_COLOR_BLUE
      *iv_return = CUCUL_COLOR_BLUE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'W':
    if (memEQ(name, "CACA_CONIO_BROWN", 16)) {
    /*                             ^        */
      *iv_return = CACA_CONIO_BROWN;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_KEY_UNKNOWN", 16)) {
    /*                             ^        */
      *iv_return = CACA_KEY_UNKNOWN;
      return PERL_constant_ISIV;
    }
    break;
  case 'm':
    if (memEQ(name, "cucul_free_frame", 16)) {
    /*                             ^        */
#ifdef cucul_free_frame
      *iv_return = cucul_free_frame;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_file_close", 16)) {
    /*                             ^        */
#ifdef cucul_file_close
      *iv_return = cucul_file_close;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_file_write", 16)) {
    /*                             ^        */
#ifdef cucul_file_write
      *iv_return = cucul_file_write;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_17 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_YELLOW CACA_EVENT_RESIZE CACA_KEY_PAGEDOWN CACA_LIGHTMAGENTA
     CUCUL_COLOR_BLACK CUCUL_COLOR_BROWN CUCUL_COLOR_GREEN CUCUL_COLOR_WHITE
     CUCUL_TRANSPARENT caca_get_cursor_x caca_get_cursor_y cucul_draw_circle
     cucul_free_canvas cucul_free_dither cucul_get_version cucul_import_file
     cucul_put_figchar cucul_rotate_left */
  /* Offset 13 gives the best switch position.  */
  switch (name[13]) {
  case 'D':
    if (memEQ(name, "CACA_KEY_PAGEDOWN", 17)) {
    /*                            ^          */
      *iv_return = CACA_KEY_PAGEDOWN;
      return PERL_constant_ISIV;
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_LIGHTMAGENTA", 17)) {
    /*                            ^          */
      *iv_return = CACA_LIGHTMAGENTA;
      return PERL_constant_ISIV;
    }
    break;
  case 'H':
    if (memEQ(name, "CUCUL_COLOR_WHITE", 17)) {
    /*                            ^          */
#ifdef CUCUL_COLOR_WHITE
      *iv_return = CUCUL_COLOR_WHITE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'L':
    if (memEQ(name, "CACA_CONIO_YELLOW", 17)) {
    /*                            ^          */
      *iv_return = CACA_CONIO_YELLOW;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_COLOR_BLACK", 17)) {
    /*                            ^          */
#ifdef CUCUL_COLOR_BLACK
      *iv_return = CUCUL_COLOR_BLACK;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "CUCUL_COLOR_BROWN", 17)) {
    /*                            ^          */
#ifdef CUCUL_COLOR_BROWN
      *iv_return = CUCUL_COLOR_BROWN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_COLOR_GREEN", 17)) {
    /*                            ^          */
#ifdef CUCUL_COLOR_GREEN
      *iv_return = CUCUL_COLOR_GREEN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_TRANSPARENT", 17)) {
    /*                            ^          */
#ifdef CUCUL_TRANSPARENT
      *iv_return = CUCUL_TRANSPARENT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "CACA_EVENT_RESIZE", 17)) {
    /*                            ^          */
      *iv_return = CACA_EVENT_RESIZE;
      return PERL_constant_ISIV;
    }
    break;
  case 'c':
    if (memEQ(name, "cucul_put_figchar", 17)) {
    /*                            ^          */
#ifdef cucul_put_figchar
      *iv_return = cucul_put_figchar;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_import_file", 17)) {
    /*                            ^          */
#ifdef cucul_import_file
      *iv_return = cucul_import_file;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_rotate_left", 17)) {
    /*                            ^          */
#ifdef cucul_rotate_left
      *iv_return = cucul_rotate_left;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_free_canvas", 17)) {
    /*                            ^          */
#ifdef cucul_free_canvas
      *iv_return = cucul_free_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'o':
    if (memEQ(name, "caca_get_cursor_x", 17)) {
    /*                            ^          */
#ifdef caca_get_cursor_x
      *iv_return = caca_get_cursor_x;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "caca_get_cursor_y", 17)) {
    /*                            ^          */
#ifdef caca_get_cursor_y
      *iv_return = caca_get_cursor_y;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_draw_circle", 17)) {
    /*                            ^          */
#ifdef cucul_draw_circle
      *iv_return = cucul_draw_circle;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_get_version", 17)) {
    /*                            ^          */
#ifdef cucul_get_version
      *iv_return = cucul_get_version;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_free_dither", 17)) {
    /*                            ^          */
#ifdef cucul_free_dither
      *iv_return = cucul_free_dither;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_18 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_MAGENTA CACA_KEY_BACKSPACE CUCUL_COLOR_YELLOW
     CUCUL_LIGHTMAGENTA cucul_attr_to_ansi cucul_clear_canvas
     cucul_create_frame cucul_draw_ellipse cucul_fill_ellipse
     cucul_flush_figlet cucul_get_cursor_x cucul_get_cursor_y
     cucul_rotate_right cucul_stretch_left */
  /* Offset 6 gives the best switch position.  */
  switch (name[6]) {
  case 'C':
    if (memEQ(name, "CUCUL_COLOR_YELLOW", 18)) {
    /*                     ^                  */
#ifdef CUCUL_COLOR_YELLOW
      *iv_return = CUCUL_COLOR_YELLOW;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_KEY_BACKSPACE", 18)) {
    /*                     ^                  */
      *iv_return = CACA_KEY_BACKSPACE;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CUCUL_LIGHTMAGENTA", 18)) {
    /*                     ^                  */
#ifdef CUCUL_LIGHTMAGENTA
      *iv_return = CUCUL_LIGHTMAGENTA;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'O':
    if (memEQ(name, "CACA_CONIO_MAGENTA", 18)) {
    /*                     ^                  */
      *iv_return = CACA_CONIO_MAGENTA;
      return PERL_constant_ISIV;
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_attr_to_ansi", 18)) {
    /*                     ^                  */
#ifdef cucul_attr_to_ansi
      *iv_return = cucul_attr_to_ansi;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'c':
    if (memEQ(name, "cucul_clear_canvas", 18)) {
    /*                     ^                  */
#ifdef cucul_clear_canvas
      *iv_return = cucul_clear_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_create_frame", 18)) {
    /*                     ^                  */
#ifdef cucul_create_frame
      *iv_return = cucul_create_frame;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'd':
    if (memEQ(name, "cucul_draw_ellipse", 18)) {
    /*                     ^                  */
#ifdef cucul_draw_ellipse
      *iv_return = cucul_draw_ellipse;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_fill_ellipse", 18)) {
    /*                     ^                  */
#ifdef cucul_fill_ellipse
      *iv_return = cucul_fill_ellipse;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_flush_figlet", 18)) {
    /*                     ^                  */
#ifdef cucul_flush_figlet
      *iv_return = cucul_flush_figlet;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'g':
    if (memEQ(name, "cucul_get_cursor_x", 18)) {
    /*                     ^                  */
#ifdef cucul_get_cursor_x
      *iv_return = cucul_get_cursor_x;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_get_cursor_y", 18)) {
    /*                     ^                  */
#ifdef cucul_get_cursor_y
      *iv_return = cucul_get_cursor_y;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_rotate_right", 18)) {
    /*                     ^                  */
#ifdef cucul_rotate_right
      *iv_return = cucul_rotate_right;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_stretch_left", 18)) {
    /*                     ^                  */
#ifdef cucul_stretch_left
      *iv_return = cucul_stretch_left;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_19 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_DARKGRAY CACA_CONIO_LASTMODE CACA_CONIO_LIGHTRED
     CUCUL_COLOR_DEFAULT CUCUL_COLOR_MAGENTA cucul_create_canvas
     cucul_create_dither cucul_dither_bitmap cucul_draw_polyline
     cucul_draw_thin_box cucul_draw_triangle cucul_export_memory
     cucul_fill_triangle cucul_get_font_list cucul_import_memory
     cucul_manage_canvas cucul_render_canvas cucul_stretch_right
     cucul_utf32_to_utf8 cucul_utf8_to_utf32 */
  /* Offset 17 gives the best switch position.  */
  switch (name[17]) {
  case '3':
    if (memEQ(name, "cucul_utf8_to_utf32", 19)) {
    /*                                ^        */
#ifdef cucul_utf8_to_utf32
      *iv_return = cucul_utf8_to_utf32;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'A':
    if (memEQ(name, "CACA_CONIO_DARKGRAY", 19)) {
    /*                                ^        */
      *iv_return = CACA_CONIO_DARKGRAY;
      return PERL_constant_ISIV;
    }
    break;
  case 'D':
    if (memEQ(name, "CACA_CONIO_LASTMODE", 19)) {
    /*                                ^        */
      *iv_return = CACA_CONIO_LASTMODE;
      return PERL_constant_ISIV;
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_CONIO_LIGHTRED", 19)) {
    /*                                ^        */
      *iv_return = CACA_CONIO_LIGHTRED;
      return PERL_constant_ISIV;
    }
    break;
  case 'L':
    if (memEQ(name, "CUCUL_COLOR_DEFAULT", 19)) {
    /*                                ^        */
#ifdef CUCUL_COLOR_DEFAULT
      *iv_return = CUCUL_COLOR_DEFAULT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'T':
    if (memEQ(name, "CUCUL_COLOR_MAGENTA", 19)) {
    /*                                ^        */
#ifdef CUCUL_COLOR_MAGENTA
      *iv_return = CUCUL_COLOR_MAGENTA;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_create_canvas", 19)) {
    /*                                ^        */
#ifdef cucul_create_canvas
      *iv_return = cucul_create_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_dither_bitmap", 19)) {
    /*                                ^        */
#ifdef cucul_dither_bitmap
      *iv_return = cucul_dither_bitmap;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_manage_canvas", 19)) {
    /*                                ^        */
#ifdef cucul_manage_canvas
      *iv_return = cucul_manage_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_render_canvas", 19)) {
    /*                                ^        */
#ifdef cucul_render_canvas
      *iv_return = cucul_render_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "cucul_create_dither", 19)) {
    /*                                ^        */
#ifdef cucul_create_dither
      *iv_return = cucul_create_dither;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_utf32_to_utf8", 19)) {
    /*                                ^        */
#ifdef cucul_utf32_to_utf8
      *iv_return = cucul_utf32_to_utf8;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "cucul_stretch_right", 19)) {
    /*                                ^        */
#ifdef cucul_stretch_right
      *iv_return = cucul_stretch_right;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_draw_triangle", 19)) {
    /*                                ^        */
#ifdef cucul_draw_triangle
      *iv_return = cucul_draw_triangle;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_fill_triangle", 19)) {
    /*                                ^        */
#ifdef cucul_fill_triangle
      *iv_return = cucul_fill_triangle;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_draw_polyline", 19)) {
    /*                                ^        */
#ifdef cucul_draw_polyline
      *iv_return = cucul_draw_polyline;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'o':
    if (memEQ(name, "cucul_draw_thin_box", 19)) {
    /*                                ^        */
#ifdef cucul_draw_thin_box
      *iv_return = cucul_draw_thin_box;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_export_memory", 19)) {
    /*                                ^        */
#ifdef cucul_export_memory
      *iv_return = cucul_export_memory;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_import_memory", 19)) {
    /*                                ^        */
#ifdef cucul_import_memory
      *iv_return = cucul_import_memory;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_get_font_list", 19)) {
    /*                                ^        */
#ifdef cucul_get_font_list
      *iv_return = cucul_get_font_list;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_20 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_LIGHTBLUE CACA_CONIO_LIGHTCYAN CACA_CONIO_LIGHTGRAY
     CACA_CONIO__NOCURSOR CACA_EVENT_KEY_PRESS CACA_MAGIC_FULLWIDTH
     CUCUL_COLOR_DARKGRAY CUCUL_COLOR_LIGHTRED cucul_attr_to_argb64
     cucul_cp437_to_utf32 cucul_draw_cp437_box cucul_draw_thin_line
     cucul_get_font_width cucul_get_frame_name cucul_set_color_ansi
     cucul_set_color_argb cucul_set_frame_name cucul_utf32_to_ascii
     cucul_utf32_to_cp437 */
  /* Offset 16 gives the best switch position.  */
  switch (name[16]) {
  case 'B':
    if (memEQ(name, "CACA_CONIO_LIGHTBLUE", 20)) {
    /*                               ^          */
      *iv_return = CACA_CONIO_LIGHTBLUE;
      return PERL_constant_ISIV;
    }
    break;
  case 'C':
    if (memEQ(name, "CACA_CONIO_LIGHTCYAN", 20)) {
    /*                               ^          */
      *iv_return = CACA_CONIO_LIGHTCYAN;
      return PERL_constant_ISIV;
    }
    break;
  case 'G':
    if (memEQ(name, "CACA_CONIO_LIGHTGRAY", 20)) {
    /*                               ^          */
      *iv_return = CACA_CONIO_LIGHTGRAY;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CUCUL_COLOR_DARKGRAY", 20)) {
    /*                               ^          */
#ifdef CUCUL_COLOR_DARKGRAY
      *iv_return = CUCUL_COLOR_DARKGRAY;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'I':
    if (memEQ(name, "CACA_MAGIC_FULLWIDTH", 20)) {
    /*                               ^          */
#ifdef CACA_MAGIC_FULLWIDTH
      *iv_return = CACA_MAGIC_FULLWIDTH;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "CACA_CONIO__NOCURSOR", 20)) {
    /*                               ^          */
      *iv_return = CACA_CONIO__NOCURSOR;
      return PERL_constant_ISIV;
    }
    if (memEQ(name, "CACA_EVENT_KEY_PRESS", 20)) {
    /*                               ^          */
      *iv_return = CACA_EVENT_KEY_PRESS;
      return PERL_constant_ISIV;
    }
    break;
  case 'T':
    if (memEQ(name, "CUCUL_COLOR_LIGHTRED", 20)) {
    /*                               ^          */
#ifdef CUCUL_COLOR_LIGHTRED
      *iv_return = CUCUL_COLOR_LIGHTRED;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case '_':
    if (memEQ(name, "cucul_draw_cp437_box", 20)) {
    /*                               ^          */
#ifdef cucul_draw_cp437_box
      *iv_return = cucul_draw_cp437_box;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_set_color_ansi", 20)) {
    /*                               ^          */
#ifdef cucul_set_color_ansi
      *iv_return = cucul_set_color_ansi;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_color_argb", 20)) {
    /*                               ^          */
#ifdef cucul_set_color_argb
      *iv_return = cucul_set_color_argb;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'g':
    if (memEQ(name, "cucul_attr_to_argb64", 20)) {
    /*                               ^          */
#ifdef cucul_attr_to_argb64
      *iv_return = cucul_attr_to_argb64;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'i':
    if (memEQ(name, "cucul_get_font_width", 20)) {
    /*                               ^          */
#ifdef cucul_get_font_width
      *iv_return = cucul_get_font_width;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_draw_thin_line", 20)) {
    /*                               ^          */
#ifdef cucul_draw_thin_line
      *iv_return = cucul_draw_thin_line;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_get_frame_name", 20)) {
    /*                               ^          */
#ifdef cucul_get_frame_name
      *iv_return = cucul_get_frame_name;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_frame_name", 20)) {
    /*                               ^          */
#ifdef cucul_set_frame_name
      *iv_return = cucul_set_frame_name;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'p':
    if (memEQ(name, "cucul_utf32_to_cp437", 20)) {
    /*                               ^          */
#ifdef cucul_utf32_to_cp437
      *iv_return = cucul_utf32_to_cp437;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_utf32_to_ascii", 20)) {
    /*                               ^          */
#ifdef cucul_utf32_to_ascii
      *iv_return = cucul_utf32_to_ascii;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 't':
    if (memEQ(name, "cucul_cp437_to_utf32", 20)) {
    /*                               ^          */
#ifdef cucul_cp437_to_utf32
      *iv_return = cucul_cp437_to_utf32;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_21 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_LIGHTGREEN CUCUL_COLOR_LIGHTBLUE CUCUL_COLOR_LIGHTCYAN
     CUCUL_COLOR_LIGHTGRAY cucul_attr_to_ansi_bg cucul_attr_to_ansi_fg
     cucul_get_export_list cucul_get_font_blocks cucul_get_font_height
     cucul_get_frame_count cucul_get_import_list cucul_set_canvas_size
     cucul_unmanage_canvas */
  /* Offset 19 gives the best switch position.  */
  switch (name[19]) {
  case 'A':
    if (memEQ(name, "CUCUL_COLOR_LIGHTCYAN", 21)) {
    /*                                  ^        */
#ifdef CUCUL_COLOR_LIGHTCYAN
      *iv_return = CUCUL_COLOR_LIGHTCYAN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "CUCUL_COLOR_LIGHTGRAY", 21)) {
    /*                                  ^        */
#ifdef CUCUL_COLOR_LIGHTGRAY
      *iv_return = CUCUL_COLOR_LIGHTGRAY;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'E':
    if (memEQ(name, "CACA_CONIO_LIGHTGREEN", 21)) {
    /*                                  ^        */
      *iv_return = CACA_CONIO_LIGHTGREEN;
      return PERL_constant_ISIV;
    }
    break;
  case 'U':
    if (memEQ(name, "CUCUL_COLOR_LIGHTBLUE", 21)) {
    /*                                  ^        */
#ifdef CUCUL_COLOR_LIGHTBLUE
      *iv_return = CUCUL_COLOR_LIGHTBLUE;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_unmanage_canvas", 21)) {
    /*                                  ^        */
#ifdef cucul_unmanage_canvas
      *iv_return = cucul_unmanage_canvas;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'b':
    if (memEQ(name, "cucul_attr_to_ansi_bg", 21)) {
    /*                                  ^        */
#ifdef cucul_attr_to_ansi_bg
      *iv_return = cucul_attr_to_ansi_bg;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_attr_to_ansi_fg", 21)) {
    /*                                  ^        */
#ifdef cucul_attr_to_ansi_fg
      *iv_return = cucul_attr_to_ansi_fg;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "cucul_get_font_height", 21)) {
    /*                                  ^        */
#ifdef cucul_get_font_height
      *iv_return = cucul_get_font_height;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'k':
    if (memEQ(name, "cucul_get_font_blocks", 21)) {
    /*                                  ^        */
#ifdef cucul_get_font_blocks
      *iv_return = cucul_get_font_blocks;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_get_frame_count", 21)) {
    /*                                  ^        */
#ifdef cucul_get_frame_count
      *iv_return = cucul_get_frame_count;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_get_export_list", 21)) {
    /*                                  ^        */
#ifdef cucul_get_export_list
      *iv_return = cucul_get_export_list;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_get_import_list", 21)) {
    /*                                  ^        */
#ifdef cucul_get_import_list
      *iv_return = cucul_get_import_list;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'z':
    if (memEQ(name, "cucul_set_canvas_size", 21)) {
    /*                                  ^        */
#ifdef cucul_set_canvas_size
      *iv_return = cucul_set_canvas_size;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_22 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_EVENT_KEY_RELEASE CACA_EVENT_MOUSE_PRESS CUCUL_COLOR_LIGHTGREEN
     cucul_attr_to_rgb12_bg cucul_attr_to_rgb12_fg cucul_get_canvas_attrs
     cucul_get_canvas_chars cucul_get_canvas_width cucul_get_dither_color
     cucul_get_dither_gamma cucul_set_dither_color cucul_set_dither_gamma */
  /* Offset 21 gives the best switch position.  */
  switch (name[21]) {
  case 'E':
    if (memEQ(name, "CACA_EVENT_KEY_RELEAS", 21)) {
    /*                                    E      */
      *iv_return = CACA_EVENT_KEY_RELEASE;
      return PERL_constant_ISIV;
    }
    break;
  case 'N':
    if (memEQ(name, "CUCUL_COLOR_LIGHTGREE", 21)) {
    /*                                    N      */
#ifdef CUCUL_COLOR_LIGHTGREEN
      *iv_return = CUCUL_COLOR_LIGHTGREEN;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'S':
    if (memEQ(name, "CACA_EVENT_MOUSE_PRES", 21)) {
    /*                                    S      */
      *iv_return = CACA_EVENT_MOUSE_PRESS;
      return PERL_constant_ISIV;
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_get_dither_gamm", 21)) {
    /*                                    a      */
#ifdef cucul_get_dither_gamma
      *iv_return = cucul_get_dither_gamma;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_gamm", 21)) {
    /*                                    a      */
#ifdef cucul_set_dither_gamma
      *iv_return = cucul_set_dither_gamma;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'g':
    if (memEQ(name, "cucul_attr_to_rgb12_b", 21)) {
    /*                                    g      */
#ifdef cucul_attr_to_rgb12_bg
      *iv_return = cucul_attr_to_rgb12_bg;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_attr_to_rgb12_f", 21)) {
    /*                                    g      */
#ifdef cucul_attr_to_rgb12_fg
      *iv_return = cucul_attr_to_rgb12_fg;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'h':
    if (memEQ(name, "cucul_get_canvas_widt", 21)) {
    /*                                    h      */
#ifdef cucul_get_canvas_width
      *iv_return = cucul_get_canvas_width;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_get_dither_colo", 21)) {
    /*                                    r      */
#ifdef cucul_get_dither_color
      *iv_return = cucul_get_dither_color;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_colo", 21)) {
    /*                                    r      */
#ifdef cucul_set_dither_color
      *iv_return = cucul_set_dither_color;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 's':
    if (memEQ(name, "cucul_get_canvas_attr", 21)) {
    /*                                    s      */
#ifdef cucul_get_canvas_attrs
      *iv_return = cucul_get_canvas_attrs;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_get_canvas_char", 21)) {
    /*                                    s      */
#ifdef cucul_get_canvas_chars
      *iv_return = cucul_get_canvas_chars;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_23 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO_LIGHTMAGENTA CACA_CONIO__SOLIDCURSOR CACA_EVENT_MOUSE_MOTION
     CUCUL_COLOR_TRANSPARENT cucul_draw_thin_ellipse cucul_get_canvas_height
     cucul_set_canvas_handle */
  /* Offset 18 gives the best switch position.  */
  switch (name[18]) {
  case 'A':
    if (memEQ(name, "CUCUL_COLOR_TRANSPARENT", 23)) {
    /*                                 ^           */
#ifdef CUCUL_COLOR_TRANSPARENT
      *iv_return = CUCUL_COLOR_TRANSPARENT;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'G':
    if (memEQ(name, "CACA_CONIO_LIGHTMAGENTA", 23)) {
    /*                                 ^           */
      *iv_return = CACA_CONIO_LIGHTMAGENTA;
      return PERL_constant_ISIV;
    }
    break;
  case 'O':
    if (memEQ(name, "CACA_EVENT_MOUSE_MOTION", 23)) {
    /*                                 ^           */
      *iv_return = CACA_EVENT_MOUSE_MOTION;
      return PERL_constant_ISIV;
    }
    break;
  case 'U':
    if (memEQ(name, "CACA_CONIO__SOLIDCURSOR", 23)) {
    /*                                 ^           */
      *iv_return = CACA_CONIO__SOLIDCURSOR;
      return PERL_constant_ISIV;
    }
    break;
  case 'a':
    if (memEQ(name, "cucul_set_canvas_handle", 23)) {
    /*                                 ^           */
#ifdef cucul_set_canvas_handle
      *iv_return = cucul_set_canvas_handle;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'e':
    if (memEQ(name, "cucul_get_canvas_height", 23)) {
    /*                                 ^           */
#ifdef cucul_get_canvas_height
      *iv_return = cucul_get_canvas_height;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_draw_thin_ellipse", 23)) {
    /*                                 ^           */
#ifdef cucul_draw_thin_ellipse
      *iv_return = cucul_draw_thin_ellipse;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_24 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     CACA_CONIO__NORMALCURSOR CACA_EVENT_MOUSE_RELEASE CUCUL_COLOR_LIGHTMAGENTA
     cucul_canvas_set_figfont cucul_draw_thin_polyline cucul_draw_thin_triangle
     cucul_get_dither_charset cucul_set_dither_charset cucul_set_dither_palette
     cucul_utf32_is_fullwidth */
  /* Offset 17 gives the best switch position.  */
  switch (name[17]) {
  case 'L':
    if (memEQ(name, "CACA_CONIO__NORMALCURSOR", 24)) {
    /*                                ^             */
      *iv_return = CACA_CONIO__NORMALCURSOR;
      return PERL_constant_ISIV;
    }
    break;
  case 'M':
    if (memEQ(name, "CUCUL_COLOR_LIGHTMAGENTA", 24)) {
    /*                                ^             */
#ifdef CUCUL_COLOR_LIGHTMAGENTA
      *iv_return = CUCUL_COLOR_LIGHTMAGENTA;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'R':
    if (memEQ(name, "CACA_EVENT_MOUSE_RELEASE", 24)) {
    /*                                ^             */
      *iv_return = CACA_EVENT_MOUSE_RELEASE;
      return PERL_constant_ISIV;
    }
    break;
  case 'c':
    if (memEQ(name, "cucul_get_dither_charset", 24)) {
    /*                                ^             */
#ifdef cucul_get_dither_charset
      *iv_return = cucul_get_dither_charset;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_charset", 24)) {
    /*                                ^             */
#ifdef cucul_set_dither_charset
      *iv_return = cucul_set_dither_charset;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'f':
    if (memEQ(name, "cucul_canvas_set_figfont", 24)) {
    /*                                ^             */
#ifdef cucul_canvas_set_figfont
      *iv_return = cucul_canvas_set_figfont;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'l':
    if (memEQ(name, "cucul_utf32_is_fullwidth", 24)) {
    /*                                ^             */
#ifdef cucul_utf32_is_fullwidth
      *iv_return = cucul_utf32_is_fullwidth;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'o':
    if (memEQ(name, "cucul_draw_thin_polyline", 24)) {
    /*                                ^             */
#ifdef cucul_draw_thin_polyline
      *iv_return = cucul_draw_thin_polyline;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'p':
    if (memEQ(name, "cucul_set_dither_palette", 24)) {
    /*                                ^             */
#ifdef cucul_set_dither_palette
      *iv_return = cucul_set_dither_palette;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_draw_thin_triangle", 24)) {
    /*                                ^             */
#ifdef cucul_draw_thin_triangle
      *iv_return = cucul_draw_thin_triangle;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_25 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     cucul_get_canvas_handle_x cucul_get_canvas_handle_y
     cucul_get_dither_contrast cucul_set_dither_contrast */
  /* Offset 24 gives the best switch position.  */
  switch (name[24]) {
  case 't':
    if (memEQ(name, "cucul_get_dither_contras", 24)) {
    /*                                       t      */
#ifdef cucul_get_dither_contrast
      *iv_return = cucul_get_dither_contrast;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_contras", 24)) {
    /*                                       t      */
#ifdef cucul_set_dither_contrast
      *iv_return = cucul_set_dither_contrast;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'x':
    if (memEQ(name, "cucul_get_canvas_handle_", 24)) {
    /*                                       x      */
#ifdef cucul_get_canvas_handle_x
      *iv_return = cucul_get_canvas_handle_x;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'y':
    if (memEQ(name, "cucul_get_canvas_handle_", 24)) {
    /*                                       y      */
#ifdef cucul_get_canvas_handle_y
      *iv_return = cucul_get_canvas_handle_y;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_26 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     cucul_get_dither_algorithm cucul_get_dither_antialias
     cucul_set_dither_algorithm cucul_set_dither_antialias */
  /* Offset 18 gives the best switch position.  */
  switch (name[18]) {
  case 'l':
    if (memEQ(name, "cucul_get_dither_algorithm", 26)) {
    /*                                 ^              */
#ifdef cucul_get_dither_algorithm
      *iv_return = cucul_get_dither_algorithm;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_algorithm", 26)) {
    /*                                 ^              */
#ifdef cucul_set_dither_algorithm
      *iv_return = cucul_set_dither_algorithm;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_get_dither_antialias", 26)) {
    /*                                 ^              */
#ifdef cucul_get_dither_antialias
      *iv_return = cucul_get_dither_antialias;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_antialias", 26)) {
    /*                                 ^              */
#ifdef cucul_set_dither_antialias
      *iv_return = cucul_set_dither_antialias;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant_27 (pTHX_ const char *name, IV *iv_return) {
  /* When generated this function returned values for the list of names given
     here.  However, subsequent manual editing may have added or removed some.
     cucul_get_dither_brightness cucul_get_dither_color_list
     cucul_set_canvas_boundaries cucul_set_dither_brightness */
  /* Offset 23 gives the best switch position.  */
  switch (name[23]) {
  case 'l':
    if (memEQ(name, "cucul_get_dither_color_list", 27)) {
    /*                                      ^          */
#ifdef cucul_get_dither_color_list
      *iv_return = cucul_get_dither_color_list;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'n':
    if (memEQ(name, "cucul_get_dither_brightness", 27)) {
    /*                                      ^          */
#ifdef cucul_get_dither_brightness
      *iv_return = cucul_get_dither_brightness;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    if (memEQ(name, "cucul_set_dither_brightness", 27)) {
    /*                                      ^          */
#ifdef cucul_set_dither_brightness
      *iv_return = cucul_set_dither_brightness;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 'r':
    if (memEQ(name, "cucul_set_canvas_boundaries", 27)) {
    /*                                      ^          */
#ifdef cucul_set_canvas_boundaries
      *iv_return = cucul_set_canvas_boundaries;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

static int
constant (pTHX_ const char *name, STRLEN len, IV *iv_return) {
  /* Initially switch on the length of the name.  */
  /* When generated this function returned values for the list of names given
     in this section of perl code.  Rather than manually editing these functions
     to add or remove constants, which would result in this comment and section
     of code becoming inaccurate, we recommend that you edit this section of
     code, and use it to regenerate a new set of constant functions which you
     then use to replace the originals.

     Regenerate these constant functions by feeding this entire source file to
     perl -x

#!/home/yanick/perl5/perlbrew/perls/perl-5.12.0/bin/perl -w
use ExtUtils::Constant qw (constant_types C_constant XS_constant);

my $types = {map {($_, 1)} qw(IV)};
my @names = (qw(CACA_DEPRECATED CACA_MAGIC_FULLWIDTH CUCUL_BLACK CUCUL_BLINK
	       CUCUL_BLUE CUCUL_BOLD CUCUL_BROWN CUCUL_COLOR_BLACK
	       CUCUL_COLOR_BLUE CUCUL_COLOR_BROWN CUCUL_COLOR_CYAN
	       CUCUL_COLOR_DARKGRAY CUCUL_COLOR_DEFAULT CUCUL_COLOR_GREEN
	       CUCUL_COLOR_LIGHTBLUE CUCUL_COLOR_LIGHTCYAN
	       CUCUL_COLOR_LIGHTGRAY CUCUL_COLOR_LIGHTGREEN
	       CUCUL_COLOR_LIGHTMAGENTA CUCUL_COLOR_LIGHTRED
	       CUCUL_COLOR_MAGENTA CUCUL_COLOR_RED CUCUL_COLOR_TRANSPARENT
	       CUCUL_COLOR_WHITE CUCUL_COLOR_YELLOW CUCUL_CYAN CUCUL_DARKGRAY
	       CUCUL_DEFAULT CUCUL_GREEN CUCUL_ITALICS CUCUL_LIGHTBLUE
	       CUCUL_LIGHTCYAN CUCUL_LIGHTGRAY CUCUL_LIGHTGREEN
	       CUCUL_LIGHTMAGENTA CUCUL_LIGHTRED CUCUL_MAGENTA CUCUL_RED
	       CUCUL_TRANSPARENT CUCUL_UNDERLINE CUCUL_WHITE CUCUL_YELLOW
	       __extern caca_get_cursor_x caca_get_cursor_y cucul_attr_to_ansi
	       cucul_attr_to_ansi_bg cucul_attr_to_ansi_fg cucul_attr_to_argb64
	       cucul_attr_to_rgb12_bg cucul_attr_to_rgb12_fg cucul_blit
	       cucul_canvas_set_figfont cucul_canvas_t cucul_clear_canvas
	       cucul_cp437_to_utf32 cucul_create_canvas cucul_create_dither
	       cucul_create_frame cucul_display_t cucul_dither_bitmap
	       cucul_dither_t cucul_draw_box cucul_draw_circle
	       cucul_draw_cp437_box cucul_draw_ellipse cucul_draw_line
	       cucul_draw_polyline cucul_draw_thin_box cucul_draw_thin_ellipse
	       cucul_draw_thin_line cucul_draw_thin_polyline
	       cucul_draw_thin_triangle cucul_draw_triangle cucul_event_t
	       cucul_export_memory cucul_file_close cucul_file_eof
	       cucul_file_gets cucul_file_open cucul_file_read cucul_file_t
	       cucul_file_tell cucul_file_write cucul_fill_box
	       cucul_fill_ellipse cucul_fill_triangle cucul_flip cucul_flop
	       cucul_flush_figlet cucul_font_t cucul_free_canvas
	       cucul_free_dither cucul_free_font cucul_free_frame
	       cucul_get_attr cucul_get_canvas_attrs cucul_get_canvas_chars
	       cucul_get_canvas_handle_x cucul_get_canvas_handle_y
	       cucul_get_canvas_height cucul_get_canvas_width cucul_get_char
	       cucul_get_cursor_x cucul_get_cursor_y cucul_get_dither_algorithm
	       cucul_get_dither_algorithm_list cucul_get_dither_antialias
	       cucul_get_dither_antialias_list cucul_get_dither_brightness
	       cucul_get_dither_charset cucul_get_dither_charset_list
	       cucul_get_dither_color cucul_get_dither_color_list
	       cucul_get_dither_contrast cucul_get_dither_gamma
	       cucul_get_export_list cucul_get_font_blocks
	       cucul_get_font_height cucul_get_font_list cucul_get_font_width
	       cucul_get_frame_count cucul_get_frame_name cucul_get_import_list
	       cucul_get_version cucul_getchar cucul_gotoxy cucul_import_file
	       cucul_import_memory cucul_invert cucul_load_font
	       cucul_manage_canvas cucul_printf cucul_put_attr cucul_put_char
	       cucul_put_figchar cucul_put_str cucul_putchar cucul_rand
	       cucul_render_canvas cucul_rotate_180 cucul_rotate_left
	       cucul_rotate_right cucul_set_attr cucul_set_canvas_boundaries
	       cucul_set_canvas_handle cucul_set_canvas_size
	       cucul_set_color_ansi cucul_set_color_argb
	       cucul_set_dither_algorithm cucul_set_dither_antialias
	       cucul_set_dither_brightness cucul_set_dither_charset
	       cucul_set_dither_color cucul_set_dither_contrast
	       cucul_set_dither_gamma cucul_set_dither_palette cucul_set_frame
	       cucul_set_frame_name cucul_stretch_left cucul_stretch_right
	       cucul_unmanage_canvas cucul_utf32_is_fullwidth
	       cucul_utf32_to_ascii cucul_utf32_to_cp437 cucul_utf32_to_utf8
	       cucul_utf8_to_utf32),
            {name=>"CACA_BLACK", type=>"IV", macro=>"1"},
            {name=>"CACA_BLINK", type=>"IV", macro=>"1"},
            {name=>"CACA_BLUE", type=>"IV", macro=>"1"},
            {name=>"CACA_BOLD", type=>"IV", macro=>"1"},
            {name=>"CACA_BROWN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BLACK", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BLINK", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BLUE", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BROWN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BW40", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_BW80", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_C40", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_C4350", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_C80", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_CYAN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_DARKGRAY", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_GREEN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LASTMODE", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTBLUE", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTCYAN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTGRAY", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTGREEN", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTMAGENTA", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_LIGHTRED", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_MAGENTA", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_MONO", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_RED", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_WHITE", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO_YELLOW", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO__NOCURSOR", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO__NORMALCURSOR", type=>"IV", macro=>"1"},
            {name=>"CACA_CONIO__SOLIDCURSOR", type=>"IV", macro=>"1"},
            {name=>"CACA_CYAN", type=>"IV", macro=>"1"},
            {name=>"CACA_DARKGRAY", type=>"IV", macro=>"1"},
            {name=>"CACA_DEFAULT", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_ANY", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_KEY_PRESS", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_KEY_RELEASE", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_MOUSE_MOTION", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_MOUSE_PRESS", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_MOUSE_RELEASE", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_NONE", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_QUIT", type=>"IV", macro=>"1"},
            {name=>"CACA_EVENT_RESIZE", type=>"IV", macro=>"1"},
            {name=>"CACA_GREEN", type=>"IV", macro=>"1"},
            {name=>"CACA_ITALICS", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_BACKSPACE", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_A", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_B", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_C", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_D", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_E", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_F", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_G", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_J", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_K", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_L", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_N", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_O", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_P", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_Q", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_R", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_T", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_U", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_V", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_W", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_X", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_Y", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_CTRL_Z", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_DELETE", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_DOWN", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_END", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_ESCAPE", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F1", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F10", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F11", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F12", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F13", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F14", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F15", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F2", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F3", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F4", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F5", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F6", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F7", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F8", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_F9", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_HOME", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_INSERT", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_LEFT", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_PAGEDOWN", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_PAGEUP", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_PAUSE", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_RETURN", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_RIGHT", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_TAB", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_UNKNOWN", type=>"IV", macro=>"1"},
            {name=>"CACA_KEY_UP", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTBLUE", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTCYAN", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTGRAY", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTGREEN", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTMAGENTA", type=>"IV", macro=>"1"},
            {name=>"CACA_LIGHTRED", type=>"IV", macro=>"1"},
            {name=>"CACA_MAGENTA", type=>"IV", macro=>"1"},
            {name=>"CACA_RED", type=>"IV", macro=>"1"},
            {name=>"CACA_TRANSPARENT", type=>"IV", macro=>"1"},
            {name=>"CACA_UNDERLINE", type=>"IV", macro=>"1"},
            {name=>"CACA_WHITE", type=>"IV", macro=>"1"},
            {name=>"CACA_YELLOW", type=>"IV", macro=>"1"});

print constant_types(), "\n"; # macro defs
foreach (C_constant ("Caca", 'constant', 'IV', $types, undef, 3, @names) ) {
    print $_, "\n"; # C constant subs
}
print "\n#### XS Section:\n";
print XS_constant ("Caca", $types);
__END__
   */

  switch (len) {
  case 8:
    /* Names all of length 8.  */
    /* CACA_RED __extern */
    /* Offset 5 gives the best switch position.  */
    switch (name[5]) {
    case 'R':
      if (memEQ(name, "CACA_RED", 8)) {
      /*                    ^        */
        *iv_return = CACA_RED;
        return PERL_constant_ISIV;
      }
      break;
    case 'e':
      if (memEQ(name, "__extern", 8)) {
      /*                    ^        */
#ifdef __extern
        *iv_return = __extern;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  case 9:
    return constant_9 (aTHX_ name, iv_return);
    break;
  case 10:
    return constant_10 (aTHX_ name, iv_return);
    break;
  case 11:
    return constant_11 (aTHX_ name, iv_return);
    break;
  case 12:
    return constant_12 (aTHX_ name, iv_return);
    break;
  case 13:
    return constant_13 (aTHX_ name, iv_return);
    break;
  case 14:
    return constant_14 (aTHX_ name, iv_return);
    break;
  case 15:
    return constant_15 (aTHX_ name, iv_return);
    break;
  case 16:
    return constant_16 (aTHX_ name, iv_return);
    break;
  case 17:
    return constant_17 (aTHX_ name, iv_return);
    break;
  case 18:
    return constant_18 (aTHX_ name, iv_return);
    break;
  case 19:
    return constant_19 (aTHX_ name, iv_return);
    break;
  case 20:
    return constant_20 (aTHX_ name, iv_return);
    break;
  case 21:
    return constant_21 (aTHX_ name, iv_return);
    break;
  case 22:
    return constant_22 (aTHX_ name, iv_return);
    break;
  case 23:
    return constant_23 (aTHX_ name, iv_return);
    break;
  case 24:
    return constant_24 (aTHX_ name, iv_return);
    break;
  case 25:
    return constant_25 (aTHX_ name, iv_return);
    break;
  case 26:
    return constant_26 (aTHX_ name, iv_return);
    break;
  case 27:
    return constant_27 (aTHX_ name, iv_return);
    break;
  case 29:
    if (memEQ(name, "cucul_get_dither_charset_list", 29)) {
#ifdef cucul_get_dither_charset_list
      *iv_return = cucul_get_dither_charset_list;
      return PERL_constant_ISIV;
#else
      return PERL_constant_NOTDEF;
#endif
    }
    break;
  case 31:
    /* Names all of length 31.  */
    /* cucul_get_dither_algorithm_list cucul_get_dither_antialias_list */
    /* Offset 18 gives the best switch position.  */
    switch (name[18]) {
    case 'l':
      if (memEQ(name, "cucul_get_dither_algorithm_list", 31)) {
      /*                                 ^                   */
#ifdef cucul_get_dither_algorithm_list
        *iv_return = cucul_get_dither_algorithm_list;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    case 'n':
      if (memEQ(name, "cucul_get_dither_antialias_list", 31)) {
      /*                                 ^                   */
#ifdef cucul_get_dither_antialias_list
        *iv_return = cucul_get_dither_antialias_list;
        return PERL_constant_ISIV;
#else
        return PERL_constant_NOTDEF;
#endif
      }
      break;
    }
    break;
  }
  return PERL_constant_NOTFOUND;
}

