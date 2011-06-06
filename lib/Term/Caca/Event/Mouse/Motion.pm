package Term::Caca::Event::Mouse::Motion;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;
use Method::Signatures;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

method x {
    return Term::Caca::_get_event_mouse_x( $self->_event );
}

method y {
    return Term::Caca::_get_event_mouse_y( $self->_event );
}

method pos {
    return ( $self->x, $self->y );
}

1;
