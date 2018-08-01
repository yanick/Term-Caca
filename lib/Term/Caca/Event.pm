package Term::Caca::Event;
# ABSTRACT: base class for Term::Caca events

=head1 DESCRIPTION

This class is inherited by the C<Term::Caca::Event::*>
classes, and shouldn't be used directly.

=head1 ATTRIBUTES

=head2 event 

Required. The underlying caca event structure.

=head2 type 

Holds the name of the event (which is the 
name of the class without the 
leading C<Term::Caca::Event::>.

=cut

use strict;
use warnings;

use FFI::Platypus::Memory;

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

    free $self->event if $self->has_event;
}

1;

