package App::Uberwatch::Server;

use strict;
use warnings;
use Moose;
use Net::Ping;
use Log::Handler;
use LWP::UserAgent;
use App::Uberwatch::Utils;

has 'host' => (
	is => 'rw',
	default => '127.0.0.1'
);

has 'config' => (
	is => 'rw'
);

has 'verbosemode' => (
    is => 'rw'
);

has 'log' => (
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
    $self->log(Log::Handler->get_logger($self->host));

    $self->ping(
        Net::Ping->new(
            $config->{'methods'}->{'ping'}->{'method'},
            $config->{'methods'}->{'ping'}->{'timeout'}
        )
    ) if (defined $config->{'methods'}->{'ping'});

    $self->http(
        LWP::UserAgent->new(
            timeout => $config->{'methods'}->{'http'}->{'timeout'}
        )
    ) if (defined $config->{'methods'}->{'http'});
}

sub ping_server {
    my $self = shift;

    $self->log->info("Pinging " . $self->host . "...") if ($self->verbosemode =~ '1');

    $self->log->warning("Host " . $self->host . " is not reachable!") unless $self->ping()->ping($self->host);
}

sub http_server {
    my $self = shift;

    $self->log->info("Trying a HTTP request on " . $self->host . "...") if ($self->verbosemode =~ '1');
    my $response = $self->http->get("http://" . $self->host);
    $self->log->error("Host " . $self->host . " returned HTTP status " . $response->code()) unless $response->code() eq 200;

    $self->log->info("Successful HTTP request on " . $self->host . " with status " . $response->code()) if ($self->verbosemode =~ '1');
}

no Moose;
__PACKAGE__->meta->make_immutable;
