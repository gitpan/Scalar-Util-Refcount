#!/usr/bin/env perl

use Test::More tests => 7;
use strict;

BEGIN { use_ok('Scalar::Util::Refcount',':all') }

package TestObj;
sub new { return bless {} }
package main;

my $foo = TestObj->new;
is(refcount($foo),1, 'refcount of new object');

my $bar = $foo;
is(refcount($foo),2, 'refcount after new reference made');

$bar = undef;
is(refcount($foo),1, 'refcount after second reference destroyed');

is(refcount_sv($foo),1, 'refcount_sv');

$bar = \$foo;
is(refcount($foo), 1, 'refcount');
is(refcount_sv($foo),2, 'refcount_sv');
