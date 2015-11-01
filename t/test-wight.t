#!/usr/bin/perl
use strict;
use warnings;

use Test::Spec;
use Test::Wight;

my $html = <<__HTML__;
<!doctype html>
<html>
  <head>
    <title>sample app</title>
  </head>
  <body>
    <div id="main">This is a sample app.</div>
  </body>
</html>
__HTML__

my $app = sub {
    return [ 200, [ 'Content-Type' => 'text/html' ], [$html] ];
};

describe 'my site' => sub {
    my $wight;
    $wight = Test::Wight->new;
    $wight->spawn_psgi($app);
    $wight->visit('/');
    describe 'title' => sub {
        it 'should be "sample app"' => sub {
            is( $wight->evaluate('document.title'), 'sample app' );
        };
    };
    describe 'div#main in body' => sub {
        it 'should be "This is a sample app."' => sub {
            is( $wight->find('div#main')->text, 'This is a sample app.' );
        };
    };
};

runtests unless caller;

