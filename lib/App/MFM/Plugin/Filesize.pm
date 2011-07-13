package App::MFM::Plugin::Filesize;

use strict;
use warnings;
use 5.010;

use parent 'App::MFM::Plugin';

our $VERSION = '0.00';

sub short_width { return 7; }

sub run {
	my ( $self, $file ) = @_;

	my @postfix = ( q{ }, qw(k M G T) );

	if ( !-f $file ) {
		return;
	}

	my $bytes = -s $file;

	while ( $bytes >= 1024 ) {
		$bytes /= 1024;
		shift @postfix;
	}

	return sprintf( '%6.1f%s', $bytes, $postfix[0] );
}

1;
