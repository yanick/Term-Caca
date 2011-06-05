package Term::Caca;
#ABSTRACT: perl interface for libcaca (Colour AsCii Art library)

use 5.10.0;
use strict;
use warnings;
no warnings qw/ uninitialized /;

our $VERSION = 0.98;

use parent qw/ Exporter DynaLoader /;

Term::Caca->bootstrap($VERSION);

use Method::Signatures;
use Const::Fast;
use List::MoreUtils qw/ uniq /;

use Term::Caca::Event::Key::Press;
use Term::Caca::Event::Key::Release;
use Term::Caca::Event::Mouse::Motion;
use Term::Caca::Event::Mouse::Button::Press;
use Term::Caca::Event::Mouse::Button::Release;
use Term::Caca::Event::Resize;
use Term::Caca::Event::Quit;

# exports

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

=method new

This method instantiates a Term::Caca object.  (Note that init() is an alias for new()
and that they may be used interchangeably.)

=cut

sub new {
  my $class = shift;
  my $self = {};
  bless $self, $class;

  $self->{display} = _create_display();
  $self->{canvas}  = _get_canvas($self->{display});

  return $self;
}

method display {
    return $self->{display};
}

method canvas {
    return $self->{canvas};
}

=method set_title( $title )

Sets the window title to I<$title>. 

Returns the invocant I<Term::Caca> object.

=cut

method set_title ( $title ) {
  _set_display_title($self->display, $title);

  return $self;
}


=method set_refresh_delay( $seconds )

Sets the refresh delay in seconds. The refresh delay is used by                                                                
C<refresh> to achieve constant framerate.

If the time is zero, constant framerate is disabled. This is the
default behaviour.                                                                                                                 

Returns the invocant I<Term::Caca> object.

=cut

method set_refresh_delay ( $seconds ) {
  _set_delay($self->display,int( $seconds * 1_000_000 ));
  return $self;
}

=method rendering_time()

Returns the average rendering time, which is measured as the time between
two C<refresh()> calls, in seconds. If constant framerate is enabled via
C<set_refresh_delay()>, the average rendering time will be close to the 
requested delay even if the real rendering time was shorter.                                   

=cut

method rendering_time {
  return _get_delay($self->display)/1_000_000;
}

=method set_ansi_color( $foreground, $background )

Sets the foreground and background colors used by primitives,
using colors as defined by C<%COLORS>.

    $t->set_ansi_color( $LIGHTRED, $WHITE );

Returns the invocant object.

=cut


method set_ansi_color( $foreground, $background ) {
    _set_ansi_color( $self->canvas, $foreground, $background );

    return $self;
}

=method set_color( $foreground, $background ) 

Sets the foreground and background colors used by primitives. 

Each color is an array ref to a ARGB (transparency + RGB) set of values,
all between 0 and 15. Alternatively, they can be given as a string of the direct
hexadecimal value.

    # red on white
    $t->set_color( [ 15, 15, 0, 0 ], 'ffff' );

Returns the invocant object.

=cut

method set_color( $foreground, $background ) {
    if ( exists $COLORS{uc $foreground} ) {
        return $self->set_ansi_color( 
            map { $COLORS{uc $_} } $foreground, $background 
        );
    }

    _set_color( $self->canvas, map { _arg_to_color( $_ ) } $foreground, $background );

    return $self;
}

sub _arg_to_color {
    my $arg = shift;

    return hex $arg unless ref $arg;

    return hex sprintf "%x%x%x%x", @$arg;
}


sub get_feature {
  my ($self, $feature) = @_;
  $feature ||= 0;
  return _get_feature($feature);
}

#
sub set_feature {
  my ($self, $feature) = @_;
  $feature ||= 0;
  _get_feature($feature);
}

#
sub get_feature_name {
  my ($self, $feature) = @_;
  $feature ||= 0;
  return _get_feature_name($feature);
}


=head3 get_rendertime

Returns the average rendering time, which is the average measured time
between two C<refresh()> calls, in microseconds.

If constant
framerate was activated by calling C<set_delay()>, the average
rendering time will be close to the requested delay even if the real
rendering time was shorter.

=cut

sub get_rendertime {
  return _get_rendertime();
}

=method canvas_size

Returns the width and height of the canvas,
as a list in an array context, as a array ref
in a scalar context.

=cut

method canvas_size {
    my @d = ( $self->canvas_width, $self->canvas_height );

    return wantarray ? @d : \@d;
}

=method canvas_width

Returns the canvas width.

=cut

method canvas_width {
  return _get_width($self->canvas);
}

=head3 canvas_height

