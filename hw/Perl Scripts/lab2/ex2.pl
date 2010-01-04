#!/usr/bin/perl
# page 111: example 4.10
#

for ( $i = 1; $i <= 5; ++$i) {
	push( @array, $i );
	print "@array\n";
} 

while ( @array ) {
	$firsttotal += pop( @array );
	print "@array\n";
}

print "\$firsttotal = $firsttotal\n\n";

for ( $i = 1; $i <= 5; ++$i ) {
	unshift ( @array, $i );
	print "@array\n";
}

while ( @array ) {
	$secondtotal += shift ( @array );
	print "@array\n";
}

print "\$secondtotal = $secondtotal\n";
