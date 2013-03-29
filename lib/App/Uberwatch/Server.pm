package App::Uberwatch::Server;

use strict;
use warnings;
use Moose;
use Net::Ping;
use Log::Handler;

has 'host' => (
	is => 'rw',
	default => '127.0.0.1'
);

has 'config' => (
	is => 'rw'
);

has 'ping' => (
	is => 'rw'
);

has 'http' => (
    is => 'rw'
);

sub init {
	my $self = shift;
    my $config = shift;

    $self->host($config->{'host'});

    $self->ping(
    	Net::Ping->new(
    		$config->{'methods'}->{'ping'}->{'method'},
    		$config->{'methods'}->{'ping'}->{'timeout'}
    	)
    ) if (defined $config->{'methods'}->{'ping'});

    #TODO: HTTP
}

sub ping_ok {
    my $self = shift;
    $self->ping()->ping($self->host);
}


sub http_server {
}

no Moose;
__PACKAGE__->meta->make_immutable;
