package App::MFM::Plugin::Filetype;

use strict;
use warnings;
use 5.010;

use parent 'App::MFM::Plugin';

our $VERSION = '0.00';

sub short_width { return 1; }

sub run {
	my ( $self, $file ) = @_;

	given ($file) {
		when (-d) { return '/' }
		when (-l) { return '@' }
		when (-p) { return '|' }
		when (-S) { return '=' }
		when (-b) { return '#' }
		when (-c) { return '%' }
		when (-x) { return '*' }
		when (-z) { return '0' }
	}

	return;
}

1;
