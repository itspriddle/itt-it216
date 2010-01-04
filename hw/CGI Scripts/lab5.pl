#!/usr/bin/perl
# page 273 - forms...
#

use strict;
use warnings;
use CGI ':standard';

my $firstname	= param( "firstname" );
my $lastname	= param( "lastname" );
my $phone		= param( "phone" );
my $date		= param( "date" );
my $time		= param( "time" );
my $email	    = param( "email" );

print header();
print start_html( -title => "Form Page" );

if ( $firstname =~ /^\w+$/ ) { # if the fn has a word
	print "<p>Hello there \L\u$firstname.</p>";
}

if ( $lastname =~ /^\w+$/ ) { # if the ln has a word
	print "<p>Hello there Mr./Mrs. \L\u$lastname.</p>";
}

#if ( $phone =~ /^		# start the line!!
#		(?:1-?)?		# optional 1-
#		(?:				# start alternate
#			\(			# left (
#			(\d{3})		# capture area code
#			\)			# right )
#		|				# or
#			(\d{3})		# capture area code
#		)
#		-?				# optional -
#		(\d{3})			# capture exchange
#		-?				# optional -
#		(\d{4})			# capture last 4
#		$/x )
if ( $phone =~ /^(?:1-?)?(?:\((\d{3})\)|(\d{3}))-?(\d{3})-?(\d{4})$/x ){
	print "<p>Your phone number is ", $1 || $2 , " - $3 - $4.</p>";
}

if ( $date =~ /^(1[012]|[1-9])\/([012]?\d|3[01])\/(\d\d)$/ ) {
	print "<p>The date is $1 / $2 / $3.</p>";
}

if ( $time =~ /^(1[012]|[1-9]):([0-5]\d):([0-5]\d)$/ ) {
	print "The time is $1 : $2 : $3.</p>";
}

if ( $email =~ /^.+@.+\\.[a-z]+$/ ) {
	print "<p>Your email was: $email </p>";
} else {
	print "<p>Your email $email, was invalid.</p>";
}

print end_html();
