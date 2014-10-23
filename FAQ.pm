###
### $Id$
###
### DBI Frequently Asked Questions POD
###
### Copyright section reproduced from below.
###
### This document is Copyright (c)1994-1998 Alligator Descartes, with portions
### Copyright (c)1994-1998 their original authors. This module is released under
### the 'Artistic' license which you can find in the perl distribution.
### 
### This document is Copyright (c)1997-1998 Alligator Descartes. All rights reserved.
### Permission to distribute this document, in full or in part, via email,
### Usenet, ftp archives or http is granted providing that no charges are involved,
### reasonable attempt is made to use the most current version and all credits
### and copyright notices are retained ( the I<AUTHOR> and I<COPYRIGHT> sections ).
### Requests for other distribution rights, including incorporation into 
### commercial products, such as books, magazine articles or CD-ROMs should be
### made to Alligator Descartes <I<descarte@arcana.co.uk>>.
### 
### $Log$

package DBI::FAQ;

$VERSION = '0.36';

=head1 NAME

DBI::FAQ -- The Frequently Asked Questions for the Perl5 Database Interface

=for html
<BODY BGCOLOR="#ffffff" TEXT="#000000" LINK="#3a15ff" ALINK="#ff0000" VLINK="#ff282d">
<!--#include virtual="/technologia/perl/DBI/templatetop.html" -->
<CENTER>
<FONT SIZE="+2">
DBI Frequently Asked Questions v.0.36
</FONT>
<BR>
<FONT SIZE="-1">
<I>Last updated: October 15th, 1998</I>
</FONT>
</CENTER>
<P>

=head1 SYNOPSIS

    perldoc DBI::FAQ

=head1 VERSION

This document is currently at version I<0.36>, as of I<October 15th, 1998>.

=head1 DESCRIPTION

This document serves to answer the most frequently asked questions on both
the DBI Mailing Lists and personally to members of the DBI development team.

=head1 Basic Information & Information Sources

=head2 1.1 What is DBI, DBperl, Oraperl and *perl?

To quote Tim Bunce, the architect and author of DBI:

    ``DBI is a database access Application Programming Interface (API)
      for the Perl Language. The DBI API Specification defines a set
      of functions, variables and conventions that provide a consistent
      database interface independant of the actual database being used.''

In simple language, the DBI interface allows users to access multiple database
types transparently. So, if you connecting to an Oracle, Informix, mSQL, Sybase
or whatever database, you don't need to know the underlying mechanics of the
3GL layer. The API defined by DBI will work on I<all> these database types.

A similar benefit is gained by the ability to connect to two I<different>
databases of different vendor within the one perl script, I<ie>, I want
to read data from an Oracle database and insert it back into an Informix
database all within one program. The DBI layer allows you to do this simply
and powerfully.


=for html
Here's a diagram that demonstrates the principle:
<P>
<CENTER>
<IMG SRC="img/dbiarch.gif" WIDTH=451 HEIGHT=321 ALT="[ DBI Architecture ]">
</CENTER>
<P>

I<DBperl> is the old name for the interface specification. It's usually
now used to denote perlI<4> modules on database interfacing, such as,
I<oraperl>, I<isqlperl>, I<ingperl> and so on. These interfaces
didn't have a standard API and are generally I<not> supported.

