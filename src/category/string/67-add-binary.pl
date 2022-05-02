use strict;
use warnings;
use feature qw(say);
use POSIX qw(floor);
use Test::Simple tests => 2;

################################################################################
# Question 67. Add Binary
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/add-binary/
#
# Given two binary strings a and b, return their sum as a binary string.
# 
# Example 1:
# Input: a = "11", b = "1"
# Output: "100"
#
# Example 2:
# Input: a = "1010", b = "1011"
# Output: "10101"
#
# Parameters
# @param {string} a
# @param {string} b
# @return {string}
################################################################################
sub add_binary {
  my ($a, $b) = @_;
  my ($i, $j) = (length($a) - 1, length($b) - 1);
  my ($res, $carry) = ('', 0);

  while ($i >= 0 || $j >= 0 || $carry) {
    my $sum = ($i >= 0 ? substr($a, $i--, 1) + 0 : 0) + ($j >= 0 ? substr($b, $j--, 1) + 0 : 0) + $carry;
    $res = $sum % 2 . "" . $res;
    $carry = floor($sum / 2);
  }
  return $res;
}

ok(add_binary('11', '1') eq '100', 'test 1');
ok(add_binary('1010', '1011') eq '10101', 'test 2');
