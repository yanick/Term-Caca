package Term::Caca::Event;
# ABSTRACT: base class for Term::Caca events

=head1 DESCRIPTION

This class is inherited by the C<Term::Caca::Event::*>
classes, and shouldn't be used directly.

=cut

use strict;
use warnings;

use Term::Caca;

sub new {
    my $self = bless {}, shift;

    my %args = @_;

    $self->{event} = $args{event};

    return $self;
}

sub _event { $_[0]->{event} }

sub DESTROY {
    my $self = shift;

    Term::Caca::_free_event($self->_event) if $self->_event;
}

1;

