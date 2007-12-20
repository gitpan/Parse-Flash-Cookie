#   $Id: Makefile.PL 47 2007-12-20 08:27:11Z aff $

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Parse::Flash::Cookie',
  VERSION       => 0.01,
  AUTHOR        => 'Andreas Faafeng <aff@cpan.org>',
  VERSION_FROM  => 'lib/Parse/Flash/Cookie.pm',
  ABSTRACT_FROM => 'lib/Parse/Flash/Cookie.pm',
  PL_FILES      => {},
  PREREQ_PM     => {
    'Test::More'            => 0,
    'Test::Differences'     => 0,
    'Log::Log4perl'         => 0,
    'File::Spec::Functions' => 0,
  },
  dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
  clean => { FILES    => 'Parse-Flash-Cookie-*' },
);
