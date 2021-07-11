#!/usr/bin/env perl
# histo_pat.pl - Count lines matching patterns.
# For documentation, see https://github.com/fordsfords/histo_pat
#
# This code and its documentation is Copyright 2002-2021 Steven Ford
# and licensed "public domain" style under Creative Commons "CC0":
#   http://creativecommons.org/publicdomain/zero/1.0/
# To the extent possible under law, the contributors to this project have
# waived all copyright and related or neighboring rights to this work.
# In other words, you can use this code for any purpose without any
# restrictions.  This work is published from: United States.  The project home
# is https://github.com/fordsfords/histo_pat

use strict;
use warnings;
use Getopt::Long;
use File::Basename;

# globals
my $tool = basename($0);
my $usage_str = "$tool [-h] [-p pattern] [file ...]";

# Process options.
# use vars qw($opt_h $opt_p);
my ($opt_h, @opt_p);

GetOptions( 'help' => \$opt_h, 'pattern=s' => \@opt_p ) || usage();

if (defined($opt_h)) {
  help();
}

my @histo;
for my $i (0 .. $#opt_p) {
  $histo[$i] = 0;
}
my $no_match = 0;

# Main loop; read each line in each file.
LINE:
while (<>) {
  chomp;  # remove trailing \n

  for my $i (0 .. $#opt_p) {
    if (/$opt_p[$i]/) {
      $histo[$i] ++;
      next LINE;  # skip rest of patterns.
    }
  }
  $no_match ++;

  # do rest of work.
} continue {  # This continue clause makes "$." give line number within file.
  close ARGV if eof;
}

for my $i (0 .. $#opt_p) {
  print "/$opt_p[$i]/, $histo[$i]\n";
}
print "No match lines: $no_match\n";

# All done.
exit(0);


# End of main program, start subroutines.


sub mycroak {
  my ($msg) = @_;

  croak("Error, $ARGV:$., $msg");
}  # mycroak


sub usage {
  my($err_str) = @_;

  if (defined $err_str) {
    print STDERR "$tool: $err_str\n\n";
  }
  print STDERR "Usage: $usage_str\n\n";

  exit(1);
}  # usage


sub help {
  my($err_str) = @_;

  if (defined $err_str) {
    print "$tool: $err_str\n\n";
  }
  print <<__EOF__;
Usage: $usage_str
Where:
    -h - help
    -p 'pattern' - pattern to search. Can be specified any number of times.
    file ... - zero or more input files.  If omitted, inputs from stdin.

__EOF__

  exit(0);
}  # help
