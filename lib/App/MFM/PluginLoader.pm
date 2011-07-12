package App::MFM::PluginLoader;

use strict;
use warnings;
use 5.010;

our $VERSION = '0.00';

sub new {
	my ( $class, %opt ) = @_;

	my $self = {};

	return bless( $self, $class );
}

sub load {
	my ( $self, $plugin, %opt ) = @_;
	my $obj;
	eval sprintf(
		'use App::MFM::Plugin::%s;'
		  . '$obj = App::MFM::Plugin::%s->new(%%opt);',
		( ucfirst($plugin) ) x 2,
	);
	if ($@) {
		print STDERR "Cannot load plugin ${plugin}:\n$@\n";
	}
	else {
		$self->{plugin}->{$plugin} = $obj;
	}

	return;
}

sub loaded_plugins {
	my ($self) = @_;

	my @list = sort keys %{ $self->{plugin} };

	return @list;
}

sub run {
	my ( $self, $name, @opt ) = @_;

	if ( $self->{plugin}->{$name} ) {
		return $self->{plugin}->{$name}->run(@opt);
	}

	return;
}

1;
