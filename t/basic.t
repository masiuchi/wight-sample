#!/usr/bin/perl
use strict;
use warnings;

use Test::More;
use Wight;

my $wight = Wight->new;
$wight->visit('http://masiuchi.com/blog');

is( $wight->evaluate('document.title'), 'masiuchi.com/blog/' );

done_testing;

