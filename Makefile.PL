#!/usr/bin/perl

use strict;
use warnings;
use YAML;
use ExtUtils::MakeMaker;

###

my $deps = {
	'LWP::Simple' => 0,
	'Exporter' => 0,
};
my $name = 'WWW::FreeProxy';
my $main = 'lib/WWW/FreeProxy.pm';

###

require "./$main";

open F, '> META.yml';
print F Dump {
	name		=> $name,
	version		=> ${WWW::FreeProxy::VERSION},
	version_from	=> $main,
	installdirs	=> 'site',
	requires	=> $deps,
	distribution_type => 'module',
	generated_by	=> "ExtUtils::MakeMaker version $ExtUtils::MakeMaker::VERSION",
};
close F;

WriteMakefile(
    NAME                => $name,
    AUTHOR              => 'Alexey Alexandrov <swined@cpan.org>',
    VERSION_FROM        => $main,
    ABSTRACT_FROM       => $main,
    PL_FILES            => {},
    PREREQ_PM		=> $deps,
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW-FreeProxy-*' },
);
