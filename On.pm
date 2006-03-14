#Net::ICQ::On (c)2005-6 Jerome McKean, Dream �requency
#On.pm
#ICQ Online Tester v1.9.4 (20060314); Check whether any ICQ user is online and return 1 for online or 0 for offline.
package Net::ICQ::On;
$VERSION=1.9.4;

use HTTP::Request::Common;
use LWP::UserAgent;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(On);

sub On {
	my $GIF='';
	my $ICQNo=$_[0];
	my $Match='47494638396112001200A2';
	my $Online=0;
	my $Result='';
	my $UA=new LWP::UserAgent;
	$UA->agent("Dream �requency Net-ICQ-On ICQ Online Tester/1.9.4");

	$Result=$UA->request(GET "http://status.icq.com/online.gif?icq=$ICQNo&img=5");
	if ($Result->is_success) {
		$GIF=$Result->content;
		$GIF=unpack "H*", $GIF;
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

  my $Online=On(<ICQ No./>);

  my $Online=On(204913808);

  print "My ICQ number is ";
  if ($Online==1) { print "<span style=\"color: green;\">204913808</span>.\n"; }
  else { print "204913808.\n"; }

=head1 DESCRIPTION

This module checks the online state of any ICQ user and returns 1 for online or 0 for offline.  It downloads the smallest ICQ online gif and analyses it to determine online state.

=head1 VERSION

v1.9.4 (20060314)

=head1 COPYRIGHT

Code is copyright (c)2005-6 Jerome McKean, Dream Frequency.  ICQ is copyright (c)1998-2006 ICQ Inc..

=head1 AUTHOR INFORMATION

Net::ICQ::On was created by Jerome McKean (jerome@dreamfrequency.com), owner of Dream Frequency (http://dreamfrequency.com), Useful Windows Software and Adult Frequency (http://adultfrequencysoft.com), Adult Windows Software.  This Perl module is free software and may be freely redistributed unchanged.

=cut