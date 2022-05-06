use strict;
use warnings;
use POSIX qw(floor);
use Test::Simple tests => 2;

sub add_binary {
	my ($a, $b) = @_;
	my $i = length($a) - 1 || 0;
	my $j = length($b) - 1 || 0;
	my $carry = 0;
	my $res = '';

	while ($i >= 0 || $j >= 0 || $carry) {
		my $sum = ($i >= 0 ? substr($a, $i--, 1) + 0 : 0) + ($j >= 0 ? substr($b, $j--, 1) + 0 : 0) + $carry;
		$res = $sum % 2 . '' . $res;
		$carry = floor($sum / 2);
	}
	return $res;
}

ok(add_binary('11', '1') eq '100', 'test 1');
ok(add_binary('1010', '1011') eq '10101', 'test 2');
