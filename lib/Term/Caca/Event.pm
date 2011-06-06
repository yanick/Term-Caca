package Term::Caca::Event;

use strict;
use warnings;

use Method::Signatures;
use Term::Caca;

sub new {
    my $self = bless {}, shift;

    my %args = @_;

    $self->{event} = $args{event};

    return $self;
}

method _event { $self->{event} }

sub DESTROY {
    my $self = shift;

    Term::Caca::_free_event($self->_event) if $self->_event;
}

1;

