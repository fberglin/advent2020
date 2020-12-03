#!/usr/bin/perl


open($fh, "< 1.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

foreach $first (@input) {
    foreach $second (@input) {
        if ($first + $second == 2020) {
            print $first * $second, "\n";
            exit;
        }
    }
}

