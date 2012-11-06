#!/usr/bin/perl
binmode STDOUT, ":utf8";
use utf8;
use MP3::Tag; # import module
   
   @files = <*.mp3>; # find MP3 files in current directory
   
   # loop over file list
   # print tag information
   foreach (@files) {
   $mp3 = MP3::Tag->new($_);
   
   $mp3->get_tags;
      	$Artist = $mp3->{ID3v2}->get_frame("TPE1");
	$TTitle = $mp3->{ID3v2}->get_frame("TIT2");
	$TTitle =~ s/ÿþ//g;
	$TTitle =~ s/\ \/\ //g;
	$Artist =~ s/ÿþ//g;
	$Artist =~ s/\ \/\ //g;
	chomp ($Artist);
	($A1,$A2,$A3)=split(/-/,$Artist);
	$A1 =~ s/^\ //;
	$A2 =~ s/^\ //;
	$A3 =~ s/^\ //;
	print "$A1" . "\n" . "$A2" . "\n" . "$A3" . "\n" . "$TTitle" . "\n"  ;	
	print "$Artist" . "\n" . "\n";;
	# $mp3->{ID3v2}->change_frame("TPE1","$A2");
	#$mp3->{ID3v2}->add_frame("TALB","$TTitle" . " " . "$A3");
	#$mp3->{ID3v2}->change_frame("TIT2","$A1" . " " . "$TTitle");
	#$mp3->{ID3v2}->write_tag();
   $mp3->close();
   }


