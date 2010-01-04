#!/usr/bin/perl
# ex 2.8 write a program that asks the user to input the radius of a circle and prints the circles
# diameter, circumference, and area.  pi = 3.14159
#
# diameter = 2r
# circ = 2pi * r
# area = pi * r^2
#

print "Enter the radius of a circle to calculate\n",
	"the diameter, circumference, and area.\n\n";

chomp( $radius = <> );

$pi = 3.14159;

$diam = 2 * $radius;
$area = $pi * ($radius * $radius);
$circ = 2 * $pi * $radius;

print "\nIf the radius is $radius, then:\n",
	"\tThe diameter is: $diam\n",
	"\tThe circumference is: $circ\n",
	"\tThe area is: $area\n\n";


