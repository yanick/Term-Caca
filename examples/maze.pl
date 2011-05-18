#!/usr/bin/perl 

use 5.12.0;

use Games::Maze;
use Term::Caca;
use Term::Caca::Constants qw/ :all /;

my $term = Term::Caca->new;

$term->set_window_title( 'maze' );

my $w = $term->get_width;
my $h = $term->get_height;

# generate the maze
my $maze = Games::Maze->new( 
    dimensions => [ ($w-1)/3, ($h-1)/2 , 1 ], 
    entry => [1,1,1] 
);
$maze->make;
my @maze = map { [ split '' ] }  split "\n", $maze->to_ascii;

# display the maze itself
$term->set_color( CACA_COLOR_LIGHTBLUE, CACA_COLOR_BLACK );
for my $x ( 0..$w ) {
    for my $y ( 0..$h ) {
        $term->putchar( $x, $y, $maze[$y][$x] );
    }
}


$term->set_color( CACA_COLOR_RED, CACA_COLOR_BLACK );

my @pos = (1,0);

while (1) {
    $term->putchar( @pos, '@' );
    $term->refresh;
    $term->putchar( @pos, '.' );

    # move using the keypad (2, 4, 6, 8)
    given ( chr( $term->wait_event( CACA_EVENT_KEY_PRESS ) 
                    ^ CACA_EVENT_KEY_PRESS ) ) {
        when ( 2 ) { 
            if ( $pos[1] < $w and $maze[$pos[1]+1][$pos[0]] eq ' ' ) {
                $pos[1]++;
            }
        }
        when ( 8 ) { 
            if ( $pos[1] > 0 and $maze[$pos[1]-1][$pos[0]] eq ' ' ) {
                $pos[1]--;
            }
        }
        when ( 4 ) { 
            if ( $pos[0] > 0 and $maze[$pos[1]][$pos[0]-1] eq ' ' ) {
                $pos[0]--;
            }
        }
        when ( 6 ) { 
            if ( $pos[0] < $w and $maze[$pos[1]][$pos[0]+1] eq ' ' ) {
                $pos[0]++;
            }
        }
    }
    $term->putchar( @pos, '@' );
}
