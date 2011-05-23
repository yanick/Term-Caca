package Term::Caca;

require Exporter;
require DynaLoader;
$VERSION = '0.97';
@ISA = qw(Exporter DynaLoader);
Term::Caca->bootstrap($VERSION);

use strict;
use warnings;
use Term::Caca::Constants ':all';

# Basic functions

# constructor
sub new {
  my ($class) = @_;
  _init();
  my $self = { };
  return bless($self => $class);
}
*init = \*new;

# set delay for establishing constant framerate
sub set_delay {
  my ($self, $usec) = @_;
  $usec ||= 0;
  _set_delay($usec);
}

#
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

#
sub get_rendertime {
# my ($self) = @_;
  return _get_rendertime();
}

#
sub get_width {
# my ($self) = @_;
  return _get_width();
}

#
sub get_height {
# my ($self) = @_;
  return _get_height();
}

#
sub set_window_title {
  my ($self, $title) = @_;
  $title ||= "";
  return _set_window_title($title);
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

#
sub refresh {
  _refresh();
}

# destructor
sub DESTROY {
# my ($self) = @_;
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

# faking it by doing printf on the perl side
sub printf {
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

#
sub draw_line {
  my ($self, $x1, $y1, $x2, $y2, $c) = @_;
  _draw_line($x1, $y1, $x2, $y2, $c);
}

#
sub draw_polyline {
  my ($self, $x, $y, $n, $c) = @_;
  _draw_polyline($x, $y, $n, $c);
}

#
sub draw_thin_line {
  my ($self, $x1, $y1, $x2, $y2) = @_;
  _draw_thin_line($x1, $y1, $x2, $y2);
}

#
sub draw_thin_polyline {
  my ($self, $x, $y, $n) = @_;
  _draw_thin_polyline($x, $y, $n);
}

#
sub draw_circle {
  my ($self, $x, $y, $r, $c) = @_;
  # TODO : check for sane values
  _draw_circle($x, $y, $r, $c);
}

#
sub draw_ellipse {
  my ($self, $x0, $y0, $ra, $rb, $c) = @_;
  _draw_ellipse($x0, $y0, $ra, $rb, $c);
}

#
sub draw_thin_ellipse {
  my ($self, $x0, $y0, $ra, $rb) = @_;
  _draw_thin_ellipse($x0, $y0, $ra, $rb);
}

#
sub fill_ellipse {
  my ($self, $x0, $y0, $ra, $rb, $c) = @_;
  _fill_ellipse($x0, $y0, $ra, $rb, $c);
}

#
sub draw_box {
  my ($self, $x0, $y0, $x1, $y1, $c) = @_;
  _draw_box($x0, $y0, $x1, $y1, $c);
}

#
sub draw_thin_box {
  my ($self, $x0, $y0, $x1, $y1) = @_;
  _draw_thin_box($x0, $y0, $x1, $y1);
}

#
sub fill_box {
  my ($self, $x0, $y0, $x1, $y1, $c) = @_;
  _fill_box($x0, $y0, $x1, $y1, $c);
}

#
sub draw_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2, $c) = @_;
  _draw_triangle($x0, $y0, $x1, $y1, $x2, $y2, $c);
}

#
sub draw_thin_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2) = @_;
  _draw_thin_triangle($x0, $y0, $x1, $y1, $x2, $y2);
}

#
sub fill_triangle {
  my ($self, $x0, $y0, $x1, $y1, $x2, $y2, $c) = @_;
  _fill_triangle($x0, $y0, $x1, $y1, $x2, $y2, $c);
}

# Mathematical functions

#
sub rand {
  my ($self, $min, $max) = @_;
  return _rand($min, $max);
}

#
sub sqrt {
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

__END__

=head1 NAME

Term::Caca - perl interface for libcaca (Colour AsCii Art library)

=head1 SYNOPSIS

Usage:

  use Term::Caca;
  my $caca = Term::Caca->init();
  $caca->putstr(5, 5, "pwn3d");
  $caca->refresh();
  sleep 3;

=head1 DESCRIPTION

=head2 Methods

=head3 init

=head3 new

This method instantiates a Term::Caca object.  (Note that init() is an alias for new()
and that they may be used interchangeably.)

=head3 set_delay

Set the amount of time in milliseconds between frames to establish
a constant frame rate

=head3 get_feature

=head3 set_feature

=head3 get_feature_name

=head3 get_rendertime

=head3 get_width

=head3 get_height

=head3 set_window_title

=head3 get_window_width

=head3 get_window_height

=head3 refresh

=head3 get_event

=head3 get_mouse_x

=head3 get_mouse_y

=head3 wait_event

=head3 set_color

=head3 get_fg_color

=head3 get_bg_color

=head3 get_color_name

=head3 putchar

=head3 putstr

=head3 printf

=head3 clear

=head3 draw_line( $x1, $y1, $x2, $y2, $char )

Draws a line from I<($x1,$y2)> to I<($x2,$y2)>
using the character I<$char>.

=head3 draw_thin_line( $x1, $y1, $x2, $y2 )

Draws a line from I<($x1,$y2)> to I<($x2,$y2)>
using ascii art.

=head3 draw_polyline


=head3 draw_thin_polyline

=head3 draw_circle( $x, $y, $r, $char );

Draws a circle centered at I<($x,$y)> with a radius
of I<$r> using the character I<$char>.

=head3 draw_ellipse( $x, $y, $radius_x, $radius_y, $char )

Draws an ellipse centered at I<($x,$y)> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>
using the character I<$char>.

=head3 draw_thin_ellipse( $x, $y, $radius_x, $radius_y )

Draws an ellipse centered at I<($x,$y)> with an x-axis
radius of I<$radius_x> and a y-radius of I<$radius_y>
using ascii art.

=head3 fill_ellipse

=head3 draw_box

=head3 draw_thin_box

=head3 fill_box

=head3 draw_triangle

=head3 draw_thin_triangle

=head3 fill_triangle

=head3 rand

=head3 sqrt

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

=head1 LICENSE

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar
  22 rue de Plaisance, 75014 Paris, France
 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.

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
