#!/usr/bin/perl
# 
# split and join functions
# user input!!
#
use warnings;
use strict;

print "Tell me a story!\n\n";

my $user_input = <>;
chomp( $user_input );
my @user_array = split( / /, $user_input );
print "\n\nThe split of \$user_input is: \n";
print "$_\n" foreach ( @user_array );


@user_array = split( / /, $user_input, 4 );
print "\n\nThe split of \$user_input (limit 4) is: \n";
print "$_\n" foreach ( @user_array );


my $joined_str = join( '|', split( / /, $user_input ) );


print "\n\nThe joined string is: $joined_str\n\n";


