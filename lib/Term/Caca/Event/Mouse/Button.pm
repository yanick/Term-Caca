package Term::Caca::Event::Mouse::Button;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;
use Method::Signatures;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

method index {
    return Term::Caca::_get_event_mouse_button( $self->_event );
}

method left { return 1 == $self->index }
method right { return 3 == $self->index }
method middle { return 2 == $self->index }


1;


