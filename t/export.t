use strict;
use warnings;

use Test::More;

use Term::Caca;

my $t = Term::Caca->new;

$t->circle( [ 10, 10 ], 5, fill => 'x' );

$t->refresh;

for ( qw/ caca ansi text html html3 irc ps svg tga / ) {
    ok length( $t->export( format => $_ ) ), "export to $_";
}

done_testing;
