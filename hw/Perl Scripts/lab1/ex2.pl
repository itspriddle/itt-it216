#!/usr/bin/perl
# take two numbers on input and
# add, subtract, multiply and devide them.
#
print "Please enter the first number:\n";
chomp( $number1 = <> );

print "Please enter the second number:\n";
chomp( $number2 = <> );

$sum = $number1 + $number2;
$product = $number1 * $number2;
$quotient = $number1 / $number2;
$difference = $number1 - $number2;

print "\n\n$number1 + $number2 = $sum\n";
print "$number1 - $number2 = $difference\n";
print "$number1 * $number2 = $product\n";
print "$number1 / $number2 = $quotient\n";

