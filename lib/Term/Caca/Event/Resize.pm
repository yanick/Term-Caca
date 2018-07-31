package Term::Caca::Event::Resize;
# ABSTRACT: event triggered when the display is resized

use strict;
use warnings;

use Term::Caca;

=head1 ATTRIBUTES 

=head2 width 

New width of the display.

=head2 height 

New height of the display.

=head2 size 

New size of the display, as an array ref of the width and height.

=cut

use Moose;
extends 'Term::Caca::Event';

has width => 
    is => 'ro',
    lazy => 1,
    default => sub {
        Term::Caca::caca_get_event_resize_width( $_[0]->event );
    };

has height => 
    is => 'ro',
    lazy => 1,
    default => sub {
        Term::Caca::caca_get_event_resize_height( $_[0]->event );
    };


has size => 
    is => 'ro',
    lazy => 1,
    default => sub {
        [ $_[0]->width, $_[0]->height ];
    };

1;


