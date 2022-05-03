use strict;
use warnings;
use Test::Simple tests => 3;

# @param {string}
# @return {boolean}
sub is_valid_parentheses {
	my $str = shift;
	my %brackets = (
		')' => '(',
		']' => '[',
		'}' => '{'
	);
	my @left_brackets = values %brackets;
	my @right_brackets = keys %brackets;
	my @stack;

	foreach my $item (split('', $str)) {
		if (scalar grep { $_ eq $item } @left_brackets) {
			push(@stack, $item);
		} elsif ((scalar grep { $_ eq $item } @right_brackets) && scalar @stack) {
			my $temp = pop(@stack);
			if ($brackets{$item} ne $temp) {
				return 0;
			}
		} else {
			return 0;
		}
	}
	my $res = scalar @stack == 0 ? 1 : 0;
	return $res;
}

ok(is_valid_parentheses('()') == 1, 'test 1');
ok(is_valid_parentheses('()[]{}') == 1, 'test 1');
ok(is_valid_parentheses('(]') == 0, 'test 1');
