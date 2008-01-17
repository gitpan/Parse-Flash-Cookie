# strict.t

use warnings;
use strict;

use Test::Strict tests => 3;
syntax_ok( 'lib/Parse/Flash/Cookie.pm' );
strict_ok( 'Parse::Flash::Cookie', "use strict; in Parse::Flash::Cookie" );
warnings_ok( 'lib/Parse/Flash/Cookie.pm' );

__END__

