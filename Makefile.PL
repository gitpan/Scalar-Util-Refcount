use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Scalar::Util::Refcount',
    VERSION_FROM      => 'Refcount.pm',
    PREREQ_PM         => { 'XSLoader' => 0,
                           'Exporter' => '5.57' },
    OBJECT            => 'Refcount_wrap.o',
    AUTHOR            => 'Jeremy Nixon <jnixon@cpan.org>',
    LICENSE           => 'bsd',
    NO_META           => 1, # did this by hand to add more info.
);
