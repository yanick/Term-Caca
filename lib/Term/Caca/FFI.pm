package Term::Caca::FFI;
# ABSTRACT: ffi bindings to libcaca 

=head1 DESCRIPTION 

Internal bindings to the libcaca functions. Nothing
interesting to see here for users.

=cut 

use Alien::caca;

use FFI::Platypus;
use FFI::TinyCC;

use Exporter::Shiny qw/
    caca_clear_canvas
    caca_create_display
    caca_create_display_with_driver
    caca_draw_box
    caca_draw_circle
    caca_draw_ellipse
    caca_draw_line
    caca_draw_polyline
    caca_draw_thin_box
    caca_draw_thin_ellipse
    caca_draw_thin_line
    caca_draw_thin_polyline
    caca_draw_thin_triangle
    caca_draw_triangle
    caca_export
    caca_export_canvas_to_memory
    caca_fill_box
    caca_fill_ellipse
    caca_fill_triangle
    caca_free_display
    caca_free_event
    caca_get_canvas
    caca_get_canvas_height
    caca_get_canvas_width
    caca_get_display_driver_list
    caca_get_display_time
    caca_get_event_key_ch
    caca_get_event_mouse_button
    caca_get_event_mouse_x
    caca_get_event_mouse_y
    caca_get_event_resize_height
    caca_get_event_resize_width
    caca_get_event_type
    caca_get_mouse_x
    caca_get_mouse_y
    caca_my_get_event
    caca_put_char
    caca_put_str
    caca_refresh_display
    caca_set_color_ansi
    caca_set_color_argb
    caca_set_display_time
    caca_set_display_title
/;

my $ffi = FFI::Platypus->new;
$ffi->lib(Alien::caca->dynamic_libs);

$ffi->load_custom_type('::StringArray' => 'string_array');
 
$ffi->attach( 'caca_get_display_driver_list' => [] => 'string_array' );
$ffi->attach( 'caca_create_display_with_driver' => [ 'opaque', 'string' ] => 'opaque' );
$ffi->attach( 'caca_create_display' => [ ] => 'opaque' );
$ffi->attach( 'caca_set_display_title' => [ 'opaque', 'string' ] => 'int' );
$ffi->attach( 'caca_set_display_time' => [ 'opaque', 'int' ] => 'int' );
$ffi->attach( 'caca_get_display_time' => [ 'opaque' ] => 'int' );
$ffi->attach( 'caca_get_canvas' => [ 'opaque' ] => 'opaque' );
$ffi->attach( 'caca_set_color_argb' => [ 'opaque', 'int' ] => 'opaque' );
$ffi->attach( 'caca_put_char' => [ 'opaque', 'int', 'int', 'char' ] => 'void' );
$ffi->attach( 'caca_put_str' => [ 'opaque', 'int', 'int', 'string' ] => 'void' );
$ffi->attach( 'caca_refresh_display' => [ 'opaque' ] => 'opaque' );
$ffi->attach( 'caca_get_mouse_x' => ['opaque'] => 'int' );
$ffi->attach( 'caca_get_mouse_y' => ['opaque'] => 'int' );
$ffi->attach( 'caca_fill_triangle' => ['opaque', ( 'int' ) x 6, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_triangle' => ['opaque', ( 'int' ) x 6, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_thin_triangle' => ['opaque', ( 'int' ) x 6 ] => 'void' );
$ffi->attach( 'caca_clear_canvas' => ['opaque'] => 'void' );
$ffi->attach( 'caca_fill_box' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_box' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_thin_box' => ['opaque', ( 'int' ) x 4 ] => 'void' );
$ffi->attach( 'caca_fill_ellipse' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_ellipse' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_thin_ellipse' => ['opaque', ( 'int' ) x 4 ] => 'void' );
$ffi->attach( 'caca_draw_circle' => ['opaque', ( 'int' ) x 3, 'char' ] => 'void' );

$ffi->attach( 'caca_draw_polyline' => ['opaque', 'int[]', 'int[]', 'int', 'char' ] => 'void' );
$ffi->attach( 'caca_draw_thin_polyline' => ['opaque', 'int[]', 'int[]', 'int' ] => 'void' );

$ffi->attach( 'caca_draw_line' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );
$ffi->attach( 'caca_draw_thin_line' => ['opaque', ( 'int' ) x 4, 'char' ] => 'void' );

$ffi->attach( 'caca_get_canvas_width' => ['opaque'] => 'int' );
$ffi->attach( 'caca_get_canvas_height' => ['opaque'] => 'int' );

$ffi->attach( 'caca_export_canvas_to_memory' => [ 'opaque', 'string', 'opaque' ]
        => 'string' );

$ffi->attach( caca_set_color_ansi => [ 'opaque', 'int', 'int' ] => 'void' );
$ffi->attach( caca_get_event_type => [ 'opaque' ] => 'int' );
$ffi->attach( caca_get_event_key_ch => [ 'opaque' ] => 'char' );

$ffi->attach( caca_get_event_mouse_x => [ 'opaque' ] => 'int' );
$ffi->attach( caca_get_event_mouse_y => [ 'opaque' ] => 'int' );
$ffi->attach( caca_get_event_resize_width => [ 'opaque' ] => 'int' );
$ffi->attach( caca_get_event_resize_height => [ 'opaque' ] => 'int' );

$ffi->attach( caca_get_event_mouse_button => [ 'opaque' ] => 'int' );

 
my $tcc = FFI::TinyCC->new;

$tcc->set_options( Alien::caca->cflags);
$tcc->detect_sysinclude_path;
$tcc->add_symbol( caca_get_event => $ffi->find_symbol( 'caca_get_event' ) );


$tcc->compile_string(q/
  #include <stdint.h>;
  #include <caca.h>;
  #include <caca_types.h>;

  char *
  caca_export(void *canvas, char *format ) {
    int size;
    return caca_export_canvas_to_memory( canvas, format, &size );
  }

  caca_event_t*
    caca_my_get_event(void *display, int event_mask, int timeout, int want_event ) {
        caca_event_t * ev;
        puts("hi!\n");
        ev = want_event ? malloc( sizeof( caca_event_t ) ) : NULL;
        caca_get_event(display, event_mask, ev, timeout);
        return ev;
  }

  void caca_free_event(caca_event_t *goner) {
    free(goner);
  }

/);
 
$ffi->attach( [ $tcc->get_symbol('caca_free_event') => 'caca_free_event' ], ['opaque'], 'void' );
$ffi->attach( 'caca_free_display', ['opaque'], 'void' );

my $address = $tcc->get_symbol('caca_export');
$ffi->attach([$address => 'caca_export'] => ['opaque', 'string'] => 'string');
 
my $a2 = $tcc->get_symbol('caca_my_get_event');
$ffi->attach([$a2 => 'caca_my_get_event'] => ['opaque', 'int', 'int', 'int' ] => 'opaque');

1;
