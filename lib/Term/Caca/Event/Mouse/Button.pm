package Term::Caca::Event::Mouse::Button;

use strict;
use warnings;

use Term::Caca;

use Moose;
extends 'Term::Caca::Event';

has index =>
    is => 'ro',
    lazy => 1,
    default => sub {
        Term::Caca::caca_get_event_mouse_button( $_[0]->event );
    };

sub left { return 1 == $_[0]->index }
sub right { return 3 == $_[0]->index }
sub middle { return 2 == $_[0]->index }

1;