Here's a list of DBperl modules, their corresponding DBI counterparts and
support information. I<Please note>, the author's listed here generally
I<do not> maintain the DBI module for the same database. These email
addresses are unverified and should only be used for queries concerning the
perl4 modules listed below. DBI driver queries should be directed to the
I<dbi-users> mailing list.

    Module Name	Database Required   Author          DBI
    -----------	-----------------   ------          ---
    Sybperl     Sybase              Michael Peppler DBD::Sybase
                                    <mpeppler@itf.ch>
    Oraperl     Oracle 6 & 7        Kevin Stock     DBD::Oracle
                                    <dbi-users@fugue.com>
    Ingperl     Ingres              Tim Bunce &     DBD::Ingres
                                    Ted Lemon
                                    <dbi-users@fugue.com>
    Interperl   Interbase           Buzz Moschetti  DBD::Interbase
                                    <buzz@bear.com>
    Uniperl     Unify 5.0           Rick Wargo      None
                                    <rickers@coe.drexel.edu>
    Pgperl      Postgres            Igor Metz       DBD::Pg
                                    <metz@iam.unibe.ch>
    Btreeperl   NDBM                John Conover    SDBM?
                                    <john@johncon.com>
    Ctreeperl   C-Tree              John Conover    None
                                    <john@johncon.com>
    Cisamperl   Informix C-ISAM     Mathias Koerber None
                                    <mathias@unicorn.swi.com.sg>
    Duaperl     X.500 Directory     Eric Douglas    None
                User Agent

However, some DBI modules have DBperl emulation layers, so, I<DBD::Oracle>
comes with an Oraperl emulation layer, which allows you to run legacy oraperl
scripts without modification. The emulation layer translates the oraperl API
calls into DBI calls and executes them through the DBI switch.

Here's a table of emulation layer information:

    Module		    Emulation Layer     Status
    ------          ---------------     ------
    DBD::Oracle     Oraperl             Complete
    DBD::Informix   Isqlperl            Under development
    DBD::Sybase     Sybperl             Working? ( Needs verification )
    DBD::mSQL       Msqlperl            Experimentally released with 
                                        DBD::mSQL-0.61

The I<Msqlperl> emulation is a special case. I<Msqlperl> is a perl5 driver
for I<mSQL> databases, but does not conform to the DBI Specification. It's
use is being deprecated in favour of I<DBD::mSQL>. I<Msqlperl> may be downloaded
from CPAN I<via>:

    http://www.perl.com/cgi-bin/cpan_mod?module=Msqlperl

=head2 1.2. Where can I get it from?

DBI is primarily distributed from:

    ftp://ftp.demon.co.uk/pub/perl/db

The Comprehensive Perl Archive Network
resources should be used for retrieving up-to-date versions of the drivers,
since local mirror sites usually lag. CPAN may be accessed I<via> Tom
Christiansen's splendid I<CPAN multiplexer> program located at:

    http://www.perl.com/CPAN/

For more specific version information and exact URLs of drivers, please see
the DBI drivers list and the DBI module pages which can be found on:

    http://www.arcana.co.uk/technologia/perl/DBI

=head2 1.3. Where can I get more information?

There are a few information sources on DBI. 

=over 4

=item I<POD documentation>

I<POD>s are chunks of documentation usually embedded within perl programs
that document the code ``I<in place>'', providing a useful resource for
programmers and users of modules. POD for DBI and drivers is beginning to 
become more commonplace, and documentation for these modules can be read
with the following commands.

=over 4 

=item The DBI Specification

The POD for the DBI Specification can be read with the:

    perldoc DBI

command.

=item Oraperl

Users of the Oraperl emulation layer bundled with I<DBD::Oracle>, may read
up on how to program with the Oraperl interface by typing:

    perldoc Oraperl

This will produce an updated copy of the original oraperl man page written by
Kevin Stock for perl4. The oraperl API is fully listed and described there.

=item DBD::mSQL

Users of the I<DBD::mSQL> module may read about some of the private functions
and quirks of that driver by typing:

    perldoc DBD::mSQL

=item Frequently Asked Questions

This document, the I<Frequently Asked Questions> is also available as POD
documentation! You can read this on your own system by typing:

    perldoc DBI::FAQ

This may be more convenient to persons not permanently, or conveniently,
connected to the Internet.

=item POD in general

Information on writing POD, and on the philosophy of POD in general, can be
read by typing:

    perldoc perlpod

Users with the Tk module installed may be interested to learn there is a
Tk-based POD reader available called C<tkpod>, which formats POD in a convenient
and readable way.

=back

=item I<Rambles, Tidbits and Observations>

    http://www.arcana.co.uk/technologia/perl/DBI/tidbits

