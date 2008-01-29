#   $Id: Makefile.PL 145 2008-01-29 17:20:03Z aff $

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME          => 'Parse::Flash::Cookie',
  VERSION       => 0.07,
  AUTHOR        => 'Andreas Faafeng <aff@cpan.org>',
  VERSION_FROM  => 'lib/Parse/Flash/Cookie.pm',
  ABSTRACT_FROM => 'lib/Parse/Flash/Cookie.pm',
  PL_FILES      => {},
  PREREQ_PM     => {
    'Config'                => 0,
    'DateTime'              => 0,
    'File::Spec::Functions' => 0,
    'Log::Log4perl'         => 0,
    'Test::Differences'     => 0,
    'Test::More'            => 0,
    'Test::Strict'          => 0,
    'URI::Escape'           => 0,
    'XML::Writer'           => 0,
  },
  dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
  clean => { FILES    => 'Parse-Flash-Cookie-*' },
);
