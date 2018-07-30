package Term::Caca::Event::Resize;

use strict;
use warnings;

use Term::Caca;

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


