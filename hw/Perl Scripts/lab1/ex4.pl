#!/usr/bin/perl
# write a program that reads 5 numbers from user input.  for each number read,
# your program should print a line containing that number of adjacent asterisks.
#
# 
#
print "Enter an integer between 1 and 30: ";
chomp( $a = <> );

print "Enter an integer between 1 and 30: ";
chomp( $b= <> );

print "Enter an integer between 1 and 30: ";
chomp( $c = <> );

print "Enter an integer between 1 and 30: ";
chomp( $d = <> );

print "Enter an integer between 1 and 30: ";
chomp( $e = <> );

print "$a)";
print "*" x $a, "\n";

print "$b)";
print "*" x $b, "\n";

print "$c)";
print "*" x $c, "\n";

print "$d)";
print "*" x $d, "\n";

print "$e)";
print "*" x $e, "\n";
