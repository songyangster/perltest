#!/usr/bin/perl -w
#
use strict;
#
use File::Find;
use File::Copy "cp";

@ARGV==2 or die ("Not enough args: @ARGV");
my ($input_dir, $output_dir) = @ARGV;

sub process_file
{
    return 0 if (-d $_);

    cp ($File::Find::name, $output_dir) or print ("Failed to File::Copy cp $File::Find::name to $output_dir\n");
    `cp $File::Find::name $output_dir` or print ("Failed to cp $File::Find::name to $output_dir\n");;
    return 1;
}

find(\&process_file, $input_dir);
