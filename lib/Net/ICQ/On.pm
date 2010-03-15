#Net::ICQ::On (c)2005-2010 Pro ƒrequency
#On.pm
#ICQ Online Tester; Check whether any ICQ user is online or not, returns
#	1 for online or 0 for offline.
package Net::ICQ::On;
$VERSION='1.11.0'; #20100315

use HTTP::Request::Common;
use LWP::UserAgent;

require Exporter;
our @ISA='Exporter';
our @EXPORT='Test';

sub Test {
	shift;
	my $GIF='';
	my $ICQNo=$_[0];
	my $Match='47494638396112001200A';
	my $Online=0;
	my $Result='';
	my $UA=new LWP::UserAgent;
	$UA->agent("Pro ƒrequency Net-ICQ-On ICQ Online Tester/$VERSION");

	$Result=$UA->request(GET "http://status.icq.com/online.gif?icq=$ICQNo&
img=5");
	if ($Result->is_success) {
		$GIF=$Result->content;
		$GIF=unpack 'H*', $GIF;
		if ($GIF=~/^$Match/i) { $Online=1; }
	}

	return $Online;
}

1;

__END__

=head1 NAME

Net::ICQ::On - ICQ Online Tester

=head1 SYNOPSIS

  use Net::ICQ::On;

  my $Online=Net::ICQ::On->Test(<ICQ No./>);

  my $Online=Net::ICQ::On->Test(555123456);
  print "My ICQ number is ";
  if ($Online==1) { print "<span style=\"color: green;\">555123456
</span>.\n"; }
  else { print "555123456.\n"; }

=head1 DESCRIPTION

This module tests the online state of any ICQ user and returns 1 for
online or 0 for offline.

Features:
* No ICQ account is necessary,
* No ICQ server login is necessary.

These make it simple and quick to return the result.

It downloads the smallest ICQ online gif and analyses it to determine the
online state of the user.

It was designed to replace the large ICQ flower GIF that ICQ promotes as
an online test suitable for webpages because the standard GIF didn't fit
into the footer of the webpage it was required for.  This was coded
initially for the Dream Frequency website and then developed into a
useful Perl module registered at CPAN.

Example uses:
* In xhtml, see above example, on a homepage to display your ICQ number
in green if you're online or in the default colour if you're offline,
* As an interface for ICQ cam live support,
* As an interface for ICQ messaging,
* To redirect email to ICQ if the recipient is online.

=head1 UPDATED

Version 1.11.0 (20100315): Update for new ICQ GIF image. - 
Version 1.10.8 (20060628): Minor documentation update. - 
Version 1.10.7 (20060528): Minor code update for new GIF and minor
documentation update. - 
Version 1.10.6 (20060407): Minor documentation update. - 
Version 1.10.5 (20060404): Minor documentation update. - 
Version 1.10.4 (20060324): Minor code update. - 
Version 1.10.3 (20060321): Updated distribution. - 
Version 1.10.2 (20060320): Changed name of function.  Minor code
updates.  Updated documentation. - 
Version 1.9.4: Changed to HTTP::Request::Common for simplicity and
optimisation. - 
Versions 1.9.1, 1.9.0, 1.7, 1.6, 1.5, 1.4, 1.3: Previous versions.

=head1 VERSION

v1.11.0 (20100315)

=head1 COPYRIGHT

Code is copyright (c)2005-2010 Pro Frequency.  ICQ is copyright
(c)1998-2010 ICQ Inc..

=head1 AUTHOR INFORMATION

Net::ICQ::On was created by Frequency,
http://aboutf.com/
Free technical support: http://profrequency.com/support/
This Perl module is free software and may be freely redistributed
unchanged.

=cut
