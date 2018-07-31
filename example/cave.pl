#!/usr/bin/perl 

use 5.12.0;

use Term::Caca qw/ :colors :events /;

use experimental qw/
    signatures
    postderef
    smartmatch
/;

my $term = Term::Caca->new();

#$term->title( 'cave' );

#$term->refresh_delay(20);

my( $w, $h ) = $term->canvas_size->@*;

my $cave = [];

# generate the seed cave 
for my $x ( 1..$w ) {
    for my $y ( 1..$h ) {
        $cave->[$x-1][$y-1] = ( $y == 1 || $y == $h || $x == 1 || $x == $w ) ? 1 : rand() > 0.5;
    }
}

$cave = do 'a';
# die $cave;

# display the cave
#$term->set_color( LIGHTBLUE, BLACK );

sub show_cave {
    for my $x ( 0..$w-1 ) {
        for my $y ( 0..$h-1 ) {
            $term->char( [$x, $y], $cave->[$x][$y] ? '#' : ' ' );
        }
    }
}

sub mutate_cell {
    my( $x, $y ) = @_;

    use List::Util qw/ sum /;
    my $n = sum map { $cave->[$x+$_->[0]][$y+$_->[1]] } [-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1],[1,0],[1,1];

    return $n < 4 ? 0 : $n > 5 ? 1 : $cave->[$x][$y];
}

sub update_cave {
    my $new = [];

    for my $x ( 1..$w ) {
        for my $y ( 1..$h ) {
            $new->[$x-1][$y-1] = ( $y == 1 || $y == $h || $x == 1 || $x == $w ) ? 1 : mutate_cell( $x-1, $y-1 );
        }
    }

    $cave = $new;

}

while() {
    warn 1 ;
    # use Data::Dumper;
    # open my $fh, ">", "a";
    # print $fh Dumper($cave);
    # close $fh;
    show_cave();
    warn 2;
    warn $term->canvas;
    warn $term->display;
    $term->refresh;
    warn 3;
    sleep 3;
    exit;

    my $event = $term->wait_for_event( 
        KEY_PRESS | QUIT,
        -1,
    ) or next;  


    exit if $event->isa( 'Term::Caca::Event::Quit' );

    exit if $event->isa('Term::Caca::Event::Key::Press')
            and $event->char eq 'q';


    update_cave();

}

__END__

$term->set_color( RED, BLACK );

my @pos = (1,0);

# TODO work with a coord class

while (1) {
    $term->char( \@pos, '@' );
    $term->refresh;
    $term->char( \@pos, '.' );

    my $event = $term->wait_for_event( 
        KEY_PRESS | QUIT,
        -1,
    );  

    exit if $event->isa( 'Term::Caca::Event::Quit' )
         or $event->char eq 'q';

    # move using the keypad (2, 4, 6, 8)
    given ( $event->char ) {
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
}
