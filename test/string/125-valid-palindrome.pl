use strict;
use warnings;
use feature qw(say);
use Test::Simple tests => 3;

sub is_palindrome {
	my $str = shift;

	return 1 if length($str) == 0 || length($str) == 1;

	$str =~ s/[^a-zA-Z0-9]//g;
	$str = lc($str);
	return $str eq reverse($str);
}

ok(is_palindrome('A man, a plan, a canal: Panama') == 1, 'test 1');
ok(is_palindrome('race a car') == 0, 'test 2');
ok(is_palindrome(' ') == 1, 'test 3');
