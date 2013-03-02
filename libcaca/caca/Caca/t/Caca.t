# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Caca.t'

#########################

# change 'tests => 2' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 2;
BEGIN { use_ok('Caca') };


my $fail = 0;
foreach my $constname (qw(
	CACA_BLACK CACA_BLINK CACA_BLUE CACA_BOLD CACA_BROWN CACA_CONIO_BLACK
	CACA_CONIO_BLINK CACA_CONIO_BLUE CACA_CONIO_BROWN CACA_CONIO_BW40
	CACA_CONIO_BW80 CACA_CONIO_C40 CACA_CONIO_C4350 CACA_CONIO_C80
	CACA_CONIO_CYAN CACA_CONIO_DARKGRAY CACA_CONIO_GREEN
	CACA_CONIO_LASTMODE CACA_CONIO_LIGHTBLUE CACA_CONIO_LIGHTCYAN
	CACA_CONIO_LIGHTGRAY CACA_CONIO_LIGHTGREEN CACA_CONIO_LIGHTMAGENTA
	CACA_CONIO_LIGHTRED CACA_CONIO_MAGENTA CACA_CONIO_MONO CACA_CONIO_RED
	CACA_CONIO_WHITE CACA_CONIO_YELLOW CACA_CONIO__NOCURSOR
	CACA_CONIO__NORMALCURSOR CACA_CONIO__SOLIDCURSOR CACA_CYAN
	CACA_DARKGRAY CACA_DEFAULT CACA_DEPRECATED CACA_EVENT_ANY
	CACA_EVENT_KEY_PRESS CACA_EVENT_KEY_RELEASE CACA_EVENT_MOUSE_MOTION
	CACA_EVENT_MOUSE_PRESS CACA_EVENT_MOUSE_RELEASE CACA_EVENT_NONE
	CACA_EVENT_QUIT CACA_EVENT_RESIZE CACA_GREEN CACA_ITALICS
	CACA_KEY_BACKSPACE CACA_KEY_CTRL_A CACA_KEY_CTRL_B CACA_KEY_CTRL_C
	CACA_KEY_CTRL_D CACA_KEY_CTRL_E CACA_KEY_CTRL_F CACA_KEY_CTRL_G
	CACA_KEY_CTRL_J CACA_KEY_CTRL_K CACA_KEY_CTRL_L CACA_KEY_CTRL_N
	CACA_KEY_CTRL_O CACA_KEY_CTRL_P CACA_KEY_CTRL_Q CACA_KEY_CTRL_R
	CACA_KEY_CTRL_T CACA_KEY_CTRL_U CACA_KEY_CTRL_V CACA_KEY_CTRL_W
	CACA_KEY_CTRL_X CACA_KEY_CTRL_Y CACA_KEY_CTRL_Z CACA_KEY_DELETE
	CACA_KEY_DOWN CACA_KEY_END CACA_KEY_ESCAPE CACA_KEY_F1 CACA_KEY_F10
	CACA_KEY_F11 CACA_KEY_F12 CACA_KEY_F13 CACA_KEY_F14 CACA_KEY_F15
	CACA_KEY_F2 CACA_KEY_F3 CACA_KEY_F4 CACA_KEY_F5 CACA_KEY_F6 CACA_KEY_F7
	CACA_KEY_F8 CACA_KEY_F9 CACA_KEY_HOME CACA_KEY_INSERT CACA_KEY_LEFT
	CACA_KEY_PAGEDOWN CACA_KEY_PAGEUP CACA_KEY_PAUSE CACA_KEY_RETURN
	CACA_KEY_RIGHT CACA_KEY_TAB CACA_KEY_UNKNOWN CACA_KEY_UP CACA_LIGHTBLUE
	CACA_LIGHTCYAN CACA_LIGHTGRAY CACA_LIGHTGREEN CACA_LIGHTMAGENTA
	CACA_LIGHTRED CACA_MAGENTA CACA_MAGIC_FULLWIDTH CACA_RED
	CACA_TRANSPARENT CACA_UNDERLINE CACA_WHITE CACA_YELLOW CUCUL_BLACK
	CUCUL_BLINK CUCUL_BLUE CUCUL_BOLD CUCUL_BROWN CUCUL_COLOR_BLACK
	CUCUL_COLOR_BLUE CUCUL_COLOR_BROWN CUCUL_COLOR_CYAN
	CUCUL_COLOR_DARKGRAY CUCUL_COLOR_DEFAULT CUCUL_COLOR_GREEN
	CUCUL_COLOR_LIGHTBLUE CUCUL_COLOR_LIGHTCYAN CUCUL_COLOR_LIGHTGRAY
	CUCUL_COLOR_LIGHTGREEN CUCUL_COLOR_LIGHTMAGENTA CUCUL_COLOR_LIGHTRED
	CUCUL_COLOR_MAGENTA CUCUL_COLOR_RED CUCUL_COLOR_TRANSPARENT
	CUCUL_COLOR_WHITE CUCUL_COLOR_YELLOW CUCUL_CYAN CUCUL_DARKGRAY
	CUCUL_DEFAULT CUCUL_GREEN CUCUL_ITALICS CUCUL_LIGHTBLUE CUCUL_LIGHTCYAN
	CUCUL_LIGHTGRAY CUCUL_LIGHTGREEN CUCUL_LIGHTMAGENTA CUCUL_LIGHTRED
	CUCUL_MAGENTA CUCUL_RED CUCUL_TRANSPARENT CUCUL_UNDERLINE CUCUL_WHITE
	CUCUL_YELLOW __extern caca_get_cursor_x caca_get_cursor_y
	cucul_attr_to_ansi cucul_attr_to_ansi_bg cucul_attr_to_ansi_fg
	cucul_attr_to_argb64 cucul_attr_to_rgb12_bg cucul_attr_to_rgb12_fg
	cucul_blit cucul_canvas_set_figfont cucul_canvas_t cucul_clear_canvas
	cucul_cp437_to_utf32 cucul_create_canvas cucul_create_dither
	cucul_create_frame cucul_display_t cucul_dither_bitmap cucul_dither_t
	cucul_draw_box cucul_draw_circle cucul_draw_cp437_box
	cucul_draw_ellipse cucul_draw_line cucul_draw_polyline
	cucul_draw_thin_box cucul_draw_thin_ellipse cucul_draw_thin_line
	cucul_draw_thin_polyline cucul_draw_thin_triangle cucul_draw_triangle
	cucul_event_t cucul_export_memory cucul_file_close cucul_file_eof
	cucul_file_gets cucul_file_open cucul_file_read cucul_file_t
	cucul_file_tell cucul_file_write cucul_fill_box cucul_fill_ellipse
	cucul_fill_triangle cucul_flip cucul_flop cucul_flush_figlet
	cucul_font_t cucul_free_canvas cucul_free_dither cucul_free_font
	cucul_free_frame cucul_get_attr cucul_get_canvas_attrs
	cucul_get_canvas_chars cucul_get_canvas_handle_x
	cucul_get_canvas_handle_y cucul_get_canvas_height
	cucul_get_canvas_width cucul_get_char cucul_get_cursor_x
	cucul_get_cursor_y cucul_get_dither_algorithm
	cucul_get_dither_algorithm_list cucul_get_dither_antialias
	cucul_get_dither_antialias_list cucul_get_dither_brightness
	cucul_get_dither_charset cucul_get_dither_charset_list
	cucul_get_dither_color cucul_get_dither_color_list
	cucul_get_dither_contrast cucul_get_dither_gamma cucul_get_export_list
	cucul_get_font_blocks cucul_get_font_height cucul_get_font_list
	cucul_get_font_width cucul_get_frame_count cucul_get_frame_name
	cucul_get_import_list cucul_get_version cucul_getchar cucul_gotoxy
	cucul_import_file cucul_import_memory cucul_invert cucul_load_font
	cucul_manage_canvas cucul_printf cucul_put_attr cucul_put_char
	cucul_put_figchar cucul_put_str cucul_putchar cucul_rand
	cucul_render_canvas cucul_rotate_180 cucul_rotate_left
	cucul_rotate_right cucul_set_attr cucul_set_canvas_boundaries
	cucul_set_canvas_handle cucul_set_canvas_size cucul_set_color_ansi
	cucul_set_color_argb cucul_set_dither_algorithm
	cucul_set_dither_antialias cucul_set_dither_brightness
	cucul_set_dither_charset cucul_set_dither_color
	cucul_set_dither_contrast cucul_set_dither_gamma
	cucul_set_dither_palette cucul_set_frame cucul_set_frame_name
	cucul_stretch_left cucul_stretch_right cucul_unmanage_canvas
	cucul_utf32_is_fullwidth cucul_utf32_to_ascii cucul_utf32_to_cp437
	cucul_utf32_to_utf8 cucul_utf8_to_utf32)) {
  next if (eval "my \$a = $constname; 1");
  if ($@ =~ /^Your vendor has not defined Caca macro $constname/) {
    print "# pass: $@";
  } else {
    print "# fail: $@";
    $fail = 1;
  }

}

ok( $fail == 0 , 'Constants' );
#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

