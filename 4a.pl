#!/usr/bin/perl

use Data::Dumper;

open($fh, "< 4.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

<<EOF
@input = (
    "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd",
    "byr:1937 iyr:2017 cid:147 hgt:183cm",
    "",
    "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884",
    "hcl:#cfa07d byr:1929",
    "",
    "hcl:#ae17e1 iyr:2013",
    "eyr:2024",
    "ecl:brn pid:760753108 byr:1931",
    "hgt:179cm",
    "",
    "hcl:#cfa07d eyr:2025 pid:166559648",
    "iyr:2011 ecl:brn hgt:59in",
);
EOF
;

%record = ();
$valid = 0;
foreach $line (@input) {
    # print $line, "\n";
    chomp($line);
    if (length($line) == 0) {
        if (scalar(keys(%record)) == 8) {
            $valid++;
        } elsif (scalar(keys(%record)) == 7 and not defined($record{"cid"})) {
            $valid++;
        }
        %record = ();
        next;
    }
    while ($line =~ m/(\w+):([\w\d#]+)/g) {
        $record{$1} = $2;
    }
}

# print Dumper(%record);

print "Valid: $valid\n";

