package Term::Caca::Event::Key::Press;
# ABSTRACT: event generated by a key pressed

=head1 SYNOPSIS

    use Term::Caca qw/ :events /;

    my $t = Term::Caca->new;
    while ( 1 ) {
        my $event = $t->wait_for_event( 
            mask => $KEY_PRESS,
        );  
        
        print "character typed: ", $event->char;
    }

=head1 DESCRIPTION

Generated when a key is pressed.

=cut

use strict;
use warnings;

use Moose;
extends 'Term::Caca::Event::Key';


=method char()

Returns the character pressed.

=head1 SEE ALSO

L<Term::Caca::Event::Key>, L<Term::Caca::Event::Key::Release>

=cut

1;