Returns the canvas height.

=cut

method canvas_height {
  return _get_height($self->canvas);
}

=head3 set_window_title( $title )

Sets the window title to I<$title>. 

Returns the invocant I<Term::Caca> object.

=cut

sub set_window_title {
  my ($self, $title) = @_;
  $title ||= "";

  my $result = _set_window_title($title);

  return $self;
}

#
sub get_window_width {
# my ($self) = @_;
  return _get_window_width();
}

#
sub get_window_height {
# my ($self) = @_;
  return _get_window_height();
}


=head3 refresh

Refreshes the display.

Returns the invocant I<Term::Caca> object.

=cut

method refresh {
  _refresh($self->display);
  return $self;
}

sub DESTROY {
    my $self = shift;
  _free_display( $self->{display} ) if $self->{display};
}

# Event handling

#
method wait_for_event ( :$mask = $ANY_EVENT, :$timeout = 0 ) {
  my $event = _get_event( $self->display, $mask, $timeout, defined wantarray )
      or return;

  given ( _get_event_type( $event ) ) {
    when ( $KEY_PRESS ) {
        return Term::Caca::Event::Key::Press->new( event => $event );
    }
    when ( $KEY_RELEASE ) {
        return Term::Caca::Event::Key::Release->new( event => $event );
    }
    when ( $MOUSE_MOTION ) {
        return Term::Caca::Event::Mouse::Motion->new( event => $event );
    }
    when ( $MOUSE_PRESS ) {
        return Term::Caca::Event::Mouse::Button::Press->new( event => $event );
    }
    when ( $MOUSE_RELEASE ) {
        return Term::Caca::Event::Mouse::Button::Release->new( event => $event );
    }
    when ( $RESIZE ) {
        return Term::Caca::Event::Resize->new( event => $event );
    }
    when ( $QUIT ) {
        return Term::Caca::Event::Quit->new( event => $event );
    }
    default {
        return;
    }
  }

}

=method mouse_position 

Returns the position of the mouse. In a list context, returns
the I<x>, I<y> coordinates, in a scalar context returns them as an
array ref.

This function is not reliable if the ncurses or S-Lang                                                            
drivers are being used, because mouse position is only detected when                                                               
the mouse is clicked. Other drivers such as X11 work well.

=cut


method mouse_position {
    my @pos = ( _get_mouse_x( $self->display ), _get_mouse_y( $self->display ) );
    return wantarray ? @pos : \@pos;
}

#
sub get_mouse_x {
# my ($self) = @_;
  return _get_mouse_x();
}

#
sub get_mouse_y {
# my ($self) = @_;
  return _get_mouse_y();
}

1;

# Character printing

#

#
sub get_fg_color {
# my ($self) = @_;
  return _get_fg_color();
}

#
sub get_bg_color {
# my ($self) = @_;
  return _get_bg_color();
}

#
sub get_color_name {
  my ($self, $color) = @_;
  return undef unless(defined($color));
  return _get_color_name($color);
}

=method text( \@coord, $text )

Prints I<$text> at the given coordinates.

Returns the invocant C<Term::Caca> object.

=cut

method text ( $coord, $text ) {
    length $text > 1 
        ? _putstr( $self->canvas, @$coord, $text )
        : _putchar( $self->canvas, @$coord, $text );        

    return $self;
}

=method char( \@coord, $char )

Prints the character I<$char> at the given coordinates.
If I<$char> is a string of more than one character, only
the first character is printed.

Returns the invocant C<Term::Caca> object.

=cut

method char ( $coord, $char ) {
    _putchar( $self->canvas, @$coord, substr $char, 0, 1 );

    return $self;
}

#
sub putchar {
  my ($self, $x, $y, $c) = @_;
  $x ||= 0;
  $y ||= 0;
  $c ||= "";
  _putchar($x, $y, $c);
}

#
sub putstr {
  my ($self, $x, $y, $s) = @_;
  $x ||= 0;
  $y ||= 0;
  $s ||= "";
  _putstr($x, $y, $s);
}


=method printf( $x, $y, $format, @args )

Equivalent to 

    $term->putstr( $x, $y, sprintf( $format, @args ) );

B<DEPRECATED> 
Use C<putstr()> instead.

=cut

# faking it by doing printf on the perl side
sub printf {
  deprecated();
  my ($self, $x, $y, $s, @args) = @_;
  $x ||= 0;
  $y ||= 0;
  my $string = sprintf($s, @args);
  _putstr($x, $y, $string);
}

=method clear()

Clears the canvas using the current background color.

Returns the invocant object.

=cut

