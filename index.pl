#!/usr/bin/perl
# Created 10/2006 for IT216, CGI and Perl
# by Joshua Priddle


# use the mods we need for cgi.pm, DB connectivity, and file locking
use strict;
use warnings;
use CGI ':standard';
use Fcntl ':flock';
use DBI;
use DBD::mysql;

# create <div id="nav">
my $navigation = div ( {-id=>'nav'}, "\n",
        a ( {-href=>'index.pl'}, 					'Home' 		), 
		a ( {-href=>'index.pl?page=about'},			'About'		),
		a ( {-href=>'index.pl?page=portfolio'},		'Portfolio'	),
        a ( {-href=>'index.pl?page=contact'}, 		'Contact' 	), 
        a ( {-href=>'index.pl?page=guestbook'}, 	'Guestbook' )
    ), "\n";

# create <h1 id="header">
# the hidden span tag is to make it search engine friendly
my $header = h1( {-id=>'header'}, span( {-class=>'hidden'}, 'IT216: Joshua Priddle' ) ), "\n";

# create <div id="footer">
my $footer = div ( {-id=>'footer'}, "\n",
	    'footer'
    ), "\n";

# create the html for the home page
my $home_page 	 = h2( 'hey ', span( 'there...' ) ) . "\n".
				   p( 'Welcome to my Perl portfolio!' ) .
				   p( 'Not much to see here other than my prowess in Perl.  Click around a bit, and sign the '.
				   		a ( {-href=>'index.pl?page=guestbook'}, 'Guestbook' ) .' and let me know what you think.' ).
				   p( "If you want to see what I can do, take a look at my ". a ( {-href=>'index.pl?page=portfolio'}, 'Portfolio' ).
					  ".  Interested?  Use the ". a ( {-href=>'index.pl?page=contact'}, 'Contact' ) ." page to drop me a line." ).
				   p( "Have you signed the ". a ( {-href=>'index.pl?page=guestbook'}, 'Guestbook' ). " yet?" );

# create the html for the about page
my $about_info = <<ABOUT;
This site was created for ITT's IT216 (Perl and CGI in a Linux Environment). <br /><br /> It uses cgi.pm to create
any HTML needed. ('Here documents' are used for forms).<br /><br />The HTML itself, is fully standards compliant, 
and organized in such a way that the overall style of this site is easily changed by simply dropping a new CSS file on the
server.<br /><br />When forms are submitted, the information is validated using regular expressions to ensure that the user
has actually submitted what was expected.  If they enter <strong>incorrect</strong> information, they return to the sign form
which will now display the validation error.<br /><br />On the guestbook, submissions are stored in a flat text file.  For the contact
form, this information is stored within a MySQL database.<br /><br />Graphics for this site, were created for IT201 last Feb. by Tony Montemorano.
The CSS and HTML for that site were created by myself, and then imported into Perl.<br /><br />All in all, creating this site was a great
learning experience for me, however, I highly doubt you'll see <strong>#!/usr/bin/perl</strong> at the top of any of my future scripts.
ABOUT
my $about_page 	= h2( 'about this '. span( 'site' ) ) ."\n".
				  p( $about_info );

my $portfolio = <<PORT;
<div class="content">
  <div class="head"></div>
  <div class="body">
    <p class="header">Inglenook Realty / <a href="http://www.inglenookrealtyinc.com">www.inglenookrealtyinc.com</a></p>

    <div class="content-main">
      <p><img alt="inglenook.jpg" id="image22" src="http://www.nevercraft.net/wordpress/wp-content/uploads/2006/11/inglenook.jpg" /></p>
<p>Co-author: Tony Montemorano - Graphics; <a href="http://allusis.net">Allusis.net</a></p>
<p>Created using Dreamweaver and Fireworks 8.</p>
<p>Used PHP/MySQL and CSS.</p>
<p>Notes:<br />
Tony handled the graphics, and I did the code on this site. It went through a few different changes throughout development, but we were pleased with the final result all around.</p>
<p class="footer">XHTML Transitional, CSS, PHP, MySQL, Dreamweaver 8, Fireworks 8</p>

    </div>
    <p class="footer">Created: Jan 2006</p>
  </div>
  <div class="bottom"></div>
