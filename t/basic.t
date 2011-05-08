use strict;
use warnings;

use Test::More tests => 1;

use Term::Caca;

my $t = Term::Caca->init;

$t->putstr(5, 5, 'hello world');

$t->refresh;

pass;
