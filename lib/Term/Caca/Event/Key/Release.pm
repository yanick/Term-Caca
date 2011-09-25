package Term::Caca::Event::Key::Release;
# abstract: event triggered by a key release

=head1 SYNOPSIS

    use Term::Caca qw/ :events /;

    my $t = Term::Caca->new;
    while ( 1 ) {
        my $event = $t->wait_for_event( 
            mask => $KEY_RELEASE,
        );  
        
        print "character typed: ", $event->char;
    }

=head1 DESCRIPTION

Generated when a key is released.

=cut

use strict;
use warnings;

use parent 'Term::Caca::Event::Key';

sub new { 
    my $class = shift;
    my $self = Term::Caca::Event::Key->new( @_ );
    return bless $self, $class;
}

=method char()

Returns the character released.

=head1 SEE ALSO

L<Term::Caca::Event::Key>, L<Term::Caca::Event::Key::Press>

=cut

1;