</div>
<hr />
<div class="content">
  <div class="head"></div>
  <div class="body">
    <p class="header">Creative Dance Arts / <a href="http://www.creativedancearts.org">www.creativedancearts.org</a></p>

    <div class="content-main">
      <p><img alt="Creative Dance Arts" id="image18" src="http://www.nevercraft.net/wordpress/wp-content/uploads/2006/11/creativedance.jpg" /></p>
<p>Created using Dreamweaver and Fireworks 8.</p>
<p>Used PHP/MySQL and CSS.</p>
<p><strong>Notes:</strong><br />
I created this site to be updated by the client at will with PHP/MySQL. This site also uses random CSS to generate different color shemes.</p>
<p>I also created a MySQL backend for use with Keith Devens&#8217; PHP Calendar.</p>
<p class="footer">XHTML Strict, CSS, PHP, MySQL, Dreamweaver 8, Fireworks 8</p>

    </div>
    <p class="footer">Created: Dec 2005</p>
  </div>
  <div class="bottom"></div>
</div>
<hr />
<div class="content">
  <div class="head"></div>
  <div class="body">
    <p class="header">Crawford Insurance / <a href="http://www.crawfordinsagency.com">www.crawfordinsagency.com</a></p>

    <div class="content-main">
      <p><img id="image16" alt="Crawford Insurance" src="http://www.nevercraft.net/wordpress/wp-content/uploads/2006/11/crawfordins.jpg" /></p>
<p>Created using Dreamweaver and Fireworks MX 2004.</p>
<p>Moderate usage of PHP and CSS.</p>
<p><strong>Notes:</strong><br />
Created several mail scripts in PHP to send info to agents for quotes. This was my first attempt with PHP and forms.</p>
<p class="footer">XHTML Trans., CSS, PHP, Dreamweaver MX&#8217;04, Fireworks MX&#8217;04</p>

    </div>
    <p class="footer">Created: Nov 2004</p>
  </div>
  <div class="bottom"></div>
</div>
<hr />
<div class="content">
  <div class="head"></div>
  <div class="body">
    <p class="header">Childs Automotive / <a href="http://www.childsautomotive.com">www.childsautomotive.com</a></p>

    <div class="content-main">
      <p><img alt="Childs Automotive" id="image14" src="http://www.nevercraft.net/wordpress/wp-content/uploads/2006/11/childsauto.jpg" /></p>
<p>Created using Dreamweaver and Fireworks MX.</p>
<p><strong>Notes:</strong><br />
This was my first project. I transferred content from the V1 site into a new layout.</p>
<p>This was done back in 2002, so some of the techniques I used are considered &#8216;legacy&#8217; at this point.</p>
<p>On that note, I&#8217;d love a chance to bring it back up to standards&#8230;</p>

<p class="footer">HTML 4, CSS, Dreamweaver MX, Fireworks MX</p>

    </div>
    <p class="footer">Created: Sep 2002</p>
  </div>
  <div class="bottom"></div>
</div>
PORT

my $portfolio_page  = h2( 'the '. span( 'portfolio' ) ) ."\n".
	                  p( $portfolio );


# the html for the contact us form
my $contact_form = <<CONTACTFORM;
<form method="post" action="index.pl" onsubmit="return false">
  <p><b>Name: </b><input type="text" name="name" size="25" /></p>
  <p><b>Email: </b><input type="text" name="email" size="25" /></p>
  <p><b>Send to: </b>
    <select name="sendto">
      <option value="">Choose a recipient</option>
      <option value="jpriddle\@gmail.com">jpriddle\@gmail.com</option>
      <option value="webmaster\@nevercraft.net">webmaster\@nevercraft.net</option>
    </select>
  </p>
  <p><b>Please enter your message: </b><br />
     <textarea name="message" rows="4" cols="36"></textarea></p>
  <p><input type="submit" value="Send Message" onclick="return send_message()" />
     <input type="reset" value="Reset" /></p>
  <input type="hidden" name="page" value="contact" />
  <input type="hidden" name="action" value="sign" />
</form>
CONTACTFORM

