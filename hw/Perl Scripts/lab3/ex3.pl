#!/usr/bin/perl
#
# page 194 fig 6.14
# recursive fibonacci function
#
@samplevalues = ( 0, 1, 2, 3, 4, 5, 6, 10, 20, 30, 35 );

foreach ( @samplevalues ) {
	print "fibonacci( $_ ) = ", fibonacci( $_ ), "\n";
}

sub fibonacci {
	my $number = shift;

	if ( $number == 0 or $number == 1 ) {
		return $number;
	} else {
#		print fibonacci( $number - 1 ) + 
#			  fibonacci( $number - 2 ), ", ";
	
		return fibonacci( $number - 1 ) +
			   fibonacci( $number - 2 );
	}
}


