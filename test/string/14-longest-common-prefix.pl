use strict;
use warnings;
use Test::Simple tests => 2;

# @param {string[]}
# @return {string}
sub longest_common_prefix {
	my $strs = shift;

	return '' if scalar @$strs == 0;

	foreach my $i (0..length(@$strs[0]) - 1) {
		foreach my $str (@$strs) {
			if (substr($$strs[0], $i, 1) ne substr($str, $i, 1)) {
				return substr($str, 0, $i);
			}
		}
	}
	return $strs
}

ok(longest_common_prefix(["flower","flow","flight"]) eq 'fl', 'test 1');
ok(longest_common_prefix(["dog","racecar","car"]) eq '', 'test 2');
