#!perl -T

#   $Id: pod-coverage.t 32 2007-12-19 13:25:33Z aff $

use strict;
use warnings;
use Test::More;

use lib qw (lib);
my $trustme = { trustme => [qr/^(parse|to_xml)$/] }; # skip pod check of the parse function

# Ensure a recent version of Test::Pod::Coverage
my $min_tpc = 1.08;
eval "use Test::Pod::Coverage $min_tpc";
plan skip_all => "Test::Pod::Coverage $min_tpc required for testing POD coverage"
    if $@;

# Test::Pod::Coverage doesn't require a minimum Pod::Coverage version,
# but older versions don't recognize some common documentation styles
my $min_pc = 0.18;
eval "use Pod::Coverage $min_pc";
plan skip_all => "Pod::Coverage $min_pc required for testing POD coverage"
    if $@;

all_pod_coverage_ok($trustme);

__END__