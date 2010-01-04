#!/usr/bin/perl

use strict;
use warnings;
use CGI ':standard';

print header();
print start_html( -title => "Form Elements" );

my $text	 = param( "text" );
my $select   = param( "select" );
my $radio	 = param( "radio" );
my @checkbox = param( "checkbox" );
my $textarea = param( "textarea" );
my $mselect  = param( "mselect" );
my $password = param( "password" );
my $hidden 	 = param( "hidden" );

print "<p>The input field (text box) value is: $text </p>";
print "<p>The select (dropdown) value is: $select </p>";
print "<p>The radio value is: $radio </p>";
print "<p>The checkbox values you chose were: ";

foreach ( @checkbox ) {
	print "$_ ";
}

print "</p>";
print "<p>The textarea value is: $textarea </p>";
print "<p>The listbox value is: $mselect </p>";

#foreach ( $mselect ) {
#	print "$_ ";
#}

#print "</p>";
print "<p>The password value is: $password </p>";
print "<p>The hidden value is: $hidden </p>";


print end_html();
