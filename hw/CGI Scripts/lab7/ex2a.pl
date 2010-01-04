#!/usr/bin/perl
# page 335-336
#
use strict;
use warnings;
use CGI qw( :standard );

print( header() );
print( start_html( -title => "My guest book" ) );

print <<FORM;
<form method="post" action="ex2b.pl">
<p><b>Name: </b><input type="text" name="name" size="25" /></p>
<p><b>Please enter your comment: </b><br />
<textarea name="comment" rows="4" cols="36"></textarea></p>
<p><input type="submit" value="Sign Guestbook" />
<input type="reset" value="Reset" /></p>
</form>
FORM

print( end_html() );

