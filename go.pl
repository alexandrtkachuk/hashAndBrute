#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: go.pl
#
#        USAGE: ./go.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 31.08.2015 16:02:54
#     REVISION: ---
#===============================================================================

use strict;
use warnings;
use utf8;


use Digest::MD5 qw(md5 md5_hex md5_base64) ;
use Data::Dumper;

my ($fileName) = 'test';
my  $hf;
#my (@list) = (0..9); # lowercase letters
#my (@list) = ('a'..'z'); # lowercase letters
#my (@list) = ('A' .. 'Z');
#my (@list) = (0..9,'a'..'z');
my (@list) = (0..9,'a'..'z', 'A' .. 'Z'); # lowercase letters

my($hash) = 'b1cef953fdf6629427046cea8c36d902';

my ($timeStart);
	($timeStart) = time;

#my ($str);

#open( my $hf, '>'.time.'.txt') or die $!;
	
	

sub combinations {
	my ($recursions, @letters) = @_; # unpack the arguments
	if ($recursions == 0) {
		#print  @letters, "\n"; # print the letters, append newline
		#my $str .=  join("", @letters) .  "\n";
		#print  $hf $str;# пишим в файл
		#`echo @letters  >> $fileName`;

		if(md5_hex(join("", @letters)) eq $hash )
		{
			print 'key:',@letters, "\n";

			print "\n",'time:', time - $timeStart, "\n";
			die();
		}

	} else {
		# do a loop
		$recursions--; # reduce level
		for my $letter (@list) {
			combinations($recursions, @letters, $letter);
		}
	}
}




sub doFile
{
	my ($count) = @_;

	open(  $hf, '>' . $count . '--' . time . '.txt') or die $!;

	sub doFileHelp {
		my ($recursions, @letters) = @_; # unpack the arguments
		if ($recursions == 0) {

			my $str .=  join("", @letters) .  "\n";
			print  $hf $str;# пишим в файл	

		} else {
			# do a loop
			$recursions--; # reduce level
			for my $letter (@list) {
				doFileHelp($recursions, @letters, $letter);
			}
		}
	}
	

	doFileHelp($count);

	close($hf) or die("Ошибка при закрытии файла: $!\n");
}


sub search2hash
{
	
	my $i;

	combinations($_) foreach (1 .. 6);

	return 1;
}



sub main
{

	#search2hash();
	my $i;

	#doFile($_) foreach (1 .. 4);
	
	doFile(5);
	print "\n",'time:', time - $timeStart, "\n";

	return 1;
}

main();

#
