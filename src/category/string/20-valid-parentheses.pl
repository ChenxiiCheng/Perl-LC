use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 4;

###################################################################################
# Question 20. Valid Parentheses
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/valid-parentheses/
#
# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', 
# determine if the input string is valid.
# An input string is valid if:
# Open brackets must be closed by the same type of brackets.
# Open brackets must be closed in the correct order.
#
# Example 1:
# Input: s = "()"
# Output: true
#
# Example 2:
# Input: s = "()[]{}"
# Output: true
#
# Example 3:
# Input: s = "(]"
# Output: false
#
# Parameters
# @param {string} s
# @return {boolean}
###################################################################################
sub is_valid {
  my $str = shift;
  my @stack;
	my %brackets_map = (
		')' => '(',
		']' => '[',
		'}' => '{'
	);
	my @left_brackets = values %brackets_map;
	my @right_brackets = keys %brackets_map;

	foreach my $char (split('', $str)) {
		if (grep { $_ eq $char } @left_brackets) {
			push(@stack, $char);
		} elsif ((grep { $_ eq $char } @right_brackets) && scalar @stack) {
			my $temp = pop(@stack);
			if ($brackets_map{$char} ne $temp) {
				return 0;
			}
		} else {
			return 0;
		}
	}
	my $result = scalar @stack == 0 ? 1 : 0;
	return $result;
}

# Tests
ok(is_valid('()') == 1, '()');
ok(is_valid('()[') == 0, '()[');
ok(is_valid('()[]{}') == 1, '()[]{}');
ok(is_valid('(]') == 0, '(]');
