#!perl -T

#   $Id: 00-load.t 32 2007-12-19 13:25:33Z aff $

use Test::More tests => 1;
use lib qw ( lib );
BEGIN {
  use_ok( 'Parse::Flash::Cookie' );
}

diag( "Testing Parse::Flash::Cookie $Parse::Flash::Cookie::VERSION, Perl $], $^X" );

__END__