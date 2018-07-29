package Term::Caca::Event::Mouse::Button;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

sub index {
    return Term::Caca::_get_event_mouse_button( $_[0]->_event );
}

sub left { return 1 == $_[0]->index }
sub right { return 3 == $_[0]->index }
sub middle { return 2 == $_[0]->index }


1;


