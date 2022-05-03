use strict;
use warnings;
use Test::Simple tests => 6;

##############################################################################################
# Question 125. Valid Palindrome
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/valid-palindrome/
#
# A phrase is a palindrome if, after converting all uppercase letters into lowercase letters 
# and removing all non-alphanumeric characters, it reads the same forward and backward. 
# Alphanumeric characters include letters and numbers.
#
# Given a string s, return true if it is a palindrome, or false otherwise.
#
# Example 1:
# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.
#
# Example 2:
# Input: s = "race a car"
# Output: false
# Explanation: "raceacar" is not a palindrome.
#
# Example 3:
# Input: s = " "
# Output: true
# Explanation: s is an empty string "" after removing non-alphanumeric characters.
# Since an empty string reads the same forward and backward, it is a palindrome.
#
# Parameters
# @param {string} s
# @return {boolean}
##############################################################################################
sub is_palindrome {
	my $s = shift;

	return 1 if $s eq '';

	# =~ is the operator testing a regular expression match
	$s =~ s/[^a-zA-Z0-9]//g;
	# lc is the lowercase function
	$s = lc $s;
	return $s eq reverse $s;
}

sub is_palindrome2 {
	my $s = shift;

	return 1 if $s eq '';

	my $regex = qr/[^a-zA-Z0-9]/;
	$s =~ s/$regex//g;
	$s = lc($s);
	return $s eq reverse $s;
}

ok(is_palindrome('A man, a plan, a canal: Panama') == 1, 'test 1');
ok(is_palindrome('race a car') eq '', 'test 2');
ok(is_palindrome(' ') == 1, 'test 3');

ok(is_palindrome2('A man, a plan, a canal: Panama') == 1, 'test 1');
ok(is_palindrome2('race a car') eq '', 'test 2');
ok(is_palindrome2(' ') == 1, 'test 3');