There are a series of occasional rambles from various people on the
DBI mailing lists who, in an attempt to clear up a simple point, end up
drafting fairly comprehensive documents. These are quite often varying in
quality, but do provide some insights into the workings of the interfaces.

=item I<``DBI -- The perl5 Database Interface''>

This is an article written by Alligator Descartes and Tim Bunce on the
structure of DBI. It was published in issue 5 of ``I<The Perl Journal>''. 
It's I<extremely> good. Go buy the magazine. In fact, buy all of them! 
``The Perl Journal''s WWW site is:

    http://www.tpj.com

This article has now been placed online thanks to the gracious permission of
Jon Orwant, editor of ``The Perl Journal''. It can be accessed I<via> the
WWW at

    http://www.arcana.co.uk/technologia/perl/DBI/doc/tpj5/index.html

The article contains information that is now out of date with regards to the
DBI 1.0 Specification since it was written approximately 2 years ago.

=item I<``DBperl''>

This article, published in the November 1996 edition of ``Dr. Dobbs
Journal'' concerned I<DBperl>. The author of this edition apparently did
not bother to contact any of the DBI development team members for verification
of the information contained within his article. Several reviews of the
article on the I<dbi-users> mailing list were disparaging, to say the least.
The fact the article was written about I<DBperl> instead of I<DBI> hints
at the staleness of the information.

However, we include the reference for completeness' sake.

=item I<``The Perl5 Database Interface''>

This item is a book being written by Alligator Descartes and Tim Bunce
and will be published by O'Reilly and Associates early in 1999.

Here is the putative table of contents for the book.

     * Introduction
          + Databases
          + CGI / WWW
          + perl
     * Basic Database Concepts
          + Types of Database
               o Flat File
               o AnyDBM
               o RDBMS
          + Using Which Database For What...
     * SQL
          + Why SQL?
          + Structuring Information In Databases
          + Retrieving Data From Databases
          + Manipulating Data and Data Structures
     * DBI Architecture
     * Programming with DBI
          + DBI Initialization
          + Handles
               o Driver Handles
               o Database Handles
               o Statement Handles
          + Connection and Disconnection
          + Handling Errors
          + Issuing Simple Queries
          + Executing Atomic Statements
          + Statement MetaData
          + More perl-ish Statements
          + Binding
          + Transaction Handling
          + Utility Methods
          + Handle Attributes and Dynamic Variables
     * DBI and ODBC
     * The Database Drivers
          + DBD::Oracle and oraperl
          + DBD::Informix and isqlperl
          + DBD::mSQL and Msqlperl
     * Case Studies
          + DBI and the WWW
          + Data Migration and Warehousing
          + Administration Software
     * Appendix: API Reference / Specification
     * Appendix: Resources

=item I<README files>

The I<README> files included with each driver occasionally contains 
some useful information ( no, really! ) that may be pertinent to the user.
Please read them. It makes our worthless existences more bearable. These
can all be read from the main DBI WWW page at:

    http://www.arcana.co.uk/technologia/perl/DBI

=item I<Mailing Lists>

There are three mailing lists for DBI run by Ted Lemon. These can all
be subscribed to and unsubscribed from I<via> the World Wide Web at the
URL of:

    http://www.fugue.com/dbi

The lists that users may participate in are:

=over 4

=item I<dbi-announce>

This mailing list is for announcements only. Very low traffic. The
announcements are usually posted on the main DBI WWW page.

If you cannot successfully use the form on the above WWW page, please
subscribe to the list in the following manner:

    Email: 'dbi-announce-request@fugue.com' with a message body of
    'subscribe'

=item I<dbi-dev>

This mailing list is intended for the use of developers discussing
ideas and concepts for the DBI interface, API and driver mechanics.
Only any use for developers, or interested parties. Low traffic.

If you cannot successfully use the form on the above WWW page, please
subscribe to the list in the following manner:

    Email: 'dbi-dev-request@fugue.com' with a message body of
    'subscribe'

=item I<dbi-users>