method clear () {
  _clear($self->canvas);
  return $self;
}

# Primitives drawing

=method line( \@point_a, \@point_b, :$char = undef )

Draws a line from I<@point_a> to I<@point_b>
using the character I<$char> or, if undefined,
ascii art.

Returns the invocant object.

=cut

method line ( $pa, $pb, :$char = undef ) {
    defined ( $char ) 
    ?  _draw_line($self->canvas, @$pa, @$pb, $char)
    : _draw_thin_line($self->canvas,  @$pa, @$pb );

    return $self;
}

=method polyline( \@points, :$char = undef , :$close = 0 ) 

Draws the polyline defined by I<@points>, where each point is an array ref
of the coordinates. E.g.

    $t->polyline( [ [ 0,0 ], [ 10,15 ], [ 20, 15 ] ] );

The lines are drawn using I<$char> or, if not specified, using ascii art.

If I<$close> is true, the end point of the polyline will 
be connected to the first point.

Returns the invocant I<Term::Caca> object.

=cut

method polyline( $points, :$char = undef, :$close = 0 ) {
    my @x = map { $_->[0] } @$points;
    my @y = map { $_->[1] } @$points;
    my $n = @x - !$close;

    $char ? _draw_polyline( $self->canvas, \@x, \@y, $n, $char )
          : _draw_thin_polyline( $self->canvas, \@x, \@y, $n );

    return $self;
}

=method circle( \@center, $radius, :$char = '*' )

Draws a circle centered at I<@center> with a radius
of I<$radius> using the character I<$char> or, if not defined,
ascii art. if I<$fill> is set to true, the circle is filled with I<$char>
as well.

If I<$fill> is defined but I<$char> is not, I<$fill> will be taken as
the filling character. I.e.,

    $c->circle( [10,10], 5, char => 'x', fill => 1 );
    # equivalent to 
    $c->circle( [10,10], 5, fill => 'x' );

Returns the invocant object.

=cut

method circle ( $center, $radius, :$char = undef, :$fill = undef ) {
    $char //= $fill;

    my @args = ( $self->canvas, @$center, $radius );

    if ( not defined $char ) {
        _draw_thin_ellipse( @args, $radius );
    }
    else {
        if ( defined $fill ) {
            _fill_ellipse( @args, $radius, $char );
        }
        else {
            _draw_circle( @args, $char );
        }
    }

  return $self;
}

=method draw_ellipse( \@center, $radius_x, $radius_y, :$char = undef, :$fill = undef)

Draws an ellipse centered at I<@center> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>
using the character I<$char> or, if not defined, ascii art.

If I<$fill> is defined but I<$char> is not, I<$fill> will be taken as
the filling character.

Returns the invocant object.

=cut

method ellipse ( $center, $rx, $ry, :$char = undef, :$fill = undef ) {
    $char //= $fill;

    if ( defined $fill ) {
        _fill_ellipse($self->canvas,@$center,$rx,$ry,$char);
    }
    elsif( defined $char ) {
        _draw_ellipse($self->canvas,@$center,$rx,$ry,$char);
    }
    else {
        _draw_thin_ellipse($self->canvas,@$center,$rx,$ry);
    }

  return $self;
}


=method box( \@top_corner, $width, $height, :$char => undef, :$fill => undef )

Draws a rectangle of dimensions I<$width> and
I<$height> with its upper-left corner at I<@top_corner>,
using the character I<$char> or, if not defined, ascii art. 

If I<$fill> is defined but I<$char> is not, I<$fill> will be taken as
the filling character.

Returns the invocant object.

=cut

method box  ( $center, $width, $height, :$char = undef, :$fill = undef ){
  $char //= $fill;

  my @args = ( $self->canvas, @$center, $width, $height );

  if ( defined $fill ) {
    _fill_box(@args, $char);
  }
  elsif( defined $char ) {
    _draw_box(@args, $char);
  }
  else {
    _draw_thin_box(@args);
  }

  return $self;
}

=method triangle( \@point_a, \@point_b, \@point_c, :$char => undef, :$fill => undef )

Draws a triangle defined by the three given points
using the character I<$char> or, if not defined, ascii art. 

If I<$fill> is defined but I<$char> is not, I<$fill> will be taken as
the filling character.

Returns the invocant object.

=cut

method triangle  ( $pa, $pb, $pc, :$char = undef, :$fill = undef ){
  $char //= $fill;

  my @args = ( $self->canvas, @$pa, @$pb, @$pc );

  if ( defined $fill ) {
    _fill_triangle(@args, $char);
  }
  elsif( defined $char ) {
    _draw_triangle(@args, $char);
  }
  else {
    _draw_thin_triangle(@args);
  }

  return $self;
}

