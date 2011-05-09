package Term::Kaka::Constants;
use strict;
use Term::Caca::Constants qw(:all);
push @ISA, 'Term::Caca::Constants';

*Term::Kaka::Constants::EXPORT_OK   = *Term::Caca::Constants::EXPORT_OK;
*Term::Kaka::Constants::EXPORT_TAGS = *Term::Caca::Constants::EXPORT_TAGS;

1;

__END__

=head1 NAME

Term::Kaka::Constants - Term::Caca::Constants

=cut
