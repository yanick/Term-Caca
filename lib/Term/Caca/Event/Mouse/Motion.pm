package Term::Caca::Event::Mouse::Motion;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

sub x {
    return Term::Caca::_get_event_mouse_x( $_[0]->_event );
}

sub y {
    return Term::Caca::_get_event_mouse_y( $_[0]->_event );
}

sub pos {
    return ( $_[0]->x, $_[0]->y );
}

1;
