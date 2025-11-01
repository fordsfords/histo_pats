# histo_pat
Tool to take a series of regular expressions (Perl) and search
an input file.
The tool outputs table of counts indicating the number of input lines
that match each pattern.

Note that if an input line matches more than one of the patterns,
only the first pattern is counted.
This lets you specify more-specific to less-specific patterns.


## Quickstart

This assumes your PATH includes ~/bin and also assumes your system has "wget".
(For Mac users, use "brew install wget".)

````
$ wget -O ~/bin/histo_pat.pl https://github.com/fordsfords/histo_pat/raw/master/histo_pat.pl
$ chmod +x ~/bin/histo_pat.pl
$ histo_pat.pl -p "ford" ~/bin/histo_pat.pl
/ford/, 2
No match lines: 102
````


## Usage

````
$ histo_pat.pl -h
Usage: histo_pat.pl [-h] [-p pattern]... [file ...]
Where:
    -h - help.
    -p 'pattern' - pattern to search. Can be specified any number of times.
    file ... - zero or more input files.  If omitted, inputs from stdin.
````


## License

I want there to be NO barriers to using this code, so I am releasing it to the public domain.  But "public domain" does not have an internationally agreed upon definition, so I use CC0:

This work is dedicated to the public domain under CC0 1.0 Universal:
http://creativecommons.org/publicdomain/zero/1.0/

To the extent possible under law, Steven Ford has waived all copyright
and related or neighboring rights to this work. In other words, you can 
use this code for any purpose without any restrictions.
This work is published from: United States.
Project home: https://github.com/fordsfords/histo_pats
