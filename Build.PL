use Module::Build;

my $version = scalar `caca-config --version` or do {

   warn <<'END';

caca-config not found, is libcaca installed?

If your distribution doesn't provide a package, 
libcaca can be found at http://caca.zoy.org/wiki/libcaca

END

    exit 0;
};

chomp $version;

print "libcaca version $version found\n\n";

my $builder = Module::Build->new (
  module_name    => 'Term::Caca',
  license        => 'unrestricted',

  build_requires => {
    'Test::More' => 0,
  },

  script_files   => [
  ],

  extra_compiler_flags => scalar `caca-config --cflags`,
  extra_linker_flags   => scalar `caca-config --libs`,
);

$builder->create_build_script();
