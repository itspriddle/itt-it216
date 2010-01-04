#!/usr/bin/perl
# page 32

print "Please enter the first number:\n";
chomp( $number1 = <> );

print "Please enter the second number:\n";
chomp( $number2 = <> );

$sum = $number1 + $number2;

print "The sum is $sum.\n";
