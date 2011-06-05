package Term::Caca::Event::Mouse::Button::Release;

use strict;
use warnings;

use parent qw/ Term::Caca::Event::Mouse::Button /;

sub new {
    my $class = shift;
    return bless $class->SUPER::new( @_ ), $class;
}

1;





