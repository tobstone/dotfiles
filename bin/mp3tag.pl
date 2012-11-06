#!/usr/bin/perl
binmode STDOUT, ":utf8";
use utf8;
use MP3::Tag;
   @files = <*.mp3>;
   foreach (@files) {
     $mp3 = MP3::Tag->new($_);
     $mp3->get_tags;
     $Artist = $mp3->{ID3v2}->get_frame("TPE1"); # get performer
     $TTitle = $mp3->{ID3v2}->get_frame("TIT2"); # get title
     $TTitle =~ s/ÿþ//g; #  strip umlaut foo
     $TTitle =~ s/\ \/\ //g; #  strip umlaut foo
     $Artist =~ s/ÿþ//g; #  strip umlaut foo
     $Artist =~ s/\ \/\ //g;#  strip umlaut foo
     chomp ($Artist);
     ($A1,$A2,$A3)=split(/-/,$Artist); # split failed artist kr1.1 - ole nydahl - ort datum 
     $A1 =~ s/^\ //; # erase blanks
     $A2 =~ s/^\ //;
     $A3 =~ s/^\ //;
     $mp3->{ID3v2}->change_frame("TPE1","$A2"); # set performer
     $mp3->{ID3v2}->add_frame("TALB","$TTitle" . " " . "$A3"); # add correct album
     $mp3->{ID3v2}->change_frame("TIT2","$A1" . " " . "$TTitle"); # set right title
     $mp3->{ID3v2}->write_tag(); # write all tags
     $mp3->close();
   }
