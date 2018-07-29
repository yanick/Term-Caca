package Term::Caca::Event::Quit;

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Term::Caca;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

1;
