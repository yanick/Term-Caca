use Module::Build;

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
