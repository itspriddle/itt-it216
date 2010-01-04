#!/usr/bin/perl
#
# translation operator		tr///
# substitution operator		s///
#

use warnings;
use strict;


print "Feed me lower case letters and watch as my tr/// power converts them!\n\n";

my $user_input = <>;
chomp ( $user_input );

$user_input =~ tr/a-z/A-Z/;

print "$user_input\n\n";

print "Now, I will eat your tasty vowels.  They're s/// good!\n";

$user_input =~ s/[a|e|i|o|u]/ /gi;

print "$user_input\n\n";
