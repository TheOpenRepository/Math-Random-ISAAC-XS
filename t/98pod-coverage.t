#!/usr/bin/perl -T

# t/98pod-coverage.t
#  Ensures all subroutines are documented with POD
#
# $Id$

use strict;
use warnings;

use Test::More;

unless ($ENV{RELEASE_TESTING}) {
  plan skip_all => 'Author tests not required for installation';
}

my %MODULES = (
  'Test::Pod::Coverage' => 1.04,
);

# Module::CPANTS::Kwalitee won't detect that we're using test modules as
# author tests, so we convince it that we're loading it in the normal way.
0 and require Test::Pod::Coverage;

while (my ($module, $version) = each %MODULES) {
  eval "use $module $version";
  if ($@) {
    die 'Could not load release-testing module ' . $module;
  }
}

all_pod_coverage_ok();
