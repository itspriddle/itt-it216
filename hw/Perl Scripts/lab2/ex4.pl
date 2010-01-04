#!/usr/bin/perl
# page 134 example 4.5
#
# create an array containing the values 0 to 9.  then create a hash with the values from 0 to 9
# as keys of the hash.  the corresponding values should be the english word for each numeric
# value.  IE: key '0' = 'zero'.  Display the contents of both the array and the hash
#
#

@array = ( 0 .. 9 );
@array2 = qw( zero one two three four five six seven eight nine );

#print "\@array\t@array\n";
#print "\@array2\t@array2\n";

#print "\n\$array2[2]\t$array2[2]\n";

#$hash{'2'} = $array2[2];

#print "\n\$hash{2} = $hash{2}\n\n";

for ($i = 0; $i <= 9; $i++) {
	$hash{ $array[ $i ] } = @array2[ $i ];
#	print "\$i = $i\n";
}
#print %hash;
@keys = sort { $a <=> $b } keys( %hash );




print "\@array is: @array\n";
print "\@array2 is: @array2\n\n";
print "\%hash is:", %hash, "\n\n";
#print %hash2;

print "The sorted hash is:\n";

for ( $i = 0; $i < @keys; ++$i ) {
        print "$keys[ $i ] => $hash{ $keys[ $i ] }\n";
}
