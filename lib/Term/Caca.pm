package Term::Caca;
#ABSTRACT: perl interface for libcaca (Colour AsCii Art library)

use 5.20.0;
use strict;
use warnings;
no warnings qw/ uninitialized /;

our $VERSION = '2.0_0';

use Carp;
use Const::Fast;
use List::MoreUtils qw/ uniq /;
use List::Util qw/ pairmap /;

use Alien::caca;
use FFI::Platypus;

use Term::Caca::Event::Key::Press;
use Term::Caca::Event::Key::Release;
use Term::Caca::Event::Mouse::Motion;
use Term::Caca::Event::Mouse::Button::Press;
use Term::Caca::Event::Mouse::Button::Release;
use Term::Caca::Event::Resize;
use Term::Caca::Event::Quit;

use Moose;

use MooseX::Attribute::Chained;
use MooseX::MungeHas { 
    has_ro => [ 'is_ro' ], 
    has_rw => [ 'is_rw' ], 
};

use experimental qw/
    signatures
    postderef
/;

my $ffi = FFI::Platypus->new;
$ffi->lib(Alien::caca->dynamic_libs);

$ffi->load_custom_type('::StringArray' => 'string_array');
$ffi->load_custom_type('::StringPointer' => 'string_pointer');
 
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

use FFI::TinyCC;
 
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

our @ISA;
push @ISA, 'Exporter';

our @EXPORT_OK;
our %EXPORT_TAGS;

const our %COLORS => (
  BLACK              => 0,
  BLUE               => 1,
  GREEN              => 2,
  CYAN               => 3,
  RED                => 4,
  MAGENTA            => 5,
  BROWN              => 6,
  LIGHTGRAY          => 7,
  DARKGRAY           => 8,
  LIGHTBLUE          => 9,
  LIGHTGREEN         => 10,
  LIGHTCYAN          => 11,
  LIGHTRED           => 12,
  LIGHTMAGENTA       => 13,
  YELLOW             => 14,
  WHITE              => 15,
  DEFAULT            => 16,
  TRANSPARENT        => 32,
);

const our $BLACK              => 0;
const our $BLUE               => 1;
const our $GREEN              => 2;
const our $CYAN               => 3;
const our $RED                => 4;
const our $MAGENTA            => 5;
const our $BROWN              => 6;
const our $LIGHTGRAY          => 7;
const our $DARKGRAY           => 8;
const our $LIGHTBLUE          => 9;
const our $LIGHTGREEN         => 10;
const our $LIGHTCYAN          => 11;
const our $LIGHTRED           => 12;
const our $LIGHTMAGENTA       => 13;
const our $YELLOW             => 14;
const our $WHITE              => 15;
const our $DEFAULT            => 16;
const our $TRANSPARENT        => 32;

$EXPORT_TAGS{colors} = [ map { '$'.$_ } keys %COLORS ];
push @EXPORT_OK, '@COLORS', @{$EXPORT_TAGS{colors}};



const our %EVENTS => (
    NO_EVENT =>          0x0000,
    KEY_PRESS =>     0x0001,
    KEY_RELEASE =>   0x0002,
    MOUSE_PRESS =>   0x0004,
    MOUSE_RELEASE => 0x0008,
    MOUSE_MOTION =>  0x0010,
    RESIZE =>        0x0020,
    QUIT =>          0x0040,
    ANY_EVENT =>           0xffff,
);

const our $NO_EVENT =>          0x0000;
const our $KEY_PRESS =>     0x0001;
const our $KEY_RELEASE =>   0x0002;
const our $MOUSE_PRESS =>   0x0004;
const our $MOUSE_RELEASE => 0x0008;
const our $MOUSE_MOTION =>  0x0010;
const our $RESIZE =>        0x0020;
const our $QUIT =>          0x0040;
const our $ANY_EVENT =>           0xffff;

$EXPORT_TAGS{events} = [ map { '$'.$_ } keys %EVENTS ];
push @EXPORT_OK, '@EVENTS', @{$EXPORT_TAGS{events}};

push @{$EXPORT_TAGS{all}}, uniq map { @$_ } values %EXPORT_TAGS;

sub driver_list {
    +{ caca_get_display_driver_list()->@* } 
}

sub drivers {
    keys driver_list()->%*;
}

has_ro driver =>
    predicate => 1;

has_ro display => 
    predicate => 1,
    lazy => 1,
    default => sub($self) {
        ( $self->has_driver 
            ? caca_create_display_with_driver(undef,$self->driver)
            : caca_create_display() ) or croak "couldn't create display";
    };

has_ro canvas => sub($self) { caca_get_canvas($self->display) };

has_rw title => (
    traits => [ 'Chained' ],
    trigger => sub($self,$title) {
        caca_set_display_title($self->display, $title);
    }
);

has_rw refresh_delay => (
    traits => [ 'Chained' ],
    trigger => sub($self,$seconds) {
        caca_set_display_time($self->display,int( $seconds * 1_000_000 ));
    }
);

sub refresh ($self) { caca_refresh_display($self->display); return $self }

sub rendering_time($self) {
  return caca_get_display_time($self->display)/1_000_000;
}

sub set_color( $self, $foreground, $background ) {
    if ( exists $COLORS{uc $foreground} ) {
        return $self->set_ansi_color( 
            map { $COLORS{uc $_} } $foreground, $background 
        );
    }

    caca_set_color_argb($self->canvas,map { $self->_arg_to_color( $_ ) } $foreground, $background );
}

