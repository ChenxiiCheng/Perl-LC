use strict;
use warnings;
use Test::Simple tests => 3;

# @param {string}
# @return {boolean}
sub is_valid_parentheses {
	my $str = shift;
	my @stack;
	my %map = (
		')' => '(',
		']' => '[',
		'}' => '{',
	);
	my @left_brackets = values %map;
	my @right_brackets = keys %map;

	foreach my $item (split('', $str)) {
		if (grep { $_ eq $item } @left_brackets) {
			push(@stack, $item);
		} elsif ((grep { $_ eq $item } @right_brackets) && scalar @stack) {
			my $temp = pop(@stack);
			if ($temp ne $map{$item}) {
				return 0;
			}
		} else {
			return 0;
		}
	}
	my $result = scalar @stack == 0 ? 1 : 0;
	return $result;
}

ok(is_valid_parentheses('()') == 1, 'test 1');
ok(is_valid_parentheses('()[]{}') == 1, 'test 1');
ok(is_valid_parentheses('(]') == 0, 'test 1');
