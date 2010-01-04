#!/usr/bin/perl
#
# page 142 fig 5.5
# mean median and mode
#

@opinions = ( 8, 9, 4, 7, 8, 5, 6, 4, 9, 9,
			 7, 8, 9, 5, 4, 8, 7, 8, 7, 7,
			 6, 6, 8, 9, 1, 9, 8, 7, 8, 7,
			 7, 8, 9, 8, 9, 4, 9, 6, 8, 4,
			 6, 7, 3, 4, 8, 7, 9, 8, 9, 2 );

$total = 0;

foreach ( @opinions ) {
	$total += $_;
}

$mean = $total / @opinions;
print "Survey mean result: $mean\n";

@sorted = sort { $a <=> $b } @opinions;
$middle = @sorted / 2;

if ( @sorted %2 == 0 ) {
	$median = ( $sorted[  $middle - 1  ] + $sorted[ $middle ] ) / 2;
} else {
	$median = $sorted[ $middle ];
}

print "Survery median result: $median\n";

$mode = 0;

foreach ( @opinions ) {
	++$frequency[ $_ ];

	if ( $frequency[ $_ ] > $frequency[ $mode ] ) {
		$mode = $_;
	}
}

print "Survey mode result: $mode\n\n";

print "Response\tFrequency\n";
print "--------\t---------\n";

foreach ( 1 .. 9 ) {
	print "$_\t\t", "*" x $frequency[ $_ ], "\n";
}

