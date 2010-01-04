#!/usr/bin/perl
#
use warnings;
use strict;
use DBI;
use DBD::mysql;
use CGI qw( :standard );

my $dbh = DBI->connect( "DBI:mysql:userdb", "priddle", "p3ps10n3", {RaiseError => 1} );
my $studentid 	= param( "studentid" );
my $dob			= param( "dob" );
my $major		= param( "major" );
my $gpa			= param( "gpa" );
my $ercredits	= param( "ercredits" );

my $sql = 	"INSERT INTO student_info ( studentid, dob, major, gpa, ercredits )".
			" VALUES ( '$studentid', '$dob', '$major', '$gpa', '$ercredits' )";


$dbh->do( $sql );

my $sth = $dbh->prepare( "SELECT * FROM student_info ORDER BY studentid" );
$sth->execute();

print( header(), start_html( "Insert Student" ) );

#print $sql;

print "<table width=\"50%\" border=\"1\" bordercolor=\"#666666\" cellpadding=\"5\">\n";

while ( my @row = $sth->fetchrow_array() ) {
	print "  <tr>\n    <td>$row['studentid']</td>\n";
	print "    <td>$row[1]</td>\n";
	print "    <td>$row[2]</td>\n";
	print "    <td>$row[3]</td>\n";
	print "    <td>$row[4]</td>\n  </tr>\n";
}

print "</table>\n";
$dbh->disconnect();
$sth->finish();

print "<a href=\"/~priddle/it216/lab8/studentadd.html\">Add Student Page</a>";

print end_html();


