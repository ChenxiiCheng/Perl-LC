use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 3;

################################################################################
# Question 58. Length of Last Word
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/length-of-last-word/
#
# Given a string s consisting of some words separated by some number of spaces, 
# return the length of the last word in the string.
# A word is a maximal substring consisting of non-space characters only.
# 
# Example 1:
# Input: s = "Hello World"
# Output: 5
# Explanation: The last word is "World" with length 5.
#
# Example 2:
# Input: s = "   fly me   to   the moon  "
# Output: 4
# Explanation: The last word is "moon" with length 4.
#
# Example 3:
# Input: s = "luffy is still joyboy"
# Output: 6
# Explanation: The last word is "joyboy" with length 6.
#
# Parameters
# @param {string} s
# @return {number}
################################################################################
sub trim {
	my $s = shift;
	$s =~ s/^\s+|\s+$//g;
	return $s;
}

sub length_of_last_word_1 {
	my $str = shift;
	my $trim_str = trim($str);
	my @arr = split(' ', $trim_str);
	return length($arr[-1]) || 0;
}

sub length_of_last_word_2 {
	my $str = shift;
	my @arr = grep { $_ ne ' ' } split(' ', $str);
	return length($arr[-1]) || 0;
}

# Tests for approach 1
ok(length_of_last_word_1('Hello World') == 5, 'test 1');
ok(length_of_last_word_1('   fly me   to   the moon  ') == 4, 'test 2');
ok(length_of_last_word_1('  luffy is still joyboy') == 6, 'test 3');

# Tests for approach 2
ok(length_of_last_word_2('Hello World') == 5, 'test 5');
ok(length_of_last_word_2('   fly me   to   the moon  ') == 4, 'test 6');
ok(length_of_last_word_2('  luffy is still joyboy') == 6, 'test 7');
