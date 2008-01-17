#!perl -T

#   $Id: 03-to_xml.t 115 2008-01-17 08:29:43Z aff $

use warnings;
use strict;

use File::Spec::Functions;
use Test::More tests => 53;
use lib qw( lib );

my $datadir      = q{data};  # test files
my %file2content = ();


BEGIN { use_ok('Parse::Flash::Cookie') }
use Parse::Flash::Cookie;
ok(1);

%file2content = (
  'A_Browser.sol' => qr|<sol name="A_Browser" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="lastViewedFeatureIndex">1</data>\s*</sol>\s*|s,
  'Synergy_Area.sol' => qr|<sol name="Synergy_Area" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="lastViewedFeatureIndex">1</data>\s*</sol>\s*|s,
  'lastPart.sol' => qr|<sol name="lastPart" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="lastPart_nr">1</data>\s*</sol>\s*|s,
  'TestMovie_Config_Info.sol' => qr|<sol name="TestMovie_Config_Info" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="object" name="config">\s*<data type="boolean" name="m_debug">1</data>\s*<data type="object" name="client">\s*<data type="boolean" name="m_debug">1</data>\s*<data type="boolean" name="trace">1</data>\s*<data type="boolean" name="recordset">1</data>\s*<data type="boolean" name="http">1</data>\s*<data type="boolean" name="rtmp">1</data>\s*</data>\s*<data type="object" name="realtime_server">\s*<data type="boolean" name="m_debug">1</data>\s*<data type="boolean" name="trace">1</data>\s*</data>\s*<data type="object" name="app_server">\s*<data type="boolean" name="m_debug">1</data>\s*<data type="boolean" name="trace">1</data>\s*<data type="boolean" name="error">1</data>\s*<data type="boolean" name="recordset">1</data>\s*<data type="boolean" name="httpheaders">0</data>\s*<data type="boolean" name="amf">0</data>\s*<data type="boolean" name="amfheaders">0</data>\s*<data type="boolean" name="coldfusion">1</data>\s*</data>\s*</data>\s*</sol>|s,
  'clearspring.sol' => qr|<sol name="clearspring" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="string" name="userId">470f65bcd2e75653</data>\s*<data type="object" name="sessions">\s*<data type="string" name="470f65ea2bea2428">ver=0%2E7%2E8</data>\s*</data>\s*<data type="object" name="events">\s*<data type="array" length="1" name="470f65ea2bea2428">\s*<data type="array" length="3" name="0">\s*<data type="number" name="0">34</data>\s*<data type="number" name="1">1192191468014</data>\s*<data type="undef" name="2"></data>\s*</data>\s*</data>\s*</data>\s*<data type="object" name="lastHeartbeat">\s*<data type="number" name="470f65ea2bea2428">1192191476467</data>\s*</data>\s*<data type="object" name="loadTime">\s*<data type="number" name="470f65ea2bea2428">1192191466276</data>\s*</data>\s*<data type="object" name="servers">\s*<data type="string" name="470f65ea2bea2428">cs40.clearspring.com:80</data>\s*</data>\s*<data type="object" name="newPlacements">\s*<data type="number" name="470f65ea2bea2428">0</data>\s*</data>\s*<data type="object" name="clicks">\s*<data type="number" name="470f65ea2bea2428">0</data>\s*</data>\s*<data type="object" name="clickmap">\s*<data type="string" name="470f65ea2bea2428"></data>\s*</data>\s*<data type="object" name="interactionTimes">\s*<data type="number" name="470f65ea2bea2428">0</data>\s*</data>\s*<data type="object" name="versions"></data>\s*</sol>\s*|s,
  'mediaPlayerUserSettings.sol' => qr|<sol name="mediaPlayerUserSettings" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="volume">1</data>\s*<data type="boolean" name="smoothing">0</data>\s*<data type="string" name="sizeMode">fit</data>\s*</sol>|s,
  'revverplayer.sol' => qr|<sol name="revverplayer" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="string" name="cookie">5d72699b80429b5b32e64cbb42ddc73f</data>\s*</sol>|s,
   'settings.sol' => qr|<sol name="settings" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="object" name="website.com">\s*<data type="boolean" name="video.google.com">1</data>\s*<data type="boolean" name="nokia.com">1</data>\s*<data type="boolean" name="www.youtube.com">1</data>\s*<data type="boolean" name="youtube.com">1</data>\s*<data type="boolean" name="pandora.com">1</data>\s*<data type="boolean" name="disney.com">1</data>\s*<data type="boolean" name="flash.revver.com">1</data>\s*<data type="boolean" name="slashdot.org">1</data>\s*<data type="boolean" name="perlmonks.org">1</data>\s*</data>\s*<data type="number" name="gain">50</data>\s*<data type="boolean" name="echosuppression">0</data>\s*<data type="string" name="defaultmicrophone"></data>\s*<data type="string" name="defaultcamera"></data>\s*<data type="number" name="defaultklimit">100</data>\s*<data type="boolean" name="defaultalways">0</data>\s*<data type="boolean" name="crossdomainAllow">0</data>\s*<data type="boolean" name="crossdomainAlways">0</data>\s*</sol>\s*|s,
   'soundData.sol' => qr|<sol name="soundData" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="volume">100</data>\s*<data type="boolean" name="mute">0</data>\s*</sol>\s*|s,
   'v3_Machine.sol' => qr|<sol name="v3_Machine" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="volume">100</data>\s*<data type="number" name="persistenceTestValue">1</data>\s*<data type="null" name="anonymousAuthToken"></data>\s*<data type="boolean" name="stationSortOrder">1</data>\s*<data type="string" name="station">159774106279022222</data>\s*<data type="number" name="playTime">1251997</data>\s*<data type="boolean" name="hasLoggedIn">1</data>\s*</sol>\s*|s,
   'v3_PerfComp.sol' => qr|<sol name="v3_PerfComp" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="object" name="counts">\s*<data type="number" name="st159758330864144014">6</data>\s*<data type="number" name="st159773247285563022">4</data>\s*<data type="number" name="st159774106279022222">5</data>\s*</data>\s*<data type="object" name="timestamps">\s*<data type="number" name="st159758330864144014">1161599020564</data>\s*<data type="number" name="st159773247285563022">1161599713693</data>\s*<data type="number" name="st159774106279022222">1161600321118</data>\s*</data>\s*<data type="object" name="totalListeningTimes">\s*<data type="number" name="st159758330864144014">7801549</data>\s*<data type="number" name="st159773247285563022">595251</data>\s*<data type="number" name="st159774106279022222">1711777</data>\s*</data>\s*<data type="object" name="lastListeningTimestamps">\s*<data type="number" name="st159758330864144014">1161599715935</data>\s*<data type="number" name="st159773247285563022">1161600323067</data>\s*<data type="number" name="st159774106279022222">1161602049881</data>\s*</data>\s*<data type="number" name="routeid">1161588196700</data>\s*<data type="number" name="routeExpiration">1161616450212</data>\s*</sol>\s*|s,
   'v4_UserCredentials.sol' => qr|<sol name="v4_UserCredentials" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="string" name="username">foo\@bar.com</data>\s*<data type="string" name="password">qwerty</data>\s*</sol>\s*|s,
   'video.sol' => qr|<sol name="video" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="boolean" name="soundmuted">0</data>\s*</sol>\s*|s,
   'base_test.sol'  => qr|<sol name="test" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="\+Infinity">inf</data>\s*<data type="number" name="-Infinity">-inf</data>\s*<data type="boolean" name="tBoolean">1</data>\s*<data type="boolean" name="fBoolean">0</data>\s*<data type="boolean" name="eBoolean">1</data>\s*<!-- DateObject:Milliseconds Count From Jan. 1, 1970; Timezone UTC \+ Offset. -->\s*<data type="date" name="Date" msec="1212359634000" date="2008-06-01 22:33:31" utcoffset="-9"></data>\s*</sol>\s*|s,
  # expected output from wrong_size.sol equals base_test.sol
  'wrong_size.sol'  => qr|<sol name="test" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="number" name="\+Infinity">inf</data>\s*<data type="number" name="-Infinity">-inf</data>\s*<data type="boolean" name="tBoolean">1</data>\s*<data type="boolean" name="fBoolean">0</data>\s*<data type="boolean" name="eBoolean">1</data>\s*<!-- DateObject:Milliseconds Count From Jan. 1, 1970; Timezone UTC \+ Offset. -->\s*<data type="date" name="Date" msec="1212359634000" date="2008-06-01 22:33:31" utcoffset="-9"></data>\s*</sol>\s*|s,
   'pointer.sol'  => qr|<sol name="test" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<data type="pointer" name="Pointer">2</data>\s*<data type="array" length="2" name="Array">\s*<data type="number" name="\+Infinity">inf</data>\s*<data type="number" name="-Infinity">-inf</data>\s*</data>\s*<data type="object" name="Object">\s*<data type="boolean" name="tBoolean">1</data>\s*<data type="boolean" name="fBoolean">0</data>\s*<data type="boolean" name="eBoolean">1</data>\s*</data>\s*<!-- DateObject:Milliseconds Count From Jan. 1, 1970; Timezone UTC \+ Offset. -->\s*<data type="date" name="Date" msec="1199984394000" date="2008-01-10 16:59:31" utcoffset="-9"></data>\s*</sol>\s*|s,
   'fpv.sol' => qr|\s*<sol name="fpv" created_by="Parse::Flash::Cookie" version="\d+\.\d+">\s*<!-- DateObject:Milliseconds Count From Jan. 1, 1970; Timezone UTC \+ Offset. -->\s*<data type="date" name="ptrak" msec="1160858844461" date="2006-10-14 20:47:01" utcoffset="2"></data>\s*</sol>|s,
);

# Use sort to create test in a predictable sequence
foreach my $file (sort keys %file2content) {

  # untaint using expression from File::Find
  $file =~ qr|^([-+@\w./]+)$|;
  $file = $1;

  # locate test file
  my $file_with_path = catfile(q{data}, $file);
  ok(-f $file_with_path, qq{Expect '$file' to be a file on local filesystem});

 SKIP: {
    skip q{Cannot test missing file}, 2 unless -f $file_with_path;

    # check content of test file
    my $string      = ();
    eval {
      $string = Parse::Flash::Cookie::to_xml($file_with_path);
    };
    ok($@ eq q{}, qq{to_xml died when parsing '$file_with_path'}) or
      diag(q{Error message: } . $@);

    like ($string, $file2content{$file}, "testing $file_with_path xml content");
  }
}

__END__
