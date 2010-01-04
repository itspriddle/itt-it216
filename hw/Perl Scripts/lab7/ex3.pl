#!/usr/bin/perl
# page 347-348
#
use strict;
use warnings;

foreach my $file ( @ARGV ) {
	print( "Checking $file: " );

	if ( -e $file ) {
		print( "$file exists!\n" );
		if ( -f $file ) {
			print( "The file $file is:" );
			print( " executable" ) 	if ( -x $file );
			print( " readable" ) 	if ( -r $file );
			print( " writable" ) 	if ( -w $file );
			print( "\n" );
			print( "It is ", -s $file, " bytes.\n" );
			my @time = timeconv( -A $file );
			print( 	"Last accessed at $time[0] days, ",
					"$time[1] hours, $time[2] minutes ",
					"and $time[3] seconds.\n" );
			@time = timeconv( -M $file );
            print(  "Last modified at $time[0] days, ",
                    "$time[1] hours, $time[2] minutes ",
                    "and $time[3] seconds.\n" );
		} elsif ( -d $file ) {
			print( "$file is a directory!" );
		}
	} else {
		print( "$file does not exist!" );
	}
} 

sub timeconv
{
	my $time = shift();
	my $days = int( $time );
	$time = ( $time - $days ) * 24;
	my $hours = int( $time );
	$time = ( $time - $hours ) * 60;
	my $minutes = int( $time );
	$time = ( $time - $minutes ) * 60;
	my $seconds = int( $time );
	return( $days, $hours, $minutes, $seconds );
}
