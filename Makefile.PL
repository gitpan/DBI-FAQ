###
### Makefile.PL
### 
### Meta-Makefile for DBI::FAQ

BEGIN { require 5.003 }

use ExtUtils::MakeMaker 5.16, qw(WriteMakefile $Verbose);
use Config;

%opts = (
	NAME=> 'DBI::FAQ',
	VERSION_FROM => 'FAQ.pm',
	'dist' => { 'COMPRESS' => 'gzip -v -f -9', 'SUFFIX' => 'gz' },
  );

warn <<EOM;

    Install DBI (using 'make install') before unpacking and building 
    this module.

EOM

WriteMakefile( %opts );

warn <<EOM;

    To read this module, type:

        make install

    and if this is successful:

        perldoc DBI::FAQ

    To convert this module into other formats, use any of the following
    programs:

EOM

my $fhID = open FH, "ls -1 $Config{scriptdir}/pod2* |";
if ( defined $fhID ) {
    while ( <FH> ) {
        print "\t$_";
      }
  }

exit;

__END__
