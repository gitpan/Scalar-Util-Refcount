# Copyright (c) 2008, Jeremy Nixon <jnixon@cpan.org>
# 
# All rights reserved.
# 
# Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer. Redistributions
# in binary form must reproduce the above copyright notice, this list of
# conditions and the following disclaimer in the documentation and/or
# other materials provided with the distribution.
#
# Neither the name of the author nor the names of any contributors may be
# used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $Rev: 1 $
# $Date: 2008-08-18 20:51:07 -0400 (Mon, 18 Aug 2008) $

package Scalar::Util::Refcount;

use Exporter qw(import);
our @EXPORT = qw(refcount);
our @EXPORT_OK = qw(refcount refcount_sv);
our %EXPORT_TAGS = ('all' => \@EXPORT_OK);

our $VERSION = '1.0';

require XSLoader;
package Scalar::Util::Refcountc;
XSLoader::load('Scalar::Util::Refcount');
package Scalar::Util::Refcount;

*refcount_sv = *Scalar::Util::Refcountc::refcount_sv;
*refcount = *Scalar::Util::Refcountc::refcount;

1;

__END__
=pod

=head1 NAME

Scalar::Util::Refcount - Show an object's reference count

=head1 SYNOPSIS

 my $foo = Bar->new;
 say refcount($foo); # prints "1"
 my $baz = $foo;
 say refcount($foo); # prints "2"

=head1 DESCRIPTION

Provides two functions to show reference counts of Perl objects.

This can be handy when testing/debugging and you want to know what the
heck is going on.

This is a trivial module. The documentation is longer than the code.
Heck, the BSD license at the top of the file is longer than the code.
It took longer to make it release-ready than it took to write it.
It's handy, but seems almost not worth releasing.

I bet many of us have code like that in our personal libraries, and I
can't help thinking that if more of us took the hour to clean it up,
put it in a sensible namespace, write some documentation, and release
it, the world would be a better place.

=head1 FUNCTIONS

=over 4

=item B<refcount> ( obj )

Given a Perl scalar, return the object's reference count.  If the passed
scalar is a reference, it is dereferenced and the reference count of the
referenced object is returned.  Otherwise the reference count of the
scalar itself is returned.  This is normally what you want.

This function is exported by default.

=item B<refcount_sv> ( scalar )

Returns the reference count of the given scalar, even if it's a reference.
This is normally not what you want -- normally you'll have a reference to
an object and want to know the reference count of the underlying object,
not of the reference itself -- but sometimes it is.

This function is not exported by default.

=back

=head1 PREREQUISITES

There are no non-core dependencies. You will need a C compiler to install.
Tested on Perl 5.10.0 and 5.8.8.

SWIG is not necessary to build, install, or use this module, but will be
necessary if you want to modify it. See the README file.

=head1 AUTHOR

Jeremy Nixon <jnixon@cpan.org>

=head1 LICENSE

Released under a BSD license (3-clause).
