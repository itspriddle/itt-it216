#!/usr/bin/perl
#
# page 326
#
use strict;
use warnings;

print( "Opening file for output\n" );
open( OUTFILE, ">file.txt" )
	or die( "Cant find file.txt: $!" );
print( "Outputting to fo;e\n" );
print( OUTFILE "There was an old lady\n" );
close( OUTFILE ) or die( "Can not close file.txt: $!" );

print "The file now contains:\n";
open( INFILE, "file.txt" )
	or die( "Couln't open file.txt: $!");
print while ( <INFILE> );
close( INFILE ) or die ( "Can not close file.txt: $!" );

print( "\nAppend to the end of the file\n" );
open( OUTFILE, ">>file.txt" )
	or die( "Can not open file.txt: $!" );
print( OUTFILE "who lived in a shoe.\n" );
close( OUTFILE ) or die( "Can not close file.txt: $!" );

print( "It now reads:\n" );
open( INFILE, "file.txt")
	or die( "Can not open file.txt: $!" );
print while ( <INFILE> );
close( INFILE ) or die( "Can not close file.txt: $!" );


