#!/usr/bin/perl

use Data::Dumper;

open($fh, "< 4.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

<<eof
@input = (
    "eyr:1972 cid:100\n",
    "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926\n",
    "\n",
    "iyr:2019\n",
    "hcl:#602927 eyr:1967 hgt:170cm\n",
    "ecl:grn pid:012533040 byr:1946\n",
    "\n",
    "hcl:dab227 iyr:2012\n",
    "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277\n",
    "\n",
    "hgt:59cm ecl:zzz\n",
    "eyr:2038 hcl:74454a iyr:2023\n",
    "pid:3556412378 byr:2007\n",
    "\n",
    "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980\n",
    "hcl:#623a2f\n",
    "\n",
    "eyr:2029 ecl:blu cid:129 byr:1989\n",
    "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm\n",
    "\n",
    "hcl:#888785\n",
    "hgt:164cm byr:2001 iyr:2015 cid:88\n",
    "pid:545766238 ecl:hzl\n",
    "eyr:2022\n",
    "\n",
    "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719\n",
    "\n"
);
eof
;

%record = ();
$valid = 0;

foreach $line (@input) {
    chomp($line);
    if (length($line) == 0) {
        if (scalar(keys(%record)) == 8 or (scalar(keys(%record)) == 7 and not defined($record{"cid"}))) {
            $validRecord = 0;
            if ($record{'byr'} >= 1920 and $record{'byr'} <= 2002) {
                $validRecord++;
            }
            if ($record{'iyr'} >= 2010 and $record{'iyr'} <= 2020) {
                $validRecord++;
            }
            if ($record{'eyr'} >= 2020 and $record{'eyr'} <= 2030) {
                $validRecord++;
            }
            if ($record{'hgt'} =~ m/(\d+)(\w+)/) {
                if ($2 eq "in" and $1 >= 59 and $1 <= 76) {
                    $validRecord++;
                }
                if ($2 eq "cm" and $1 >= 150 and $1 <= 193) {
                    $validRecord++;
                }
            }
            if ($record{'hcl'} =~ m/^#[\dabcdefABCDEF]{6}$/) {
                $validRecord++;
            }
            if ($record{'ecl'} eq "amb" or
                $record{'ecl'} eq "blu" or
                $record{'ecl'} eq "brn" or
                $record{'ecl'} eq "gry" or
                $record{'ecl'} eq "grn" or
                $record{'ecl'} eq "hzl" or
                $record{'ecl'} eq "oth") {
                $validRecord++;
            }
            if ($record{'pid'} =~ m/^\d{9}$/) {
                $validRecord++;
            }
            if ($validRecord == 7) {
                $valid += 1;
            }
        }
        %record = ();
        next;
    }
    while ($line =~ m/(\w+):([\w\d#]+)/g) {
        $record{$1} = $2;
    }
}

print "Valid: $valid\n";

