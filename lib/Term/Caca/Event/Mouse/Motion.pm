package Term::Caca::Event::Mouse::Motion;

use strict;
use warnings;

use Term::Caca;

use Moose;
extends 'Term::Caca::Event';


has x => 
    is => 'ro',
    lazy => 1,
    default => sub { Term::Caca::caca_get_event_mouse_x( $_[0]->event ) };

has y => 
    is => 'ro',
    lazy => 1,
    default => sub { Term::Caca::caca_get_event_mouse_y( $_[0]->event ) };

has pos => 
    is => 'ro',
    lazy => 1,
    default => sub { [ $_[0]->x, $_[0]->y ] };

1;
