#Net::ICQ::On (c)2005-6 Jerome McKean, Dream ƒrequency
#On.pm
#ICQ Online Tester v1.10.3 (20060321); Check whether any ICQ user is online and return 1 for online or 0 for offline.
package Net::ICQ::On;
$VERSION=1.10.3;

use HTTP::Request::Common;
use LWP::UserAgent;

require Exporter;
our @ISA='Exporter';
our @EXPORT='Test';

sub Test {
	shift;
	my $GIF='';
	my $ICQNo=$_[0];
	my $Match='47494638396112001200A2';
	my $Online=0;
	my $Result='';
	my $UA=new LWP::UserAgent;
	$UA->agent("Dream ƒrequency Net-ICQ-On ICQ Online Tester/1.10.3");

	$Result=$UA->request(GET "http://status.icq.com/online.gif?icq=$ICQNo&img=5");
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

  my $Online=Net::ICQ::On->Test(204913808);
  print "My ICQ number is ";
  if ($Online==1) { print "<span style=\"color: green;\">204913808</span>.\n"; }
  else { print "204913808.\n"; }

=head1 DESCRIPTION

This module checks the online state of any ICQ user and returns 1 for online or 0 for offline.  It downloads the smallest ICQ online gif and analyses it to determine online state.

Example use: in xhtml, see above example, to display ICQ number in green if online or default colour if offline.

=head1 UPDATED

Version 1.10.3 (20060321): Updated distribution.
Version 1.10.2 (20060320): Changed name of function.  Minor code updates.  Updated documentation.
Version 1.9.4: Changed to HTTP::Request::Common for simplicity and optimisation.

=head1 VERSION

v1.10.3 (20060320)

=head1 COPYRIGHT

Code is copyright (c)2005-6 Jerome McKean, Dream Frequency.  ICQ is copyright (c)1998-2006 ICQ Inc..

=head1 AUTHOR INFORMATION

Net::ICQ::On was created by Jerome McKean (jerome@dreamfrequency.com), owner of Dream Frequency (http://dreamfrequency.com), Useful Windows Software and Adult Frequency (http://adultfrequencysoft.com), Adult Windows Software.  This Perl module is free software and may be freely redistributed unchanged.

=cut
