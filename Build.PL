#!/usr/bin/env perl

use strict;
use warnings;
use Module::Build;

Module::Build->new(

	build_requires => {
		'Test::More'    => 0,
		'Test::Compile' => 0,
		'Test::Pod'     => 0,
	},
	dist_name         => 'App-MFM',
	dist_version_from => 'bin/mfm',
	license           => 'perl',
	requires          => {
		'perl'              => '5.10.1',
		'Curses::UI'        => 0,
		'Config::Tiny'      => 0,
		'Cwd'               => 0,
		'File::BaseDir'     => 0,
		'Module::Pluggable' => 0,
	},
	script_files => 'bin/',
	sign         => 1,

)->create_build_script();
