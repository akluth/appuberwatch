package App::Uberwatch::Utils;

use strict;
use warnings;

use Exporter::Easy (
    OK => [ qw(error warning success debug slurp blargl) ]
);

use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

sub error {
    print BOLD RED $_[0];
}

sub warning {
    print BOLD YELLOW $_[0];
}

sub success {
    print BOLD GREEN $_[0];
}

sub debug {
    #  unless ($DEBUG !~ 1) {
    #    print YELLOW $_[0];
    #}
}

sub slurp {
    open(HANDLE, '<', $_[0]);
    my $tmp = do { local $/ = <HANDLE> };
    close(HANDLE);
    return $tmp;
}

sub blargl {
    open(HANDLE, '>', $_[0]);
    print HANDLE $_[1];
    close(HANDLE);
}

1;
