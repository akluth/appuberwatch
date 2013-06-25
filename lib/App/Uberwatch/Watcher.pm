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

    if (defined $config->{'nagios'}) {
    	$self->nagios(
            App::Uberwatch::Nagios->new
        );
        $self->nagios->init($config->{'nagios'});
    }
}


sub critical {
    my $self = shift;
    my $msg = shift;

    $self->nagios->send_nsca($msg);
}


no Moose;
__PACKAGE__->meta->make_immutable;
