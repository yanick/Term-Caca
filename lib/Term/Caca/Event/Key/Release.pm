package Term::Caca::Event::Key::Release;
# abstract: event triggered by a key release

use strict;
use warnings;

use parent 'Term::Caca::Event::Key';

sub new { 
    my $class = shift;
    my $self = Term::Caca::Event::Key->new( @_ );
    return bless $self, $class;
}

1;

