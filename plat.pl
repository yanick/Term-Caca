use FFI::CheckLib 0.06;

use 5.10.0;

#$ffi->lib(die find_lib_or_die lib => 'caca'); 

use Alien::caca;
use FFI::Platypus;

package FFI::Platypus::Type::Foo {
 
use strict;
use warnings;
use FFI::Platypus;
use Scalar::Util qw( readonly );
use Config ();
 
use constant _incantation =>
  $^O eq 'MSWin32' && $Config::Config{archname} =~ /MSWin32-x64/
  ? 'Q'
  : 'L!*';
use constant _pointer_buffer => "P" . FFI::Platypus->new->sizeof('opaque');
 
my @stack;
 
sub perl_to_native
{
  if(defined $_[0])
  {
    my $packed = pack 'P', ${$_[0]};
    my $pointer_pointer = pack 'P', $packed;
    my $unpacked = unpack _incantation, $pointer_pointer;
    push @stack, [ \$packed, \$pointer_pointer ];
    return $unpacked;
  }
  else
  {
    push @stack, [];
    return undef;
  }
}
 
sub perl_to_native_post
{
  my($packed) = @{ pop @stack };
  return unless defined $packed;
  unless(readonly(${$_[0]}))
  {
    ${$_[0]} = unpack 'p', $$packed;
  }
}
 
 
sub ffi_custom_type_api_1
{
  return {
    native_type         => 'opaque',
    perl_to_native      => \&perl_to_native,
    perl_to_native_post => \&perl_to_native_post,
    native_to_perl      => \&native_to_perl,
  }
}
 
1;
}
 
my $ffi = FFI::Platypus->new;
$ffi->lib(Alien::caca->dynamic_libs);

$ffi->load_custom_type('::StringArray' => 'string_array');
$ffi->load_custom_type('::StringPointer' => 'string_pointer');
 
$ffi->attach( 'caca_get_display_driver_list' => [] => 'string_array' );

print join " ", @{caca_get_display_driver_list()};
