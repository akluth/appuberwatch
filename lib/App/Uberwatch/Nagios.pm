package App::Uberwatch::Nagios;

use strict;
use warnings;
use Moose;
use Net::SMTP;
use Net::NSCA::Client;

has 'host' => (
    is => 'rw'
);

has 'remotehost' => (
    is => 'rw'
);

has 'service' => (
    is => 'rw'
);

has 'nsca' => (
    is => 'rw'
);


sub init {
    my $self = shift;
    my $config = shift;

    $self->host('localhost');
    $self->remotehost($config->{'host'});
    $self->service($config->{'host'});
    $self->nsca(Net::NSCA::Client->new(
        remote_host => $self->host
    ));
}


sub send_nsca {
    my $self = shift;
    my $msg = shift;
    
    $self->nsca->send_report(
        hostname => $self->host,
        service => $self->service,
        message => $msg,
        status => $Net::NSCA::Client::STATUS_CRITICAL
    );
}

no Moose;
__PACKAGE__->meta->make_immutable;