This mailing list is a general discussion list used for bug reporting,
problem discussion and general enquiries. Medium traffic.

If you cannot successfully use the form on the above WWW page, please
subscribe to the list in the following manner:

    Email: 'dbi-users-request@fugue.com' with a message body of
    'subscribe'

=back

=item I<Mailing List Archives>

=over 4

=item I<US Mailing List Archives>

    http://outside.organic.com/mail-archives/dbi-users/

Searchable hypermail archives of the three mailing lists, and some of the
much older traffic have been set up for users to browse.

=item I<European Mailing List Archives>

    http://www.rosat.mpe-garching.mpg.de/mailing-lists/PerlDB-Interest

As per the US archive above.

=back

=back

=head1 Compilation Problems

=head2 2.1. Compilation problems or "It fails the test!"

First off, consult the README for that driver in case there is useful 
information about the problem. It may be a known problem for your given 
architecture and operating system or database. You can check the README
files for each driver in advance online at:

    http://www.arcana.co.uk/technologia/perl/DBI

If it's a known problem, you'll probably have to wait till it gets fixed. If 
you're I<really> needing it fixed, try the following:

=over 4

=item I<Attempt to fix it yourself>

This technique is generally I<not> recommended to the faint-hearted.
If you do think you have managed to fix it, then, send a patch file
( context diff ) to the author with an explanation of:

=over 4

=item *

What the problem was, and test cases, if possible.

=item *

What you needed to do to fix it. Please make sure you mention everything.

=item *

Platform information, database version, perl version, module version and 
DBI version.

=back

=item I<Email the author> Do I<NOT> whinge!

Please email the address listed in the WWW pages for whichever driver you
are having problems with. Do I<not> directly email the author at a
known address unless it corresponds with the one listed.

We tend to have real jobs to do, and we do read the mailing lists for
problems. Besides, we may not have access to <I<insert your
favourite brain-damaged platform here>> and couldn't be of any
assistance anyway! Apologies for sounding harsh, but that's the way of it!

However, you might catch one of these creative genii at 3am when we're
doing this sort of stuff anyway, and get a patch within 5 minutes. The
atmosphere in the DBI circle is that we I<do> appreciate the users'
problems, since we work in similar environments.

If you are planning to email the author, please furnish as much information
as possible, I<ie>:

=over 4

=item *

I<ALL> the information asked for in the README file in
the problematic module. And we mean I<ALL> of it. We don't
put lines like that in documentation for the good of our health, or
to meet obscure README file standards of length.

=item *

If you have a core dump, try the I<Devel::CoreStack> module for
generating a stack trace from the core dump. Send us that too.
I<Devel::CoreStack> can be found on CPAN at:

    http://www.perl.com/cgi-bin/cpan_mod?module=Devel::CoreStack

=item *

Module versions, perl version, test cases, operating system versions
and I<any other pertinent information>.

=back

Remember, the more information you send us, the quicker we can track 
problems down. If you send us no useful information, expect nothing back.

=item I<Email the dbi-users Mailing List>

It's usually a fairly intelligent idea to I<cc> the mailing list
anyway with problems. The authors all read the lists, so you lose nothing
by mailing there.

=back

=head1 Platform and Driver Issues

=head2 3.1 What's the difference between ODBC and DBI?

Good question! To be filled in more detail! Meanwhile, see the notes at
the end of the DBI README file.

=head2 3.2 Is DBI supported under Windows 95 / NT platforms?

Finally, yes! Jeff Urlwin has been working diligently on building
I<DBI> and I<DBD::Oracle> under these platforms, and, with the
advent of a stabler perl and a port of I<MakeMaker>, the project has
come on by great leaps and bounds.

The I<DBI> and I<DBD::Oracle> Win32 ports are now a standard part of DBI,
so, downloading I<DBI> of version higher than I<0.81> should work fine as 
should using the most recent I<DBD::Oracle> version.

=head2 3.3 Can I access Microsoft Access or SQL-Server databases with DBI?

Yes, use the I<DBD::ODBC> driver.

