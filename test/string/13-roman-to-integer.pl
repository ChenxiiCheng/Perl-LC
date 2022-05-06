use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 4;

# @param {string} s
# @return {number}
sub romain_to_integer {
	my $s = shift;
	my %roman_map = (
		I => 1,
		V => 5,
		X => 10,
		L => 50,
		C => 100,
		D => 500,
		M => 1000,
	);
	my $sum = 0;

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

ok(romain_to_integer('III') == 3, 'III');
ok(romain_to_integer('CD') == 400, 'CD');
ok(romain_to_integer('LVIII') == 58, 'LVIII');
ok(romain_to_integer('MCMXCIV') == 1994, 'MCMXCIV');
