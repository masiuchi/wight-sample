#!/usr/bin/perl
use strict;
use warnings;

use Test::Spec;
use Wight;

describe 'my site' => sub {
    my $wight;
    before all => sub {
        $wight = Wight->new;
        $wight->visit('http://masiuchi.com/blog');
    };
    describe 'title' => sub {
        it 'should be "masiuchi.com/blog/"' => sub {
            is( $wight->evaluate('document.title'), 'masiuchi.com/blog/' );
        };
    };
};

runtests unless caller;

