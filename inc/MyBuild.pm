package MyBuild;

use strict;
use warnings;

use Cwd;
use Config;
use Path::Tiny;

use base qw/ Module::Build /;

my $Orig_CWD = cwd;
sub _chdir_to_libcaca { chdir 'libcaca' or die $!; }
sub _chdir_back { chdir $Orig_CWD; }

sub new {
    my ( $self, %args ) = @_;

    return $self->SUPER::new( 
#        extra_compiler_flags => "-L$Orig_CWD/share/lib -L$Orig_CWD/libcaca/caca/.libs",
#        extra_linker_flags   => "-L$Orig_CWD/share/lib -L$Orig_CWD/libcaca/caca/.libs -lcaca",
        %args );
}

sub create_build_script {
    my $self = shift;

print <<'END';

---------------------------------------------------------------------
This module will build libcaca for you

It requires a C compiler and make.
END

my $make = $self->prompt(
    "Which make should I use to build libcaca?",
    $Config{make}
);
$self->notes('your_make', $make);

my $run_configure = 'y';
if( -e 'libcaca/config.status' ) {
    $run_configure = $self->prompt(
        "Looks like libcaca has already been configured.\n".
        "Do you want to re-run configure?",
        "n"
    );
}
else {
    $run_configure = $self->prompt(
        "Run libcaca's configure now?", 'y'
    );
}

if( $run_configure =~ /^y/i ) {
    my $configure_args = $self->prompt(
        "\n\nWould you like to pass any arguments to configure?", 
        $self->_default_configure_args
    );

    $self->notes("configure_args", $configure_args);

    print "\n\nlibcaca will now be configured.\n\n";
    sleep 1;

    if( $self->_run_libcaca_configure ) {
        print "\n\nYou should now run ./Build.\n";
    }
    else {
        print <<'END';
    Something went wrong with the libcaca configuration.
    You should correct it and re-run Build.PL.
END
    }
}

    $self->SUPER::create_build_script;
}

sub _run_libcaca_configure {
    my $self = shift;
    
    _chdir_to_libcaca;

    unless ( -f 'configure' ) {
        $self->_run('sh bootstrap')
            or do { warn "running bootstrap failed"; return 0 };
    }
    
    $self->_run("sh configure @{[$self->notes('configure_args')]}")
        or do { warn "configuring libcaca failed";      return 0 };
    
    _chdir_back;
}

sub _default_configure_args {
    my $self = shift;

    my $props = $self->{properties};
    my $prefix = $props->{install_base} || 
                 $props->{prefix}       ||
                 $Config{siteprefix};

    my %args = (
        '--prefix' => $Orig_CWD .'/share',
#        '--libdir' => File::Spec->catdir(
#            $self->install_destination('arch'), 'Alien', 'SVN'
#        ),
        PERL   => $^X,
    );

    return join ' ', map { "$_=$args{$_}" } sort keys %args;
}

sub _run {
    my($self, $prog, @args) = @_;
    
    $prog = $self->notes('your_make') if $prog eq 'make';
    
    print "Running $prog @args\n";
    return system($prog, @args) == 0 ? 1 : 0;
}

sub ACTION_clean {
    my $self = shift;

    $self->SUPER::ACTION_clean;

    path($_)->remove for path('share')->children;

    _chdir_to_libcaca;

    $self->_run('make clean')
        or do { warn "cleaning ./libcaca failed"; return 0 };

    _chdir_back;

    1;
}

sub ACTION_realclean {
    my $self = shift;

    $self->SUPER::ACTION_realclean;

    _chdir_to_libcaca;

    unlink 'config.status';

    _chdir_back;
}


sub ACTION_code {
    my $self = shift;

    _chdir_to_libcaca;

    $self->_run('make')
        or do { warn "building libcaca failed"; return 0 };

#    $self->_run('make install')
#        or do { warn "installing libcaca in /share failed"; return 0 };

    _chdir_back;

    # TODO surely there's a less fragile way to get the libraries
    open my $ldd, '-|', 'ldd libcaca/caca/.libs/libcaca.so' or die;
    my @libs;
    while( <$ldd> ) {
        next unless /lib(\w*?)\.so/;
        push @libs, $1;
    }

    push @{$self->{properties}{extra_linker_flags}}, map { "-l$_" } @libs;

    $self->{properties}{objects} = [
        grep { /\.o$/ }
        path( 'libcaca/caca/.libs' )->children
    ];

    $self->SUPER::ACTION_code;
    
    return 1;
}

1;