=head2 3.4 Is the a DBD for <I<insert favourite database here>>?

Is is listed on the DBI drivers page?

    http://www.arcana.co.uk/technologia/perl/DBI

If not, no. A complete absence of a given database driver from that
page means that no-one has announced any intention to work on it, not that
such a driver is impossible to write.

A corollary of the above statement implies that if you see an announcement
for a driver I<not> on the above page, there's a good chance it's not
actually a I<DBI> driver, and may not conform to the specifications. Therefore,
questions concerning problems with that code should I<not> really be addressed
to the DBI Mailing Lists.

=head2 3.5 What's DBM? And why should I use DBI instead?

Extracted from ``I<DBI - The Database Interface for Perl 5>'':

    ``UNIX was originally blessed with simple file-based ``databases'', namely
    the dbm system. dbm lets you store data in files, and retrieve
    that data quickly. However, it also has serious drawbacks.

        File Locking

        The dbm systems did not allow particularly robust file locking
        capabilities, nor any capability for correcting problems arising through
        simultaneous writes [ to the database ].

        Arbitrary Data Structures

        The dbm systems only allows a single fixed data structure:
        key-value pairs. That value could be a complex object, such as a
        [ C ] struct, but the key had to be unique. This was a large
        limitation on the usefulness of dbm systems.

    However, dbm systems still provide a useful function for users with
    simple datasets and limited resources, since they are fast, robust and 
    extremely well-tested. Perl modules to access dbm systems have now
    been integrated into the core Perl distribution via the
    AnyDBM_File module.''

To sum up, DBM is a perfectly satisfactory solution for essentially read-only
databases, or small and simple datasets. However, for more powerful and
scaleable datasets, not to mention robust transactional locking, users are
recommended to use I<DBI>.

=head2 3.6 What database do you recommend me using?

This is a particularly thorny area in which an objective answer is difficult
to come by, since each dataset, proposed usage and system configuration
differs from person to person.

From the current author's point of view, if the dataset is relatively
small, being tables of less than 1 million rows, and less than 1000 tables
in a given database, then I<mSQL> is a perfectly acceptable solution
to your problem. This database is extremely cheap, is wonderfully robust
and has excellent support. More information is available on the Hughes
Technology WWW site at:

    http://www.hughes.com.au

If the dataset is larger than 1 million row tables or 1000 tables, or if you
have either more money, or larger machines, I would recommend I<Oracle RDBMS>.
Oracle's WWW site is an excellent source of more information.

    http://www.oracle.com

I<Informix> is another high-end RDBMS that is worth considering. There are
several differences between Oracle and Informix which are too complex for
this document to detail. Information on Informix can be found on their
WWW site at:

    http://www.informix.com

In the case of WWW fronted applications, I<mSQL> may be a better option
due to slow connection times between a CGI script and the Oracle RDBMS and
also the amount of resource each Oracle connection will consume. I<mSQL>
is lighter resource-wise and faster.

These views are not necessarily representative of anyone else's opinions,
and do not reflect any corporate sponsorship or views. They are provided
I<as-is>.

=head2 3.7 Is <I<insert feature here>> supported in DBI?

Given that we're making the assumption that the feature you have requested
is a non-standard database-specific feature, then the answer will be I<no>.

DBI reflects a I<generic> API that will work for most databases, and has
no database-specific functionality.

However, driver authors may, if they so desire, include hooks to database-specific
functionality through the C<func()> method defined in the DBI API.
Script developers should note that use of functionality provided I<via>
the C<func()> methods is unlikely to be portable across databases.

=head1 Programming Questions

=head2 4.1 Is DBI any use for CGI programming?

In a word, yes! DBI is hugely useful for CGI programming! In fact, I would
tentatively say that CGI programming is one of two top uses for DBI.

DBI confers the ability to CGI programmers to power WWW-fronted databases
to their users, which provides users with vast quantities of ordered
data to play with. DBI also provides the possibility that, if a site is
receiving far too much traffic than their database server can cope with, they
can upgrade the database server behind the scenes with no alterations to
the CGI scripts.

