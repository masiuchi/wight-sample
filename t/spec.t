#!/usr/bin/perl
use strict;
use warnings;

use Test::Spec;
use Wight;

my $wight = Wight->new;
$wight->visit('http://masiuchi.com/blog');

describe 'my site' => sub {
    describe 'title' => sub {
        it 'should be "masiuchi.com/blog/"' => sub {
            is( $wight->evaluate('document.title'), 'masiuchi.com/blog/' );
        };
    };
};

runtests unless caller;

