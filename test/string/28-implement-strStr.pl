use strict;
use warnings;
use Test::Simple tests => 3;

sub str_str {
	my ($haystack, $needle) = @_;

	return "" if length($needle) == 0;

	my $len_of_haystack = length($haystack);
	my $len_of_needle = length($needle);

	foreach my $i (0..$len_of_haystack - 1) {
		if (substr($haystack, $i, $len_of_needle) eq $needle) {
			return $i;
		}
	}
	return -1;
}

ok(str_str('hello', '') eq '', 'test 1');
ok(str_str('hello', 'll') == '2', 'test 2');
ok(str_str('aaaaa', 'bba') == -1, 'test 3');
