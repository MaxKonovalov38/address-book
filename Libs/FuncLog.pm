package FuncLog;
use strict;
use warnings;
our @EXPORT_OK = ('logger_file');

use lib 'Libs';
use FuncDate;


sub logger_file {
	my $file = shift;
	my $data = shift;

	open(my $fh, '>>', $file) or die;
	print $fh "[ ", FuncDate::get_now_iso_8601(), " ] -- ", $data, "\n";
	close($fh);
}

1;

__END__