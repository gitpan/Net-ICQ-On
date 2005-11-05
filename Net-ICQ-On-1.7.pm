#ICQOn.pm (c)2005 Jerome K Maule McKean, Dream ƒrequency
#ICQ Online Status Tester v1.7 (20051105); Checks whether a user is online and returns 1 for online and 0 for offline.
package ICQOn;

use LWP::UserAgent;
use strict;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT = qw(ICQOn);

sub ICQOn {
	my $GIF="";
	my $ICQNo=$_[0];
	my $Match="47494638396112001200B3FF00FFFFFFC0";
	my $Online=0;
	my $Req="";
	my $Result="";
	my $UA=new LWP::UserAgent;

	$UA->agent("Dream ƒrequency Net-ICQ-On ICQ Online Tester/1.7");
	$Req=HTTP::Request->new(GET=>"http://status.icq.com/online.gif?icq=$ICQNo&img=5");
	$Req->referer('http://dreamfrequency.com');
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

Net::ICQ::On - ICQ Online Status Tester v1.7 (20051105)

=head1 SYNOPSIS

  use ICQOn;

  my $Online=ICQOn(<ICQ No./>);

  my $Online=ICQOn(204913808);

  print "My ICQ number is ";
  if ($Online==1) { print '<span style="color: green;">204913808</span>.\n'; }
  else { print "204913808.\n"; }

=head1 DESCRIPTION

This module checks the online status of any ICQ user and returns 1 for online and 0 for offline.

=head1 COPYRIGHT

Code is copyright (c)2005 Jerome McKean, Dream Frequency.  ICQ is copyright (c)1998-2005 ICQ Inc..

=head1 AUTHOR INFORMATION

Net::ICQ::On was created by Jerome McKean (jerome@dreamfrequency.com), owner of Dream Frequency (http://dreamfrequency.com).  This Perl module is free software and may be redistributed unchanged under the same license as Perl itself.

=cut
