#!/usr/bin/perl


open($fh, "< 1.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

foreach $first (@input) {
    foreach $second (@input) {
        foreach $third (@input) {
            if ($first + $second + $third == 2020) {
                print $first * $second * $third, "\n";
                exit;
            }
        }
    }
}

