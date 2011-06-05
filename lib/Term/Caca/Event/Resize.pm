package Term::Caca::Event::Resize;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;
use Method::Signatures;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

method width {
    return Term::Caca::_get_event_resize_width( $self->_event );
}

method height {
    return Term::Caca::_get_event_resize_height( $self->_event );
}

method size {
    return( $self->width, $self->height );
}

1;


