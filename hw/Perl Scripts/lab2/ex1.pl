#!/usr/bin/perl
# page 106 example 4.7
#
@array = qw( this is an array of strings );
print "@array\n\n";

@array2 = ( 1 .. 5 );
print "Value\tRunning Total\n";

for ( $i = 0; $i < 5; ++$i ) {
	$total += $array2[ $i ];
	print( $array2[ $i ], "\t$total\n");
} 

@array2 = ( 'a' .. 'z' );
print "\n@array2\n";


