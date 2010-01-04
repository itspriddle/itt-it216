#!/usr/bin/perl
# page 84 - analysis of sales results
#
$metquota = 0;
$didnotmeetquota = 0;
$employeecounter = 1;

while ( $employeecounter <= 10 ) {
	print "Did employee #$employeecounter meet the quota?  (yes or no): ";
	chomp ( $result = <> );

	( $result eq 'yes' || $result eq 'y' ) ? ++$metquota : ++$didnotmeetquota;
	$employeecounter++;
}

print "\nMet quota: $metquota\n";
print "Failed to meed quota: $didnotmeetquota\n";

if ( $metquota > 8 ) {
	print "Raise holiday bonuses!\n";
}
