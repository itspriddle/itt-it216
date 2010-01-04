#!/usr/bin/perl
# page 125 example 4.17
#

%presidents =	( George => "Washington",
		  Abe    => "Lincoln",
		  Thomas => "Jefferson",
		  Harry  => "Truman" );

@keys = keys( %presidents );

while ( $key = pop( @keys ) ) {
	print "$key => $presidents{ $key }\n";
}

@values = values( %presidents );
print "\nThe values of the hash are:\n@values\n\n";

print "%presidents with its keys and values reversed\n";
%hash = reverse( %presidents );

while ( ( $key, $value ) = each ( %hash ) ) {
	print "$key => $value\n";
}
