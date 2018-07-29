package Term::Caca::Event::Resize;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

sub width {
    return Term::Caca::_get_event_resize_width( $_[0]->_event );
}

sub height {
    return Term::Caca::_get_event_resize_height( $_[0]->_event );
}

sub size {
    return( $_[0]->width, $_[0]->height );
}

1;


