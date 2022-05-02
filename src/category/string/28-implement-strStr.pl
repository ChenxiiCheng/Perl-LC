use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 3;

####################################################################################
# Question 28. Implement strStr()
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/implement-strstr/
#
# Implement strStr().
# Given two strings needle and haystack, return the index of the first occurrence 
# of needle in haystack, or -1 if needle is not part of haystack.
#
# Clarification:
# What should we return when needle is an empty string? 
# This is a great question to ask during an interview.
#
# For the purpose of this problem, we will return 0 when needle is an empty string. 
# This is consistent to C's strstr() and Java's indexOf().
#
# Example 1:
# Input: haystack = "hello", needle = "ll"
# Output: 2
#
# Example 2:
# Input: haystack = "aaaaa", needle = "bba"
# Output: -1
#
# Parameters
# @param {string} haystack
# @param {string} needle
# @return {number}
####################################################################################
sub str_str {
	my ($haystack, $needle) = @_;

	return '' if length($needle) == 0;

	my $len_of_needle = length($needle);
	foreach my $i (0..length($haystack) - 1) {
		if (substr($haystack, $i, $len_of_needle) eq $needle) {
			return $i;
		}
	}
	return -1;
}

# Tests
ok(str_str('hello', '') eq '', 'test 1');
ok(str_str('hello', 'll') == 2, 'test 2');
ok(str_str('aaaaa', 'bba') == -1, 'test 1');
