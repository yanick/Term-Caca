package Term::Caca;
#ABSTRACT: perl interface for libcaca (Colour AsCii Art library)

our $VERSION = 0.98;

require Exporter;
require DynaLoader;
@ISA = qw(Exporter DynaLoader);
Term::Caca->bootstrap($VERSION);

use strict;
use warnings;
use Term::Caca::Constants ':all';

use Package::DeprecationManager -deprecations => {
    'Term::Caca::rand' => '0.98',
    'Term::Caca::sqrt' => '0.98',
};
use Method::Signatures;

# Basic functions


=method init

=method new

This method instantiates a Term::Caca object.  (Note that init() is an alias for new()
and that they may be used interchangeably.)

=cut

sub new {
  my ($class) = @_;
  _init();
  my $self = { };
  return bless($self => $class);
}
*init = \*new;

=method set_delay( $usecs )

Sets the amount of time in microseconds between frames to establish
a constant frame rate.

Returns the invocant I<Term::Caca> object.

=cut

sub set_delay {
  my ($self, $usec) = @_;
  $usec ||= 0;
  _set_delay($usec);
  return $self;
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

=method get_width

Returns the canvas width.

=cut

sub get_width {
  return _get_width();
}

=head3 get_height

Returns the canvas height.

=cut

sub get_height {
  return _get_height();
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

sub refresh {
  _refresh();
  return shift;
}

sub DESTROY {
  _end();
}

# Event handling

#
sub get_event {
  my ($self, $event_mask) = @_;
  if (!defined($event_mask)) {
    $event_mask = 0xFFFFFFFF;
  }
  return _get_event($event_mask);
}

=method mouse_position 

Returns the position of the mouse. In a list context, returns
the I<x>, I<y> coordinates, in a scalar context returns an
array ref to them.


=cut

method mouse_position {
    my @pos = ( _get_mouse_x(), _get_mouse_y() );
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

#
sub wait_event {
  my ($self, $event_mask) = @_;
  $event_mask ||= CACA_EVENT_ANY;
  return _wait_event($event_mask);
}

1;

# Character printing

#

=method set_color( $foreground, $background )

Sets the foreground and background colors.

=cut

sub set_color {
  my ($self, $fgcolor, $bgcolor) = @_;
  $fgcolor ||= CACA_COLOR_LIGHTGRAY;
  $bgcolor ||= CACA_COLOR_BLACK;
  return _set_color($fgcolor, $bgcolor);
}

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
        ? _putstr( @$coord, $text )
        : _putchar( @$coord, $text );        

    return $self;
}

=method char( \@coord, $char )

Prints the character I<$char> at the given coordinates.
If I<$char> is a string of more than one character, only
the first character is printed.

Returns the invocant C<Term::Caca> object.

=cut

method char ( $coord, $char ) {
    _putchar( @$coord, substr $char, 0, 1 );

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

#
sub clear {
  _clear();
}

# Primitives drawing

=method draw_line( $x1, $y1, $x2, $y2, $char )

Draws a line from I<($x1,$y2)> to I<($x2,$y2)>
using the character I<$char>.

=cut

sub draw_line {
  my ($self, $x1, $y1, $x2, $y2, $c) = @_;
  _draw_line($x1, $y1, $x2, $y2, $c);
}

=method polyline( \@points, $char = undef , $closed = 0 ) 

Draws the polyline defined by I<@points>, where each point is an array ref
of the coordinates. E.g.

    $t->polyline( [ [ 0,0 ], [ 10,15 ], [ 20, 15 ] ] );

The lines are drawn using I<$char> or, if not specified, using ascii art.

If I<$closed> is true, the end point of the polyline will 
be connected to the first point.

Returns the invocant I<Term::Caca> object.

=cut

method polyline( $points, $char = undef, $closed = 0 ) {
    my @x = map { $_->[0] } @$points;
    my @y = map { $_->[1] } @$points;
    my $n = @x - !$closed;

    $char ? _draw_polyline( \@x, \@y, $n, $char )
          : _draw_thin_polyline( \@x, \@y, $n );

    return $self;
}

=method draw_polyline( \@x_coords, \@y_coords, $nbr_lines, $char )

B<DEPRECATED> use C<polyline()> instead.

=cut

sub draw_polyline {
  my ($self, $x, $y, $n, $c) = @_;
  deprecated();
  _draw_polyline($x, $y, $n, $c);
}

=method draw_thin_line( $x1, $y1, $x2, $y2 )

Draws a line from I<($x1,$y2)> to I<($x2,$y2)>
using ascii art.

=cut

sub draw_thin_line {
  my ($self, $x1, $y1, $x2, $y2) = @_;
  _draw_thin_line($x1, $y1, $x2, $y2);
}

=method draw_thin_polyline( \@x_coords, \@y_coords, $nbr_lines )

B<DEPRECATED> use C<polyline()> instead.

=cut

sub draw_thin_polyline {
  my ($self, $x, $y, $n) = @_;
  _draw_thin_polyline($x, $y, $n);
}

=method draw_circle( $x, $y, $r, $char );

Draws a circle centered at I<($x,$y)> with a radius
of I<$r> using the character I<$char>.

=cut

sub draw_circle {
  my ($self, $x, $y, $r, $c) = @_;
  # TODO : check for sane values
  _draw_circle($x, $y, $r, $c);
}

=method draw_ellipse( $x, $y, $radius_x, $radius_y, $char )

Draws an ellipse centered at I<($x,$y)> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>
using the character I<$char>.

=cut

sub draw_ellipse {
  my ($self, $x0, $y0, $ra, $rb, $c) = @_;
  _draw_ellipse($x0, $y0, $ra, $rb, $c);
}


=method draw_thin_ellipse( $x, $y, $radius_x, $radius_y )

Draws an ellipse centered at I<($x,$y)> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>
using ascii art.

=cut

sub draw_thin_ellipse {
  my ($self, $x0, $y0, $ra, $rb) = @_;
  _draw_thin_ellipse($x0, $y0, $ra, $rb);
}

=method fill_ellipse( $x, $y, $radius_x, $radius_y , $char )

Draws an ellipse centered at I<($x,$y)> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>, 
filled using the character I<$char>.


=cut

sub fill_ellipse {
  my ($self, $x0, $y0, $ra, $rb, $c) = @_;
  _fill_ellipse($x0, $y0, $ra, $rb, $c);
}

=method draw_box( $x1, $y1, $width, $height, $char )

Draws a rectangle of dimensions I<$width> and
I<$height> with its upper-left corner at ($x1,$y1),
using the character I<$char>.

=cut

sub draw_box {
  my ($self, $x0, $y0, $x1, $y1, $c) = @_;
  _draw_box($x0, $y0, $x1, $y1, $c);
}

=method draw_thin_box( $x1, $y1, $width, $height, $char )

Draws a rectangle of dimensions I<$width> and
I<$height> with its upper-left corner at ($x1,$y1),
using ascii art.

=cut

sub draw_thin_box {
  my ($self, $x0, $y0, $x1, $y1) = @_;
  _draw_thin_box($x0, $y0, $x1, $y1);
}

=method fill_box( $x1, $y1, $width, $height )

Draws a rectangle of dimensions I<$width> and
I<$height> with its upper-left corner at ($x1,$y1),
filling it with the character I<$char>.

=cut

sub fill_box {
  my ($self, $x0, $y0, $x1, $y1, $c) = @_;
  _fill_box($x0, $y0, $x1, $y1, $c);
}

=method draw_triangle( $x1, $y1, $x2, $y2, $x3, $y3, $char )

Draws a triangle defined by the three points ($x1,$y1), ($x2,$y2) 
and  ($x3,$y3), using the character $char.

Returns the invocant I<Term::Caca> object.

=cut

sub draw_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2, $c) = @_;
  _draw_triangle($x0, $y0, $x1, $y1, $x2, $y2, $c);
  return $self;
}

=method draw_thin_triangle( $x1, $y1, $x2, $y2, $x3, $y3 )

Draws a triangle defined by the three points ($x1,$y1), ($x2,$y2) 
and  ($x3,$y3), using ascii art.

Returns the invocant I<Term::Caca> object.

=cut

sub draw_thin_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2) = @_;
  _draw_thin_triangle($x0, $y0, $x1, $y1, $x2, $y2);
  return $self;
}

=method fill_triangle( $x1, $y1, $x2, $y2, $x3, $y3, $char )

Draws a triangle defined by the three points ($x1,$y1), ($x2,$y2) 
and  ($x3,$y3), filling it with the character $char.

Returns the invocant I<Term::Caca> object.

=cut

sub fill_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2, $c) = @_;
  _fill_triangle($x0, $y0, $x1, $y1, $x2, $y2, $c);
  return $self;
}

# Mathematical functions

=method rand( $min, $max );

Returns an integer between I<$min> and I<$max>, inclusive.

B<DEPRECATED> Use Perl's I<rand()> instead.

=cut

sub rand {
    deprecated();
  my ($self, $min, $max) = @_;
  return _rand($min, $max);
}

=method sqrt( $x )

Returns the square root of I<$x>.

B<DEPRECATED> Use Perl's I<sqrt()> instead.

=cut

sub sqrt {
    deprecated();
  my ($self, $n) = @_;
  return _sqrt($n);
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
