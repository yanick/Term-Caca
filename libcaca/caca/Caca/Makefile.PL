use 5.012000;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Caca',
    VERSION_FROM      => 'lib/Caca.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Caca.pm', # retrieve abstract from module
       AUTHOR         => 'Yanick Champoux <yanick@babyl.dyndns.org>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
    INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
if  (eval {require ExtUtils::Constant; 1}) {
  # If you edit these definitions to change the constants used by this module,
  # you will need to use the generated const-c.inc and const-xs.inc
  # files to replace their "fallback" counterparts before distributing your
  # changes.
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
		 __extern caca_get_cursor_x caca_get_cursor_y
		 cucul_attr_to_ansi cucul_attr_to_ansi_bg cucul_attr_to_ansi_fg
		 cucul_attr_to_argb64 cucul_attr_to_rgb12_bg
		 cucul_attr_to_rgb12_fg cucul_blit cucul_canvas_set_figfont
		 cucul_canvas_t cucul_clear_canvas cucul_cp437_to_utf32
		 cucul_create_canvas cucul_create_dither cucul_create_frame
		 cucul_display_t cucul_dither_bitmap cucul_dither_t
		 cucul_draw_box cucul_draw_circle cucul_draw_cp437_box
		 cucul_draw_ellipse cucul_draw_line cucul_draw_polyline
		 cucul_draw_thin_box cucul_draw_thin_ellipse
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
		 cucul_get_cursor_x cucul_get_cursor_y
		 cucul_get_dither_algorithm cucul_get_dither_algorithm_list
		 cucul_get_dither_antialias cucul_get_dither_antialias_list
		 cucul_get_dither_brightness cucul_get_dither_charset
		 cucul_get_dither_charset_list cucul_get_dither_color
		 cucul_get_dither_color_list cucul_get_dither_contrast
		 cucul_get_dither_gamma cucul_get_export_list
		 cucul_get_font_blocks cucul_get_font_height
		 cucul_get_font_list cucul_get_font_width cucul_get_frame_count
		 cucul_get_frame_name cucul_get_import_list cucul_get_version
		 cucul_getchar cucul_gotoxy cucul_import_file
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
		 cucul_set_dither_gamma cucul_set_dither_palette
		 cucul_set_frame cucul_set_frame_name cucul_stretch_left
		 cucul_stretch_right cucul_unmanage_canvas
		 cucul_utf32_is_fullwidth cucul_utf32_to_ascii
		 cucul_utf32_to_cp437 cucul_utf32_to_utf8 cucul_utf8_to_utf32),
              {name=>"CACA_BLACK", macro=>"1"},
              {name=>"CACA_BLINK", macro=>"1"},
              {name=>"CACA_BLUE", macro=>"1"},
              {name=>"CACA_BOLD", macro=>"1"},
              {name=>"CACA_BROWN", macro=>"1"},
              {name=>"CACA_CONIO_BLACK", macro=>"1"},
              {name=>"CACA_CONIO_BLINK", macro=>"1"},
              {name=>"CACA_CONIO_BLUE", macro=>"1"},
              {name=>"CACA_CONIO_BROWN", macro=>"1"},
              {name=>"CACA_CONIO_BW40", macro=>"1"},
              {name=>"CACA_CONIO_BW80", macro=>"1"},
              {name=>"CACA_CONIO_C40", macro=>"1"},
              {name=>"CACA_CONIO_C4350", macro=>"1"},
              {name=>"CACA_CONIO_C80", macro=>"1"},
              {name=>"CACA_CONIO_CYAN", macro=>"1"},
              {name=>"CACA_CONIO_DARKGRAY", macro=>"1"},
              {name=>"CACA_CONIO_GREEN", macro=>"1"},
              {name=>"CACA_CONIO_LASTMODE", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTBLUE", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTCYAN", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTGRAY", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTGREEN", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTMAGENTA", macro=>"1"},
              {name=>"CACA_CONIO_LIGHTRED", macro=>"1"},
              {name=>"CACA_CONIO_MAGENTA", macro=>"1"},
              {name=>"CACA_CONIO_MONO", macro=>"1"},
              {name=>"CACA_CONIO_RED", macro=>"1"},
              {name=>"CACA_CONIO_WHITE", macro=>"1"},
              {name=>"CACA_CONIO_YELLOW", macro=>"1"},
              {name=>"CACA_CONIO__NOCURSOR", macro=>"1"},
              {name=>"CACA_CONIO__NORMALCURSOR", macro=>"1"},
              {name=>"CACA_CONIO__SOLIDCURSOR", macro=>"1"},
              {name=>"CACA_CYAN", macro=>"1"},
              {name=>"CACA_DARKGRAY", macro=>"1"},
              {name=>"CACA_DEFAULT", macro=>"1"},
              {name=>"CACA_EVENT_ANY", macro=>"1"},
              {name=>"CACA_EVENT_KEY_PRESS", macro=>"1"},
              {name=>"CACA_EVENT_KEY_RELEASE", macro=>"1"},
              {name=>"CACA_EVENT_MOUSE_MOTION", macro=>"1"},
              {name=>"CACA_EVENT_MOUSE_PRESS", macro=>"1"},
              {name=>"CACA_EVENT_MOUSE_RELEASE", macro=>"1"},
              {name=>"CACA_EVENT_NONE", macro=>"1"},
              {name=>"CACA_EVENT_QUIT", macro=>"1"},
              {name=>"CACA_EVENT_RESIZE", macro=>"1"},
              {name=>"CACA_GREEN", macro=>"1"},
              {name=>"CACA_ITALICS", macro=>"1"},
              {name=>"CACA_KEY_BACKSPACE", macro=>"1"},
              {name=>"CACA_KEY_CTRL_A", macro=>"1"},
              {name=>"CACA_KEY_CTRL_B", macro=>"1"},
              {name=>"CACA_KEY_CTRL_C", macro=>"1"},
              {name=>"CACA_KEY_CTRL_D", macro=>"1"},
              {name=>"CACA_KEY_CTRL_E", macro=>"1"},
              {name=>"CACA_KEY_CTRL_F", macro=>"1"},
              {name=>"CACA_KEY_CTRL_G", macro=>"1"},
              {name=>"CACA_KEY_CTRL_J", macro=>"1"},
              {name=>"CACA_KEY_CTRL_K", macro=>"1"},
              {name=>"CACA_KEY_CTRL_L", macro=>"1"},
              {name=>"CACA_KEY_CTRL_N", macro=>"1"},
              {name=>"CACA_KEY_CTRL_O", macro=>"1"},
              {name=>"CACA_KEY_CTRL_P", macro=>"1"},
              {name=>"CACA_KEY_CTRL_Q", macro=>"1"},
              {name=>"CACA_KEY_CTRL_R", macro=>"1"},
              {name=>"CACA_KEY_CTRL_T", macro=>"1"},
              {name=>"CACA_KEY_CTRL_U", macro=>"1"},
              {name=>"CACA_KEY_CTRL_V", macro=>"1"},
              {name=>"CACA_KEY_CTRL_W", macro=>"1"},
              {name=>"CACA_KEY_CTRL_X", macro=>"1"},
              {name=>"CACA_KEY_CTRL_Y", macro=>"1"},
              {name=>"CACA_KEY_CTRL_Z", macro=>"1"},
              {name=>"CACA_KEY_DELETE", macro=>"1"},
              {name=>"CACA_KEY_DOWN", macro=>"1"},
              {name=>"CACA_KEY_END", macro=>"1"},
              {name=>"CACA_KEY_ESCAPE", macro=>"1"},
              {name=>"CACA_KEY_F1", macro=>"1"},
              {name=>"CACA_KEY_F10", macro=>"1"},
              {name=>"CACA_KEY_F11", macro=>"1"},
              {name=>"CACA_KEY_F12", macro=>"1"},
              {name=>"CACA_KEY_F13", macro=>"1"},
              {name=>"CACA_KEY_F14", macro=>"1"},
              {name=>"CACA_KEY_F15", macro=>"1"},
              {name=>"CACA_KEY_F2", macro=>"1"},
              {name=>"CACA_KEY_F3", macro=>"1"},
              {name=>"CACA_KEY_F4", macro=>"1"},
              {name=>"CACA_KEY_F5", macro=>"1"},
              {name=>"CACA_KEY_F6", macro=>"1"},
              {name=>"CACA_KEY_F7", macro=>"1"},
              {name=>"CACA_KEY_F8", macro=>"1"},
              {name=>"CACA_KEY_F9", macro=>"1"},
              {name=>"CACA_KEY_HOME", macro=>"1"},
              {name=>"CACA_KEY_INSERT", macro=>"1"},
              {name=>"CACA_KEY_LEFT", macro=>"1"},
              {name=>"CACA_KEY_PAGEDOWN", macro=>"1"},
              {name=>"CACA_KEY_PAGEUP", macro=>"1"},
              {name=>"CACA_KEY_PAUSE", macro=>"1"},
              {name=>"CACA_KEY_RETURN", macro=>"1"},
              {name=>"CACA_KEY_RIGHT", macro=>"1"},
              {name=>"CACA_KEY_TAB", macro=>"1"},
              {name=>"CACA_KEY_UNKNOWN", macro=>"1"},
              {name=>"CACA_KEY_UP", macro=>"1"},
              {name=>"CACA_LIGHTBLUE", macro=>"1"},
              {name=>"CACA_LIGHTCYAN", macro=>"1"},
              {name=>"CACA_LIGHTGRAY", macro=>"1"},
              {name=>"CACA_LIGHTGREEN", macro=>"1"},
              {name=>"CACA_LIGHTMAGENTA", macro=>"1"},
              {name=>"CACA_LIGHTRED", macro=>"1"},
              {name=>"CACA_MAGENTA", macro=>"1"},
              {name=>"CACA_RED", macro=>"1"},
              {name=>"CACA_TRANSPARENT", macro=>"1"},
              {name=>"CACA_UNDERLINE", macro=>"1"},
              {name=>"CACA_WHITE", macro=>"1"},
              {name=>"CACA_YELLOW", macro=>"1"});
  ExtUtils::Constant::WriteConstants(
                                     NAME         => 'Caca',
                                     NAMES        => \@names,
                                     DEFAULT_TYPE => 'IV',
                                     C_FILE       => 'const-c.inc',
                                     XS_FILE      => 'const-xs.inc',
                                  );

}
else {
  use File::Copy;
  use File::Spec;
  foreach my $file ('const-c.inc', 'const-xs.inc') {
    my $fallback = File::Spec->catfile('fallback', $file);
    copy ($fallback, $file) or die "Can't copy $fallback to $file: $!";
  }
}
