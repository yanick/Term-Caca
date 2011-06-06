package Term::Caca::Event::Key::Press;
BEGIN {
  $Term::Caca::Event::Key::Press::AUTHORITY = 'cpan:yanick';
}
BEGIN {
  $Term::Caca::Event::Key::Press::VERSION = '1.0_0';
}
# abstract: event triggered by a key press

use strict;
use warnings;

use parent 'Term::Caca::Event::Key';

sub new { 
    my $class = shift;
    my $self = Term::Caca::Event::Key->new( @_ );
    return bless $self, $class;
}

1;


__END__
=pod

=head1 NAME

Term::Caca::Event::Key::Press

=head1 VERSION

version 1.0_0

=head1 AUTHORS

=over 4

=item *

John Beppu <beppu@cpan.org>

=item *

Yanick Champoux <yanick@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is Copyright (c) 2011 by John Beppu.

This is free software, licensed under:

  DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE, Version 2, December 2004

=cut

