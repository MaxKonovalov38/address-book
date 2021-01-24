package FuncDate;
use strict;
use warnings;
our @EXPORT_OK = ('get_now_iso_8601');
 
sub get_now_iso_8601 {
	my (
		$sec, $min, $hour,
		$mday, $mon, $year,
		$wday, $yday, $isdst,
	) = gmtime();

	my $iso_8601 = sprintf(
		'%04s-%02i-%02i %02i:%02i:%02i',
		$year + 1900,
		$mon + 1,
		$mday,
		$hour + 8, # Irkutsk
		$min,
		$sec,
	);

	return $iso_8601;
}

1;

__END__