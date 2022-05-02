use strict;
use warnings;
use Test::Simple tests => 2;

# @param {string[]}
# @return {string}
sub longest_common_prefix {
	my $arr = shift;

	return "" if scalar @$arr == 0;

	foreach my $i (0..length(@$arr[0]) - 1) {
		foreach my $item (@$arr) {
			if (substr(@$arr[0], $i, 1) ne substr($item, $i, 1)) {
				return substr($item, 0, $i);
			}
		}
	}
	return @$arr[0];
}

ok(longest_common_prefix(["flower","flow","flight"]) eq 'fl', 'test 1');
ok(longest_common_prefix(["dog","racecar","car"]) eq '', 'test 2');
