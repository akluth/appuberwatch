package App::Uberwatch::Watcher;

use strict;
use warnings;
use Moose;
use Net::SMTP;

has 'mail' => (
	is => 'rw'
);

sub init {
	$self = shift;

	$self->mail(Net::SMTP->new('localhost'));
}

sub inform_admins {

}

no Moose;
__PACKAGE__->meta->make_immutable;