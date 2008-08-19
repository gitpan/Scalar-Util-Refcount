/**********************************************************************
Copyright (c) 2008, Jeremy Nixon <jnixon@cpan.org>

All rights reserved.

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer. Redistributions
in binary form must reproduce the above copyright notice, this list of
conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

Neither the name of the author nor the names of any contributors may be
used to endorse or promote products derived from this software without
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

$Rev: 1 $
$Date: 2008-08-18 20:51:07 -0400 (Mon, 18 Aug 2008) $
**********************************************************************/
%module "Scalar::Util::Refcount"

%include typemaps.i

int refcount(SV *sv=&PL_sv_undef);
int refcount_sv(SV* sv=&PL_sv_undef);

%{

// if passed a reference, dereference it and return the reference count of
// the object pointed to. If not, return the reference count of the SV itself.
// The comparison to &PL_sv_undef is for refcount(undef), which returns
// bizarre results; passing an undefined variable will not trigger it.
int refcount(SV *sv) {
    if (sv == &PL_sv_undef) return 0;
    if (SvROK(sv)) return SvREFCNT(SvRV(sv));
    return SvREFCNT(sv);
}

// returns the reference count of the passed SV.
int refcount_sv(SV *sv) {
    if (sv == &PL_sv_undef) return 0;
    return SvREFCNT(sv);
}

%}
