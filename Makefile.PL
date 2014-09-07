
use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.30;


my %WriteMakefileArgs = (
    NAME         => 'Test::RemoteServer',
    VERSION_FROM => 'lib/Test/RemoteServer.pm',
    PREREQ_PM    => {
                   'Test::Builder' => 0,
                   'Net::DNS'      => 0,
                 },

    TEST_REQUIRES => { 'Test::More'   => 0,
                       'Test::Strict' => 0,
                       'Test::Pod'    => 0,
                       'Test::NoTabs' => 0,
                     },

      ABSTRACT => 'Test routines for remote servers.',
    AUTHOR  => 'Steve Kemp <steve@steve.org.uk>',
    LICENSE => 'perl',
    MIN_PERL_VERSION => '5.008',

    META_MERGE => {
        resources => {
            license    => 'http://dev.perl.org/licenses/',
            homepage   => 'https://github.com/skx/Test-RemoteServer/',
            bugtracker => 'https://github.com/skx/Test-RemoteServer/issues',
            repository => 'https://github.com/skx/Test-RemoteServer.git',
            GitMirror  => 'http://git.steve.org.uk/cpan/Test--RemoteServer',

                     },
                  },
);





unless ( eval {ExtUtils::MakeMaker->VERSION(6.56)} )
{
    my $br = delete $WriteMakefileArgs{ BUILD_REQUIRES };
    my $pp = $WriteMakefileArgs{ PREREQ_PM };
    for my $mod ( keys %$br )
    {
        if ( exists $pp->{ $mod } )
        {
            $pp->{ $mod } = $br->{ $mod } if $br->{ $mod } > $pp->{ $mod };
        }
        else
        {
            $pp->{ $mod } = $br->{ $mod };
        }
    }
}

delete $WriteMakefileArgs{ CONFIGURE_REQUIRES }
  unless eval {ExtUtils::MakeMaker->VERSION(6.52)};

WriteMakefile(%WriteMakefileArgs);
