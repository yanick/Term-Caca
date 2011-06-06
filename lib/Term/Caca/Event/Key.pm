package Term::Caca::Event::Key;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Method::Signatures;

sub new { 
    my $class = shift;
    my $self = Term::Caca::Event->new( @_ );
    return bless $self, $class;
}

method char {
    return Term::Caca::_get_event_key_ch( $self->_event );
}

1;
