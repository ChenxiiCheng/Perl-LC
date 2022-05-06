use strict;
use warnings;
use Test::Simple tests => 3;

# @param {string}
# @return {boolean}
sub is_valid_parentheses {
	my $str = shift;
	my @stack;
	my %brackets = (
		')' => '(',
		']' => '[',
		'}' => '{',
	);
	my @left_brackets = values %brackets;
	my @right_brackets = keys %brackets;

	foreach my $item (split('', $str)) {
		if (grep { $_ eq $item } @left_brackets) {
			push(@stack, $item);
		} elsif ((grep { $_ eq $item } @right_brackets) && scalar @stack) {
			# $temp = (, $item = )
			my $temp = pop(@stack);
			if ($temp ne $brackets{$item}) {
				return 0;
			}
		} else {
			return 0;
		}
	}
	return scalar @stack == 0 ? 1 : 0;
}

ok(is_valid_parentheses('()') == 1, 'test 1');
ok(is_valid_parentheses('()[]{}') == 1, 'test 1');
ok(is_valid_parentheses('(]') == 0, 'test 1');
