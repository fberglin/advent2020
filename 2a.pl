#!/usr/bin/perl


open($fh, "< 2.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

$valid = 0;
foreach $line (@input) {
    if ($line =~ m/(\d+)-(\d+) (\w): (\w+)/) {
        $i = 0;
        $min = $1;
        $max = $2;
        $char = $3;
        $pass = $4;
        while ($pass =~ m/$char/g) {
            $i++;
        }
        if ($i >= $min and $i <= $max) {
            $valid++;
        }
    }
}

print "Valid: $valid\n";

