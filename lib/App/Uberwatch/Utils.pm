package App::Uberwatch::Utils;

use strict;
use warnings;
use Moose;

use Log::Handler;
use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;


has 'debugmode' => (
    is => 'rw'
);

has 'verbosemode' => (
    is => 'rw'
);


sub info {
    my $self = shift;
    my $str = shift;

    print WHITE $str;
}

sub error {
    my $self = shift;
    my $str = shift;

    print BOLD RED $str;
}

sub warning {
    my $self = shift;
    my $str = shift;

    print BOLD YELLOW $str;
}

sub success {
    my $self = shift;
    my $str = shift;

    print BOLD GREEN $str;
}

sub debug {
    my $self = shift;
    my $str = shift;

    unless ($self->debugmode !~ '1') {
        print YELLOW $str;
    }
}

sub slurp {
    my $self = shift;
    my $file = shift;

    open(HANDLE, '<', $file);
    my $tmp = do { local $/ = <HANDLE> };
    close(HANDLE);
    return $tmp;
}

sub blargl {
    my $self = shift;
    my $file = shift;
    my $content = shift;

    open(HANDLE, '>', $file);
    print HANDLE $content;
    close(HANDLE);
}

no Moose;
__PACKAGE__->meta->make_immutable;