# Sprite handling

#
sub load_sprite {
  my ($self, $file) = @_;
  my $sprite = _load_sprite($file);
  return $sprite;
}

#
sub get_sprite_frames {
  my ($self, $sprite) = @_;
  return _get_sprite_frames($sprite);
}

#
sub get_sprite_width {
  my ($self, $sprite) = @_;
  return _get_sprite_width($sprite);
}

#
sub get_sprite_height {
  my ($self, $sprite) = @_;
  return _get_sprite_height($sprite);
}

#
sub get_sprite_dx {
  my ($self, $sprite) = @_;
  return _get_sprite_dx($sprite);
}

#
sub get_sprite_dy {
  my ($self, $sprite) = @_;
  return _get_sprite_dy($sprite);
}

#
sub draw_sprite {
  my ($self, $x, $y, $sprite, $f) = @_;
  _draw_sprite($x, $y, $sprite, $f);
}

#
sub free_sprite {
  my ($self, $sprite) = @_;
  _free_sprite($sprite);
}

# Bitmap handling

#
sub create_bitmap {
  my ($self, $bpp, $w, $h, $pitch, $rmask, $gmask, $bmask, $amask) = @_;
  my $bitmap = _create_bitmap($bpp, $w, $h, $pitch, $rmask, $gmask, $bmask, $amask);
  return $bitmap;
}

#
sub set_bitmap_palette {
  my ($self, $bitmap, $red, $green, $blue, $alpha) = @_;
  if (
    4 == (
      grep { tied($_) && tied($_)->can('address') }
        ($red, $green, $blue, $alpha)
    )
    )
  {
    # If a tied arrayrefs that support the addess() method are sent,
    # we use the address of the array.
    _set_bitmap_palette_tied(
      $bitmap,
      tied($red)->address,
      tied($green)->address,
      tied($blue)->address,
      tied($alpha)->address
    );
  } else {
    # Otherwise, the arrayref will be copied into a C array before
    # handing it off to the C function, caca_set_bitmap_palette()
    _set_bitmap_palette_copy($bitmap, $red, $green, $blue, $alpha);
  }
}

#
sub draw_bitmap {
  my ($self, $x1, $y1, $x2, $y2, $bitmap, $pixels) = @_;
  if (tied($pixels) && tied($pixels)->can('address')) {
    # If a tied arrayref that supports the addess() method is sent,
    # we use the address of the array.
    _draw_bitmap_tied($x1, $y1, $x2, $y2, $bitmap, tied($pixels)->address);
  } else {
    # Otherwise, the arrayref will be copied into a C array before
    # handing it off to the C function, caca_draw_bitmap()
    _draw_bitmap_copy($x1, $y1, $x2, $y2, $bitmap, $pixels);
  }
}

sub free_bitmap {
  my ($self, $bitmap) = @_;
  _free_bitmap($bitmap);
}
'end of Term::Caca';

__END__


=head1 SYNOPSIS

Usage:

  use Term::Caca;
  my $caca = Term::Caca->init();
  $caca->putstr(5, 5, "pwn3d");
  $caca->refresh();
  sleep 3;

=head1 DESCRIPTION

=head2 Methods

=head3 get_feature

=head3 set_feature

=head3 get_feature_name

=head3 get_window_width

=head3 get_window_height

=head3 get_event

=head3 get_mouse_x

=head3 get_mouse_y

=head3 wait_event

=head3 get_fg_color

=head3 get_bg_color

=head3 get_color_name

=head3 putchar

=head3 putstr

=head3 clear


=method draw_polyline


=method draw_thin_polyline

=cut
=head3 load_sprite

=head3 get_sprite_frames

=head3 get_sprite_width

=head3 get_sprite_height

=head3 get_sprite_dx

=head3 get_sprite_dy

=head3 draw_sprite

=head3 free_sprite

=head3 create_bitmap

=head3 set_bitmap_palette

=head3 draw_bitmap

=head3 free_bitmap

=head1 AUTHOR

John Beppu E<lt>beppu@cpan.orgE<gt>

=head1 SEE ALSO

L<Term::Caca::Constants|Term::Caca::Constants>,
L<Term::Caca::Sprite|Term::Caca::Sprite>,
L<Term::Caca::Bitmap|Term::Caca::Bitmap>,

L<Term::Kaka|Term::Kaka>

=cut

# vim:sw=2 sts=2 expandtab
# $Id: Caca.pm,v 1.5 2004/10/25 18:14:57 beppu Exp $
