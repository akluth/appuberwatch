package App::Uberwatch::Server;

use strict;
use warnings;
use Moose;
use Net::Ping;

use Exporter::Easy (
    OK => [ qw(ping_server http_server) ]
);


has 'host' => (
	is => 'rw',
	default => '127.0.0.1'
);

has 'config' => (
	is => 'rw'
);

has 'ping' => (
	is => 'ro'
);

sub init {
	my $self = shift;

	$self->ping(Net::Ping->new())
}

sub ping_server {

}


sub http_server {
}

1;
