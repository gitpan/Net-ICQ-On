#Net::ICQ::On (c)2005-6 Jerome McKean, Dream ƒrequency
#On.pm
#ICQ Online Status Tester v1.9.1 (20060103); Check whether a user is online and return 1 for online and 0 for offline.
package Net::ICQ::On;

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
	my $Req='';
	my $Result='';
	my $UA=new LWP::UserAgent;
	$UA->agent("Dream ƒrequency Net-ICQ-On ICQ Online Tester/1.9.1");

	$Req=HTTP::Request->new(GET=>"http://status.icq.com/online.gif?icq=$ICQNo&img=5");
	$Result=$UA->request($Req);
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

Net::ICQ::On - ICQ Online Status Tester

=head1 SYNOPSIS

  use Net::ICQ::On;

  my $Online=On(<ICQ No./>);

  my $Online=On(204913808);

  print "My ICQ number is ";
  if ($Online==1) { print "<span style=\"color: green;\">204913808</span>.\n"; }
  else { print "204913808.\n"; }

=head1 DESCRIPTION

This module checks the online status of any ICQ user and returns 1 for online and 0 for offline.

=head1 VERSION

v1.9.1 (20060103)

=head1 COPYRIGHT

Code is copyright (c)2005-6 Jerome McKean, Dream Frequency.  ICQ is copyright (c)1998-2005 ICQ Inc..

=head1 AUTHOR INFORMATION

Net::ICQ::On was created by Jerome McKean (jerome@dreamfrequency.com), owner of Dream Frequency (http://dreamfrequency.com).  This Perl module is free software and may be freely redistributed unchanged.

=cut
