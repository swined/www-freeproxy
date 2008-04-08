#!/usr/bin/perl

use strict;
use warnings;
use YAML;
use ExtUtils::MakeMaker;

my $deps = {
	'LWP::Simple' => 0,
	'Exporter' => 0,
};

open F, '> META.yml';
print F Dump {
	name		=> 'WWW::FreeProxy',
	version		=> '0.02',
	version_from	=> 'lib/WWW/FreeProxy.pm',
	installdirs	=> 'site',
	requires	=> $deps,
	distribution_type => 'module',
	generated_by	=> 'ExtUtils::MakeMaker version 6.17',
};
close F;

WriteMakefile(
    NAME                => 'WWW::FreeProxy',
    AUTHOR              => 'Alexey Alexandrov <swined@cpan.org>',
    VERSION_FROM        => 'lib/WWW/FreeProxy.pm',
    ABSTRACT_FROM       => 'lib/WWW/FreeProxy.pm',
    PL_FILES            => {},
    PREREQ_PM		=> $deps,
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW-FreeProxy-*' },
);
