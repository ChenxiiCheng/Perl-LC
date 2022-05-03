use strict;
use warnings;
use Test::Simple tests => 3;

sub trim {
	my $s = shift;
	$s =~ s/^\s+|\s+$//g;
	return $s;
}

sub length_of_last_word {
	my $str = shift;
	my $trim_str = trim($str);
	my @arr = split(' ', $trim_str);
	return length($arr[-1]) || 0;
}

sub length_of_last_word2 {
	my $str = shift;
	my @arr = split(' ', $str);
	return length($arr[-1]) || 0;
}

ok(length_of_last_word('Hello World') == 5, 'test 1');
ok(length_of_last_word('   fly me   to   the moon  ') == 4, 'test 2');
ok(length_of_last_word('luffy is still joyboy') == 6, 'test 3');

ok(length_of_last_word2('Hello World') == 5, 'test 4');
ok(length_of_last_word2('   fly me   to   the moon  ') == 4, 'test 5');
ok(length_of_last_word2('luffy is still joyboy') == 6, 'test 6');