# create the html for the contact us page
my $contact_page 	= h2( 'contact ', span( 'us' ) ) . "\n".
					  p( "Contact us" ). "\n$contact_form";

# the sign guestbook form
my $guestbook_form = <<SIGNFORM;
<form method="post" action="index.pl" onsubmit="return false">
  <p><b>Name: </b><input type="text" name="name" size="25" /></p>
  <p><b>Please enter your comment: </b><br />
     <textarea name="comment" rows="4" cols="36"></textarea></p>
  <p><input type="submit" value="Sign Guestbook" onclick="return sign_guestbook()" />
     <input type="reset" value="Reset" /></p>
  <input type="hidden" name="page" value="guestbook" />
  <input type="hidden" name="action" value="sign" />
</form>
SIGNFORM

# create the html for the guestbook page
my $guestbook_page	= h2( 'sign the ', span( 'guestbook' ) ) . "\n".
					  p( "Sign it now!" ). "\n";


# create the page hader
print header();
#print "hello";


# grab VALUE of index.pl?page=VALUE
my $page = param( 'page' );

# if its blank, the user is home
if ( $page eq '' ) {
	$page = 'home';
}

#my $page_title = "IT216 - " . ucasefirst( $page ) . " - Joshua Priddle ";

# create the head html
# import a css style sheet to make this cgi.pm shit look nice
print start_html( 	-title=>'IT216 - Joshua Priddle', 
					-style=>{ -src=>'./css/main.css' }
	);


# print the page header and navigation areas
print "$header\n";
print $navigation;

# this is where the pagination happens...

## grab VALUE of index.pl?page=VALUE
#my $page = param( 'page' );

## if its blank, the user is home
#if ( $page eq '' ) {
#	$page = 'home';
#}

