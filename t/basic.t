use strict;
use warnings;

use Test::More;

use Term::Caca;
use Term::Caca::Constants qw/ :all /;

Term::Caca::_get_canvas( Term::Caca::_create_display() );
Term::Caca::_get_canvas( Term::Caca::_create_display() );
<>;

my $t = Term::Caca->init;

$t = $t->set_window_title( __FILE__ );

$t = $t->set_delay( 1_000_000 );

$t->set_color( CACA_COLOR_YELLOW, CACA_COLOR_DARKGRAY );

$t->mouse_position;

$t->text( [ 5, 5 ], "Hi there!" );
$t->char( [ 5, 6 ], "X" );
$t->char( [ 5, 7 ], "X marks the spot" );
$t->char( [ 5, 8 ], "Y" );
pause_and_clear($t);

$t->draw_polyline( [ 1, 10, 15 ], [ 1, 15, 10 ], 4, 'x' );
pause_and_clear($t);

$t->polyline( [ [ 1,1], [10,15], [15, 10] ], 'x' );
pause_and_clear($t);

$t->polyline( [ [ 1,1], [10,15], [15, 10] ], undef, 1 );
pause_and_clear($t);

$t->putstr(5, 5, 'hello world');

$t->draw_line( 0,0, 25,20, 't' );
pause_and_clear($t);

$t->draw_thin_line( 5,0, 30,20 );
pause_and_clear($t);

$t->draw_circle( 10, 10, 5, 'c' );
pause_and_clear($t);

$t->draw_ellipse( 15, 15, 10, 20, 'e' );
pause_and_clear($t);

$t->fill_ellipse( 15, 15, 10, 20, 'f' );
pause_and_clear($t);

$t->draw_thin_ellipse( 15, 15, 15, 25, 'E' );
pause_and_clear($t);

$t->draw_box( 10, 10, 20, 20, 'g' );
$t->draw_thin_box( 15, 15, 5, 5 );
$t->fill_box( 5, 5, 5, 5, 'h' );
pause_and_clear($t);

$t->draw_triangle( 10, 10, 20, 20, 5, 17, 't' )
  ->draw_thin_triangle( 12, 10, 22, 10, 17, 17 )
  ->fill_triangle( 14, 10, 24, 20, 9, 17, 'T' );
pause_and_clear($t);

$t->printf( 5, 5, "%06d", 613 );
pause_and_clear($t);

is $t->sqrt( 4 )**2 => 4, 'sqrt()';

my $x = $t->rand(5,10);

cmp_ok $x, '>=', 5, "rand( 5, 10 ) >=5";
cmp_ok $x, '<=', 10, "rand( 5, 10 ) <= 10";

cmp_ok $t->get_width, '>', 0, "get_width()";
cmp_ok $t->get_height, '>', 0, "get_height()";

my $render_time = $t->get_rendertime;

# render time should be ~ 1 second

cmp_ok $render_time, '>=', 500_000, 'render time around a second';
cmp_ok $render_time, '<=', 1_500_000, 'render time around a second';

pass 'reached the end';

done_testing;

sub pause_and_clear {
    my $t = shift;
    $t = $t->refresh;
    <> if $ENV{TERMCACAPAUSE};
    $t->clear;
}
