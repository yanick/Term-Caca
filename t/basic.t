use strict;
use warnings;

use Test::More tests => 1;

use Term::Caca;

my $t = Term::Caca->init;

$t->putstr(5, 5, 'hello world');

$t->draw_line( 0,0, 25,20, 't' );
$t->draw_thin_line( 5,0, 30,20 );
$t->draw_circle( 10, 10, 5, 'c' );

$t->draw_ellipse( 15, 15, 10, 20, 'e' );
$t->draw_thin_ellipse( 15, 15, 15, 25, 'E' );

$t->refresh;

pass;
