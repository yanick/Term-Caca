package Term::Caca::Event;
# ABSTRACT: base class for Term::Caca events

=head1 DESCRIPTION

This class is inherited by the C<Term::Caca::Event::*>
classes, and shouldn't be used directly.

=cut

use strict;
use warnings;

use Term::Caca;

use Moose;

has event => (
    is => 'ro',
    required => 1,
    predicate => 'has_event',
);

has type => (
    is => 'ro',
    lazy => 1,
    default => sub {
        ( ref $_[0] ) =~ s/Term::Caca::Event:://r;
    }
);

sub DEMOLISH {
    my $self = shift;

    Term::Caca::caca_free_event($self->event) if $self->has_event;
}

1;

