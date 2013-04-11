use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'App::Uberwatch',
    AUTHOR           => q{Alexander Kluth <contact@alexanderkluth.com>},
    VERSION_FROM     => 'lib/App/Uberwatch.pm',
    ABSTRACT_FROM    => 'lib/App/Uberwatch.pm',
    LICENSE          => 'Artistic_2_0',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
        'Moose' => 0,
        'YAML' => 0,
        'Log::Handler' => 0,
        'Proc::Daemon' => 0,
        'Getopt::Long' => 0,
        'Parallel::ForkManager' => 0,
        'App::Uberwatch::Utils' => 0,
        'App::Uberwatch::Server' => 0,
    },
    PREREQ_PM => {
        #'ABC'              => 1.6,
        #'Foo::Bar::Module' => 5.0401,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-Uberwatch-*' },
);
