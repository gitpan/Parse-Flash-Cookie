#!perl -T

#   $Id: 00-load.t 32 2007-12-19 13:25:33Z aff $

use Test::More tests => 1;
use Math::BigFloat;
use Config;
use lib qw ( lib );
BEGIN {
  use_ok( 'Parse::Flash::Cookie' );
}

my $inf = Math::BigFloat->binf();   # value depend on compiler the
                                    # underlying math libraries were
                                    # compiled with.

diag( "Testing Parse::Flash::Cookie $Parse::Flash::Cookie::VERSION, Perl $], $^X, archname=$Config{archname}, byteorder=$Config{byteorder}, infinity=$inf" );

__END__