sub _arg_to_color($self,$arg) {

    return hex $arg unless ref $arg;

    return hex sprintf "%x%x%x%x", @$arg;
}

sub char ( $self, $coord, $char ) {
    caca_put_char( $self->canvas, @$coord, ord substr $char, 0, 1 );
}

sub mouse_position($self) {
    [ caca_get_mouse_x( $self->display ), caca_get_mouse_y( $self->display ) ];
}

sub triangle  ( $self, $pa, $pb, $pc, $char = undef, $fill = undef ){
  $char //= $fill;

  my @args = ( $self->canvas, @$pa, @$pb, @$pc );

  if ( defined $fill ) {
    caca_fill_triangle(@args, ord $char);
  }
  elsif( defined $char ) {
    caca_draw_triangle(@args, ord $char);
  }
  else {
    caca_draw_thin_triangle(@args);
  }

  return $self;
}

sub clear ($self) {
  caca_clear_canvas($self->canvas);
  return $self;
}

sub box  ( $self, $c1, $c2, $char = undef, $fill = undef ){
  $char //= $fill;

  my @args = ( $self->canvas, @$c1, @$c2 );

  if ( defined $fill ) {
    caca_fill_box(@args, ord $char);
  }
  elsif( defined $char ) {
    caca_draw_box(@args, ord $char);
  }
  else {
    caca_draw_thin_box(@args);
  }

  return $self;
}

sub ellipse ( $self, $center, $rx, $ry, $char = undef, $fill = undef ) {
    $char //= $fill;

    if ( defined $fill ) {
        caca_fill_ellipse($self->canvas,@$center,$rx,$ry,ord $char);
    }
    elsif( defined $char ) {
        caca_draw_ellipse($self->canvas,@$center,$rx,$ry,ord $char);
    }
    else {
        caca_draw_thin_ellipse($self->canvas,@$center,$rx,$ry);
    }

  return $self;
}

sub circle ( $self, $center, $radius, $char = undef, $fill = undef ) {
    $char //= $fill;

    my @args = ( $self->canvas, @$center, $radius );

    if ( not defined $char ) {
        caca_draw_thin_ellipse( @args, $radius );
    }
    else {
        if ( defined $fill ) {
            caca_fill_ellipse( @args, $radius, ord $char );
        }
        else {
            caca_draw_circle( @args, ord $char );
        }
    }

  return $self;
}

sub text ( $self, $coord, $text ) {
    length $text > 1 
        ? caca_put_str( $self->canvas, @$coord, $text )
        : caca_put_char( $self->canvas, @$coord, ord $text );        

    return $self;
}

sub polyline( $self, $points, $char = undef, $close = 0 ) {
    my @x = map { $_->[0] } @$points;
    my @y = map { $_->[1] } @$points;
    my $n = @x - !$close;

    $char ? caca_draw_polyline( $self->canvas, \@x, \@y, $n, ord $char )
          : caca_draw_thin_polyline( $self->canvas, \@x, \@y, $n );

    return $self;
}

sub line ( $self, $pa, $pb, $char = undef ) {
    defined ( $char ) 
    ? caca_draw_line($self->canvas, @$pa, @$pb, ord $char)
    : caca_draw_thin_line($self->canvas,  @$pa, @$pb );

    return $self;
}

sub canvas_width($self) {
  return caca_get_canvas_width($self->canvas);
}

sub canvas_height($self) {
  return caca_get_canvas_height($self->canvas);
}


# TODO: troff seems to trigger a segfault
my @export_formats = qw/ caca ansi text html html3 irc ps svg tga /;

sub export( $self, $format = 'caca' ) {

    croak "format '$format' not supported"
        unless grep { $format eq $_ } @export_formats;

    my $export = caca_export_canvas_to_memory( $self->canvas, $format eq 'text' ? 'ansi' : $format, $address );

    no warnings 'uninitialized';
    $export =~ s/\e\[?.*?[\@-~]//g if $format eq 'text';
    
    return $export;
}

sub canvas_size($self) {
    my @d = ( $self->canvas_width, $self->canvas_height );

    return wantarray ? @d : \@d;
}

sub set_ansi_color( $self, $foreground, $background ) {
    caca_set_color_ansi( $self->canvas, $foreground, $background );

    return $self;
}

my %event_map = pairmap { $a => 'Term::Caca::Event::' . $b } (
     $KEY_PRESS     => 'Key::Press',
     $KEY_RELEASE   => 'Key::Release',
     $MOUSE_MOTION  => 'Mouse::Motion',
     $MOUSE_PRESS   => 'Mouse::Button::Press',
     $MOUSE_RELEASE => 'Mouse::Button::Release',
     $RESIZE        => 'Resize',
     $QUIT          => 'Quit',
);

sub wait_for_event ( $self, $mask = $ANY_EVENT, $timeout = 0 ) {

  $mask //= $ANY_EVENT;
  $timeout *= 1_000_000 unless $timeout == -1;

  my $event = caca_my_get_event( $self->display, $mask, $timeout, (defined wantarray) ? 1 : 0 )
      or return;

  my $class = $event_map{ caca_get_event_type( $event ) } or return;

  return $class->new( event => $event );

}

sub DEMOLISH {
  my $self = shift;
  caca_free_display( $self->{display} ) if $self->has_display;
}

'Term::Caca';

__END__
