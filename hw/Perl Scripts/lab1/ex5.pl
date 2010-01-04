#!/usr/bin/perl
# page 80
# average sales problem with sentinel controlled repetition
#
$total = 0;
$weekcounter = 0;

print "Enter sales for week ", ++$weekcounter, " or enter quit: ";
chomp( $sales = <> );

until( $sales eq 'quit' || $sales eq 'q' ) {
	$weekcounter++;
	$total += $sales;
	print "Enter sales for week ", $weekcounter, " or enter q to quit: ";
	chomp( $sales = <> );
}

if ( $weekcounter != 0 ) {
	$average = $total / $weekcounter;
	print "\nSales averaged $average computers per week.\n";
} else {
	print "\nNo sales figures were entered.\n";
}