if ( $page eq 'home' ) {
# print the html for the Home page
	print 	"\n". div( {-id=>'content'}, "\n", 
				div( {-class=>'content-outer'}, "\n",
         			div( {-class=>'content-inner'}, "\n",
						"$home_page\n"
					), "\n",
				), "\n",
			);
} elsif ( $page eq 'contact' ) {
# print the html for the Contact Us page
	if ( param( 'action' ) eq 'sign' ) {
	# if the user just clicked 'Sign'
		my $from_email 	= param( 'email' 	);
		my $from_name	= param( 'name' 	);
		my $sentto		= param( 'sendto' 	); #notice, sent vs send... 
		my $message		= param( 'message'	);
		my $err_msg		= ''; # create a blank error

		# do some regex validation
		$err_msg .= p( 'Invalid email address!' ) if not ( $from_email 	=~ /^[a-z0-9._-]+@[A-Z0-9.-]+\.[a-z]{2,4}$/i 	); # match email
		$err_msg .= p( 'Invalid recipient!' 	) if not ( $sentto 		=~ /^[a-z0-9._-]+@[A-Z0-9.-]+\.[a-z]{2,4}$/i 	); # match email
		$err_msg .= p( 'Invalid name!' 			) if not ( $from_name 	=~ /^[a-z]+$/i 									); # match name, JUST letters
		$err_msg .= p( 'Invalid message!' 		) if not ( $message		=~ /^\w+/i 										); # match words

		if ( $err_msg eq '' ) {
		# if our error message is blank, no errors were fired
		# so we can connect to MySQL

			# create the connection
			my $dbh = DBI->connect( "DBI:mysql:priddle_nevercraft", "priddle", "p3ps10n3", {RaiseError => 1} );
			# prepare the results to be displayed when the user posts
			my $sth = $dbh->prepare( "SELECT * FROM it216_contact ORDER BY date_added DESC" );
			# sql to insert the new post into the DB
			my $sql = 	"INSERT INTO it216_contact ( date_added, from_email, from_name, sentto, message ) ".
						" VALUES ( NOW(), '$from_email', '$from_name', '$sentto', '$message' )";

			$dbh->do( $sql );	# perform the insert
			$sth->execute();	# perform the select

			my $contact_html = '';	# create a blank var for the contact html

			while ( my @row = $sth->fetchrow_array() ) { 
			# for each record found concat the following html to the contact page
				$contact_html .= "<p>On <b>$row[1]</b> <a href=\"mailto:".$row[2]."\">".$row[3]."</a>".
				 				 " sent <a href=\"mailto:$row[4]\">$row[4]</a> the following message:<br />".
								 "$row[5]</p>\n<hr size=\"1\" />";
			}

			# print the html to the page.
			print  div( {-id=>'content'}, "\n",
	 	       div( {-class=>'content-outer'}, "\n",
	            	div( {-class=>'content-inner'}, "\n",
							h2( 'contact ', span( 'us' ) ) . "\n". 
	                		"$contact_html\n"
	            		), "\n",
	 			), "\n",
	         );
		} else { # VALIDATION ERROR
		# show the errors and print the contact form again
			print  div( {-id=>'content'}, "\n",
              div( {-class=>'content-outer'}, "\n",
                    div( {-class=>'content-inner'}, "\n",
                            h2( 'contact ', span( 'us' ) ) . "\n".
							"$err_msg\n". hr().
                            "$contact_form\n" 
                        ), "\n",
                ), "\n",
             );
		}
	} else {
	# the user HAS NOT clicked sign, so show them just the contact form
	    print   "\n", div( {-id=>'content'}, "\n",
	                div( {-class=>'content-outer'}, "\n",
	                    div( {-class=>'content-inner'}, "\n",
							#"$contact_form".
	                        "$contact_page\n"
	                    ), "\n",
	                ), "\n",
	            );
	}

} elsif ( $page eq 'guestbook' ) {
# print the html for the Guestbook page
	if ( param( 'action' ) eq 'sign' ) { # user clicked sign
		#print "sign!";
		my $name = param( "name" );
		my $text = param( "comment" );

		if ( $name ) { # if a name was entered
		    #open( BOOK, ">>book.txt" ) or die( "Cannot open: $!" );			# open the db file for appending
		    #flock( BOOK, LOCK_EX ) or die( "Cannot get exclusive lock: $!" );	# get exclusive lock
		    #print( BOOK "$name said: \t" );										# write to file
		    #print( BOOK "$text\n" );
		    #flock( BOOK, LOCK_UN ) or die( "Cannot unlock file: $!" );			# unlock file
		    #close( BOOK ) or die( "Cannot close guestbook: $!" );				# close file
		}
		open( BOOK, "<book.txt" ) or die( "Cannot open guestbook: $!" );		# open file for reading
		flock( BOOK, LOCK_EX ) or die( "Cannot get exclusive lock: $!" );		# get exclusive lock
	
		my $comments;
		while ( <BOOK> ) { 					# parse the guestbook file
		    s/\t/<br \/>/g;					# substitute tabs for html <br />
		    $comments .= p( "$_" ) . "\n";	# concat the guestbook file line to $comments
		}

		# print the html for the view guestbook page
        print   "\n", div( {-id=>'content'}, "\n",
                    div( {-class=>'content-outer'}, "\n",
                        div( {-class=>'content-inner'}, "\n",
                            #"$comments\n".
							"$guestbook_page\n".
                            "$comments\n"
                        ), "\n",
                    ), "\n",
                );

		close( BOOK ) or die( "Cannot close guestbook: $!" );	# close file
	} else {
	# user did not click sign
		
		# print the sign guestbook page
	    print   "\n", div( {-id=>'content'}, "\n",
	                div( {-class=>'content-outer'}, "\n",
	                    div( {-class=>'content-inner'}, "\n",
	                        "$guestbook_page\n".
							"$guestbook_form"
	                    ), "\n",
	                ), "\n",
	            );
	}
} elsif ( $page eq 'about' ) {
	print	"\n", div( {-id=>'content'}, "\n",
                    div( {-class=>'content-outer'}, "\n",
                        div( {-class=>'content-inner'}, "\n",
                            "$about_page\n"
                        ), "\n",
                    ), "\n",
                );
} elsif ( $page eq 'portfolio' ) {
	print	"\n", div( {-id=>'content'}, "\n",
                    div( {-class=>'content-outer'}, "\n",
                        div( {-class=>'content-inner'}, "\n",
                            "$portfolio_page\n"
                        ), "\n",
                    ), "\n",
                );
}

# print </body></html>
print end_html;