=head2 4.2 How do I get faster connection times with DBD::Oracle and CGI?

    Contributed by John D. Groenveld

The Apache C<httpd> maintains a pool of C<httpd> children to service client 
requests.

Using the Apache I<mod_perl> module by I<Doug MacEachern>, the perl 
interpreter is embedded with the C<httpd> children. The CGI, DBI, and your 
other favorite modules can be loaded at the startup of each child. These 
modules will not be reloaded unless changed on disk.

For more information on Apache, see the Apache Project's WWW site:

    http://www.apache.org

The I<mod_perl> module can be downloaded from CPAN I<via>:

    http://www.perl.com/cgi-bin/cpan_mod?module=Apache

=head2 4.3 How do I get persistent connections with DBI and CGI?

    Contributed by John D. Groenveld

Using Edmund Mergl's I<Apache::DBI> module, database logins are stored in a 
hash with each of these C<httpd> child. If your application is based on a 
single database user, this connection can be started with each child. 
Currently, database connections cannot be shared between C<httpd> children.

I<Apache::DBI> can be downloaded from CPAN I<via>:

    http://www.perl.com/cgi-bin/cpan_mod?module=Apache::DBI

=head2 4.4 ``When I run a perl script from the command line, it works, but, when I run it under the C<httpd>, it fails!'' Why?

Basically, a good chance this is occurring is due to the fact that the user
that you ran it from the command line as has a correctly configured set of
environment variables, in the case of I<DBD::Oracle>, variables like
C<$ORACLE_HOME>, C<$ORACLE_SID> or C<TWO_TASK>.

The C<httpd> process usually runs under the user id of C<nobody>,
which implies there is no configured environment. Any scripts attempting to
execute in this situation will correctly fail.

To solve this problem, set the environment for your database in a C<BEGIN { }>
block at the top of your script. This will solve the problem.

Similarly, you should check your C<httpd> error logfile for any clues,
as well as the ``Idiot's Guide To Solving Perl / CGI Problems'' and
``Perl CGI Programming FAQ'' for further information. It is
unlikely the problem is DBI-related.

The ``Idiot's Guide To Solving Perl / CGI Problems'' can be located at:

    http://www.perl.com/perl/faq/index.html

as can the ``Perl CGI Programming FAQ''. Read I<BOTH> these documents 
carefully!

=head2 4.5 How do I get the number of rows returned from a C<SELECT> statement?

    Contributed by Tim Bunce

Count them. Read the DBI docs for the C<rows()> method.

=head1 Miscellaneous Questions

=head2 5.1 Can I do multi-threading with DBI?

As of the current date of this FAQ ( I<see top of page> ), no. perl
does not support multi-threading. However, multi-threading is expected to
become part of the perl core distribution as of version 5.005, which implies
that DBI may support multi-threading fairly soon afterwards.

As of version 1.02 of DBI, DBI is not multi-thread-aware and use of 
multi-threading with DBI may result in undefined behaviour.

For some OCI example code for Oracle that has multi-threaded C<SELECT>
statements, see:

    http://www.arcana.co.uk/technologia/oracle/oci/orathreads.tar.gz

=head2 5.2 How do I handle BLOB data with DBI?

To be written.

=head2 5.3 How can I invoke stored procedures with DBI?

Assuming that you have created a stored procedure within the target
database, I<eg>, an Oracle database, you can use C<$dbh>->C<do()> to
immediately execute the procedure. For example,

    $dbh->do( "BEGIN someProcedure; END;" );

=head2 5.4 How can I get return values from stored procedures with DBI?

    Contributed by Jeff Urlwin

    $sth = $dbh->prepare( "BEGIN foo(:1, :2, :3); END;" );
    $sth->bind_param(1, $a);
    $sth->bind_param_inout(2, \$path, 2000);
    $sth->bind_param_inout(3, \$success, 2000);
    $sth->execute;

Remember to perform error checking, though!

=head2 5.5 How can I create or drop a database with DBI?

