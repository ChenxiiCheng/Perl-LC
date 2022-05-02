use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 3;

#####################################
# Question 13. Roman to Integer
# 🔥 Difficulty: Easy
# 👉 https://leetcode.com/problems/roman-to-integer/
#
# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# 
# Example 1:
# Input: s = "III"
# Output: 3
# Explanation: III = 3.
# 
# Example 2:
# Input: s = "LVIII"
# Output: 58
# Explanation: L = 50, V= 5, III = 3.
#
# Example 3:
# Input: s = "CD"
# Output: 400
# Explanation: CD = 400.
#
# Parameters
# @param {string} s
# @return {number}
######################################
sub roman_to_int {
  my $s = shift;
  my $sum = 0;
  my %roman_map = (
    I => 1,
    V => 5,
    X => 10,
    L => 50,
    C => 100,
    D => 500,
    M => 1000
  );

  foreach my $i (0..length($s) - 1) {
    my $curr = substr($s, $i, 1);
    my $next = substr($s, $i + 1, 1);
    if ($next && $roman_map{$curr} < $roman_map{$next}) {
      $sum -= $roman_map{$curr};
    } else {
      $sum += $roman_map{$curr};
    }
  }
  return $sum;
}

# Tests
ok(roman_to_int("III") == 3, 'III');
ok(roman_to_int("LVIII") == 58, 'LVIII');
ok(roman_to_int("CD") == 400, 'CD');
