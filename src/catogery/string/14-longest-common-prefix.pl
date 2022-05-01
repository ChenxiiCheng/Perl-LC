use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 2;
use Data::Dumper qw(Dumper);

########################################################################################
# Question 14. Longest Common Prefix
# Difficulty: Easy
# https://leetcode.com/problems/longest-common-prefix/
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
# Input: strs = ["flower","flow","flight"]
# Output: "fl"
#
# Example 2:
# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
#
# Parameters
# @param {string[]} strs
# @return {string}
#########################################################################################
sub longest_common_prefix {
  my $arr = shift;

  return '' if scalar @$arr == 0;

  foreach my $i (0..length(@$arr[0]) - 1) {
    foreach my $str (@$arr) {
      if (substr(@$arr[0], $i, 1) ne substr($str, $i, 1)) {
        return substr($str, 0, $i);
      }
    } 
  }
  return @$arr[0];
}

ok(longest_common_prefix(["flower","flow","flight"]) eq 'fl', '["flower","flow","flight"]');
ok(longest_common_prefix(["dog","racecar","car"]) eq '', '["dog","racecar","car"]');
