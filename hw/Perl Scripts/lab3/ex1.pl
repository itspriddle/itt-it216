#!/usr/bin/perl
# 
# page 137 fig 5.2
#

foreach ( 1 .. 10 ) {
	print "*";
}

print "\n";

foreach $letter ( 'A' .. 'G' ) {
	print $letter;
}

print "\n";

for $letter ( 'A' .. 'G' ) {
	print $letter;
}

print "\n";

for ( $number = 0; $number <= 20; $number += 5 ) {
	print "$number ";
}

print "\n";

foreach ( $number = 0; $number <= 20; $number += 5 ) {
	print "$number ";
}

print "\n";