Database creation and deletion are concepts that are entirely too abstract
to be adequately supported by DBI. For example, Oracle does not support the
concept of dropping a database at all! Also, in Oracle, the database
I<server> essentially I<is> the database, whereas in mSQL, the
server process runs happily without any databases created in it. The
problem is too disparate to attack.

Some drivers, therefore, support database creation and deletion through
the private C<func()> methods. You should check the documentation for
the drivers you are using to see if they support this mechanism.

=head2 5.6 How can I C<commit> or C<rollback> a statement with DBI?

To be written. See the C<commit()> and C<rollback()> methods in the DBI
README.

=head2 5.7 How are C<NULL> values handled by DBI?

C<NULL> values in DBI are specified to be treated as the value C<undef>.
C<NULL>s can be inserted into databases as C<NULL>, for example:

    $rv = $dbh->do( "INSERT INTO table VALUES( NULL )" );

but when queried back, the C<NULL>s should be tested against C<undef>.
This is standard across all drivers.

=head2 5.8 What are these C<func()> methods all about?

The C<func()> method is defined within DBI as being an entry point
for database-specific functionality, I<eg>, the ability to create or
drop databases. Invoking these driver-specific methods is simple, for example,
to invoke a C<createDatabase> method that has one argument, we would
write:

    $rv =$dbh->func( 'argument', 'createDatabase' );

Software developers should note that the C<func()> methods are
non-portable between databases.

=head2 5.9 Is DBI Year 2000 Compliant?

DBI has no knowledge of understanding of what dates are. Therefore, DBI
itself does not have a Year 2000 problem. Individual drivers may use date
handling code internally and therefore be potentially susceptible to the
Year 2000 problem, but this is unlikely.

You may also wish to read the ``Does Perl have a Year 2000 problem?'' section
of the Perl FAQ at:

    http://www.perl.com/CPAN/doc/FAQs/FAQ/PerlFAQ.html

=head1 Support and Training

The Perl5 Database Interface is I<FREE> software. IT COMES WITHOUT WARRANTY
OF ANY KIND. See the DBI README for more details.

However, some organizations are providing either technical support or
training programs on DBI. The present author has no knowledge as
to the quality of these services. The links are included for reference
purposes only.

=head2 Commercial Support

=over 4

=item The Perl Clinic

The Perl Clinic can arrange commercial support contracts for I<Perl>, I<DBI>,
I<DBD::Oracle> and I<Oraperl>. Support is provided by the company with whom
Tim Bunce, author of I<DBI> and I<DBD::Oracle>, works. For more information on
their services, please see:

    http://www.perlclinic.com

for more details.

=back

=head2 Training

No training programs are known at this time.

=head1 Other References

In this section, we present some miscellaneous WWW links that may be of
some interest to DBI users. These are not verified and may result in
unknown sites or missing documents.

    http://www-ccs.cs.umass.edu/db.html
    http://www.odmg.org/odmg93/updates_dbarry.html
    http://www.jcc.com/sql_stnd.html

=head1 AUTHOR

Alligator Descartes <I<descarte@arcana.co.uk>>. Portions are Copyright their
original stated authors.

=head1 COPYRIGHT

This document is Copyright (c)1994-1998 Alligator Descartes, with portions
Copyright (c)1994-1998 their original authors. This module is released under
the 'Artistic' license which you can find in the perl distribution.

This document is Copyright (c)1997-1998 Alligator Descartes. All rights reserved.
Permission to distribute this document, in full or in part, via email,
Usenet, ftp archives or http is granted providing that no charges are involved,
reasonable attempt is made to use the most current version and all credits
and copyright notices are retained ( the I<AUTHOR> and I<COPYRIGHT> sections ).
Requests for other distribution rights, including incorporation into 
commercial products, such as books, magazine articles or CD-ROMs should be
made to Alligator Descartes <I<descarte@arcana.co.uk>>.

=for html
<!--#include virtual="/technologia/perl/DBI/templatebottom.html" -->
</BODY>
</HTML>
