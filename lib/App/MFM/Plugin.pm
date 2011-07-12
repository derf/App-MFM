package App::MFM::Plugin;

use strict;
use warnings;
use 5.010;

our $VERSION = '0.00';

sub new {
	my ( $class, %opt ) = @_;
	my $self = {};
	$self->{opt} = \%opt;
	return bless( $self, $class );
}

1;
