package Term::Caca::Event::Key;
BEGIN {
  $Term::Caca::Event::Key::AUTHORITY = 'cpan:yanick';
}
BEGIN {
  $Term::Caca::Event::Key::VERSION = '1.0_1';
}

use strict;
use warnings;

use parent 'Term::Caca::Event';
use Method::Signatures;

sub new { 
    my $class = shift;
    my $self = Term::Caca::Event->new( @_ );
    return bless $self, $class;
}

method char {
    return Term::Caca::_get_event_key_ch( $self->_event );
}

1;

__END__
=pod

=head1 NAME

Term::Caca::Event::Key

=head1 VERSION

version 1.0_1

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

