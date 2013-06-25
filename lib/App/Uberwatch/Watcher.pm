package App::Uberwatch::Watcher;

use strict;
use warnings;
use Moose;
use Net::SMTP;
use App::Uberwatch::Nagios;

has 'mail' => (
    is => 'rw'
);

has 'nagios' => (
    is => 'rw'
);


sub init {
	my $self = shift;
    my $config = shift;

	$self->nagios(
        App::Uberwatch::Nagios->new($config)
    ) if defined ($config->{'nagios'});
}


sub critical {
    my $self = shift;
    my $msg = shift;

    $self->send($msg);
}


sub send {
    my $self = shift;
    my $msg = shift;

    if ($self->nagios != 0) {
        $self->nagios->send_nsca($msg);
    }
}


no Moose;
__PACKAGE__->meta->make_immutable;
