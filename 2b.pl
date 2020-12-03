#!/usr/bin/perl


open($fh, "< 2.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

<<EOF
@input = (
    "1-3 a: abcde",
    "1-3 b: cdefg",
    "2-9 c: ccccccccc"
);
EOF
;

$valid = 0;
foreach $line (@input) {
    if ($line =~ m/(\d+)-(\d+) (\w): (\w+)/) {
        $i = 0;
        $validPositions = 0;
        $min = $1;
        $max = $2;
        $char = $3;
        $pass = $4;
        @chars = split(//, $pass);
        for $pos (1 ... @chars) {
            if ($char ne $chars[$pos-1]) {
                next;
            }
            if ($pos == $min) {
                $validPositions++;
            }
            if ($pos == $max) {
                $validPositions++;
            }
        }
        if ($validPositions == 1) {
            $valid++;
        }
    }
}

print "Valid: $valid\n";

