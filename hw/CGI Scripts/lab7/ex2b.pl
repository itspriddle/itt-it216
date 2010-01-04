#!/usr/bin/perl
# page 336
#
use strict;
use warnings;
use CGI qw( :standard );
use Fcntl qw( :flock );

print( header() );
print( start_html( -title => "My guestbook" ) );
print( p( b( i( "Entries in my guestbook: \n" ) ) ) );

my $name = param( "name" );
my $text = param( "comment" );

if ( $name ) {
	open( BOOK, ">>book.txt" ) or die( "Cannot open: $!" );
	flock( BOOK, LOCK_EX ) or die( "Cannot get exclusive lock: $!" );
	print( BOOK "$name said: \t" );
	print( BOOK "$text\n" );
	flock( BOOK, LOCK_UN ) or die( "Cannot unlock file: $!" );
	close( BOOK ) or die( "Cannot close guestbook: $!" );
}

open( BOOK, "<book.txt" ) or die( "Cannot open guestbook: $!" );
flock( BOOK, LOCK_EX ) or die( "Cannot get exclusive lock: $!" );

while ( <BOOK> ) {
	s/\t/<br \/>/g;
	print( p( "$_" ) );
}

close( BOOK ) or die( "Cannot close guestbook: $!" );
print( ent_html() );


