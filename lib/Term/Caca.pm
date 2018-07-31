package Term::Caca;
#ABSTRACT: perl interface for libcaca (Colour AsCii Art library)

use 5.20.0;
use strict;
use warnings;
no warnings qw/ uninitialized /;

our $VERSION = '2.0_0';

use Carp;
use List::MoreUtils qw/ uniq /;
use List::Util qw/ pairmap /;

use Term::Caca::FFI ':all';

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

our @ISA;
push @ISA, 'Exporter::Tiny';

our @EXPORT_OK;
our %EXPORT_TAGS;

our %COLORS;

BEGIN {
    %COLORS = (
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
}

use constant \%COLORS;

$EXPORT_TAGS{colors} = [ keys %COLORS ];

push @EXPORT_OK, @{$EXPORT_TAGS{colors}};

our %EVENTS;

BEGIN {
    %EVENTS = (
        NO_EVENT =>      0x0000,
        KEY_PRESS =>     0x0001,
        KEY_RELEASE =>   0x0002,
        MOUSE_PRESS =>   0x0004,
        MOUSE_RELEASE => 0x0008,
        MOUSE_MOTION =>  0x0010,
        RESIZE =>        0x0020,
        QUIT =>          0x0040,
        ANY_EVENT =>     0xffff,
    );
}

use constant \%EVENTS;

$EXPORT_TAGS{events} = [ keys %EVENTS ];
push @EXPORT_OK, keys %EVENTS;

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

# TODO fix the colors when they are a constant
sub set_color( $self, $foreground, $background ) {

    if( ref $foreground or 4 == length $foreground ) {
        for( $foreground, $background ) {
            $_ = $self->_arg_to_color($_);
        }
        caca_set_color_argb($self->canvas, $foreground, $background );
    }
    else {
        caca_set_color_ansi($self->canvas, $foreground, $background );
    }

    return $self;
}

sub _arg_to_color($self,$arg) {

    return hex $arg unless ref $arg;

    return hex sprintf "%x%x%x%x", @$arg;
}

sub char ( $self, $coord, $char = undef ) {
    if( defined $char ) {
        caca_put_char( $self->canvas, @$coord, ord $char );
    }
    return $self;
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

sub box  ( $self, $c1, $c2, @rest ){
    @rest = ( thin => 1 ) unless @rest;
    unshift @rest, 'char' if @rest == 1;

    my %opt = @rest;

  my @args = ( $self->canvas, @$c1, @$c2 );

  caca_fill_box(@args, ord $opt{fill}) if $opt{fill};

  caca_draw_box(@args, ord $opt{char}) if $opt{char};

  caca_draw_thin_box(@args) if $opt{thin};

  return $self;
}

sub ellipse ( $self, $center, $rx, $ry, $char = undef, $fill = undef ) {
    $char //= $fill;

    if ( defined $fill ) {
        caca_fill_ellipse($self->canvas,@$center,$rx,$ry,ord $fill);
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

    my $export = caca_export( $self->canvas, $format eq 'text' ? 'ansi' : $format );

    no warnings 'uninitialized';
    $export =~ s/\e\[?.*?[\@-~]//g if $format eq 'text';
    
    return $export;
}

sub canvas_size($self) {
    my @d = ( $self->canvas_width, $self->canvas_height );

    return \@d;
}

sub set_ansi_color( $self, $foreground, $background ) {
    caca_set_color_ansi( $self->canvas, $foreground, $background );

    return $self;
}

my %event_map = pairmap { $a => 'Term::Caca::Event::' . $b } (
     KEY_PRESS     ,=> 'Key::Press',
     KEY_RELEASE   ,=> 'Key::Release',
     MOUSE_MOTION  ,=> 'Mouse::Motion',
     MOUSE_PRESS   ,=> 'Mouse::Button::Press',
     MOUSE_RELEASE ,=> 'Mouse::Button::Release',
     RESIZE        ,=> 'Resize',
     QUIT          ,=> 'Quit',
);

sub wait_for_event ( $self, $mask = ANY_EVENT, $timeout = 0 ) {

  $mask //= ANY_EVENT;
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


=head1 SYNOPSIS

  use Term::Caca;

  my $caca = Term::Caca->new;
  $caca->text( [5, 5], "pwn3d");
  $caca->refresh;
  sleep 3;

=head1 DESCRIPTION

C<Term::Caca> is an API for the ASCII drawing library I<libcaca>.

This version of C<Term::Caca> is compatible with the I<1.x> version of 
the libcaca library (development has been made against version 
0.99.beta19 of the library).

=head1 EXPORTS

=head2 COLORS

    use Term::Caca qw/ :colors /;           # import all colors

    use Term::Caca qw/ WHITE LIGHTRED /;    # import specific colors

The color constants used by C<set_ansi_color()>. The available colors are

  BLACK       BLUE        GREEN       CYAN          RED                 
  MAGENTA     BROWN       LIGHTGRAY   DARKGRAY      LIGHTBLUE           
  LIGHTGREEN  LIGHTCYAN   LIGHTRED    LIGHTMAGENTA  YELLOW              
  WHITE       DEFAULT     TRANSPARENT         


=head2 EVENTS

    use Term::Caca qw/ :events /;                 # import all events

    use Term::Caca qw/  NO_EVENT  KEY_RELEASE /;  # import specific events

The event constants used by the mask of C<wait_for_event()>. The available
events are

    NO_EVENT    ANY_EVENT
    KEY_PRESS   KEY_RELEASE
    MOUSE_PRESS MOUSE_RELEASE   MOUSE_MOTION
    RESIZE      QUIT

=head1 CLASS METHODS

=head3 driver_list 

Returns an hash which keys are the available display drivers
and the values their descriptions.

=head3 drivers 

Returns the list of available drivers.

=head1 METHODS 

=head2 Constructor

=head3 new

Instantiates a Term::Caca object. 

The optional argument I<driver> can be passed to select a specific display
driver. If it's not given, the best available driver will be used.

=head2 Display and Canvas

=head3 title( $title )

Getter/setter for the window title. 

The setter returns the invocant I<Term::Caca> object.

=head3 refresh

Refreshes the display.

Returns the invocant I<Term::Caca> object.

=head3 set_refresh_delay( $seconds )

Sets the refresh delay in seconds. The refresh delay is used by                                                                
C<refresh> to achieve constant framerate.

If the time is zero, constant framerate is disabled. This is the
default behaviour.                                                                                                                 

Returns the invocant I<Term::Caca> object.

=head3 rendering_time()

Returns the average rendering time, which is measured as the time between
two C<refresh()> calls in seconds. If constant framerate is enabled via
C<set_refresh_delay()>, the average rendering time will be close to the 
requested delay even if the real rendering time was shorter.                                   

=head3 clear()

Clears the canvas using the current background color.

Returns the invocant object.

=head3 canvas_size

Returns the width and height of the canvas,
as an array ref.

=head2 canvas_width

Returns the canvas width.

=head3 canvas_height

Returns the canvas height.

=head3 mouse_position 

Returns the position of the mouse as an array ref 

This function is not reliable if the ncurses or S-Lang     
drivers are being used, because mouse position is only detected whe
the mouse is clicked. Other drivers such as X11 work well.

=head2 Import/Export

=head3 import( $drawing, :$format => 'auto' )

TODO

Imports the drawing. The supported formats are

=over

=item "auto": try to guess the format.

=item  "caca": native libcaca files.

=item  "ansi": ANSI art (CP437 charset with ANSI colour codes).

=item  "text": ASCII text file.

=item  "utf8": UTF-8 text with ANSI color codes.

=back

=head3 export( $format )

Returns the canvas in the given format.

Supported formats are

=over

=item  "caca": native libcaca files.

=item  "ansi": ANSI art (CP437 charset with ANSI colour codes).

=item  "text": ASCII text file.

=item  "html": an HTML page with CSS information.

=item  "html3": an HTML table that should be compatible with most navigators, including textmode ones.

=item  "irc": UTF-8 text with mIRC colour codes.

=item  "ps": a PostScript document.

=item  "svg": an SVG vector image.

=item  "tga": a TGA image.

=back 

If no format is provided, defaults to C<caca>.

=head2 Colors

=head3 set_ansi_color( $foreground, $background )

Sets the foreground and background colors used by primitives,
using colors as defined by the color constants.

    $t->set_ansi_color( LIGHTRED, WHITE );

Returns the invocant object.

=head3 set_color( $foreground, $background ) 

Sets the foreground and background colors used by primitives. 

Each color is an array ref to a ARGB (transparency + RGB) set of values,
all between 0 and 15. Alternatively, they can be given as a string of the direct
hexadecimal value.

    # red on white
    $t->set_color( [ 15, 15, 0, 0 ], 'ffff' );

Returns the invocant object.

=head2 Text

=head3 text( \@coord, $text )

Prints I<$text> at the given coordinates.

Returns the invocant C<Term::Caca> object.

=head3 char( \@coord, $char )

Prints the character I<$char> at the given coordinates.
If I<$char> is a string of more than one character, only
the first character is printed.

Returns the invocant C<Term::Caca> object.

=head2 Primitives Drawing

The drawing of all primitive is controlled by C<drawing_options>. 
Unless specified otherwise, the possible options are: 

If no option is given, or if the option C<thin => 1> is given, 
the primitive will be drawn using ascii art. 

If a single character or the C<char => $x> pair is given, 
then this character  it will be used to trace 
the primitive.

If C<fill => $y> is given, then that character will be used to 
fill the primitive.

C<fill> and C<char> or C<thin> can be used in combination
to produce a primitive drawn with one char and filled with the other.

=head3 line( \@point_a, \@point_b, @drawing_options )

Draws a line from I<@point_a> to I<@point_b>.  In this instance
C<@drawing_options> only accept C<thin> or C<char>.

Returns the invocant object.

=head3 polyline( \@points, @drawing_options ) 

Draws the polyline defined by I<@points>, where each point is an array ref
of the coordinates. E.g.

    $t->polyline( [ [ 0,0 ], [ 10,15 ], [ 20, 15 ] ] );

The additional option I<close> can be given as part of the C<drawing_options>.
If true, the end point of the polyline will be connected to the first point.

Returns the invocant I<Term::Caca> object.

=head3 circle( \@center, $radius, @drawing_options )

Draws a circle centered at I<@center> with a radius
of I<$radius>.

Returns the invocant object.

=head3 ellipse( \@center, $radius_x, $radius_y, @drawing_options )

Draws an ellipse centered at I<@center> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>.

Returns the invocant object.

=head3 box( \@top_corner, $width, $height, @drawing_options )

Draws a rectangle of dimensions I<$width> and
I<$height> with its upper-left corner at I<@top_corner>.


Returns the invocant object.

=head3 triangle( \@point_a, \@point_b, \@point_c, @drawing_options )

Draws a triangle defined by the three given points.

Returns the invocant object.

=head2  Event Handling

=head3 wait_for_event( $mask, $timeout )

Waits and returns a C<Term::Caca::Event> object matching the mask.

C<$timeout> is in seconds. If set to 0 (the default), the method returns immediatly and,
if no event was found, returns nothing. If C<$timeout> is negative,
the method waits forever for an event matching the mask.

    # wait for 5 seconds for a key press or the closing of the window
    my $event = $t->wait_for_event( KEY_PRESS | QUIT, 5 );

    say "user is idle" unless defined $event;

    exit if $event->isa( 'Term::Caca::Event::Quit' );

    say "user typed ", $event->char;

=head1 SEE ALSO

libcaca - L<http://caca.zoy.org/>

=cut
