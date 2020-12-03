#!/usr/bin/perl

use Data::Dumper;

open($fh, "< 3.input") || die "Unable to open file: $!\n";
@input = <$fh>;
close($fh);

$width = length($input[0]);
@forest = ();

print "W: $width\n";

foreach $line (@input) {
    chomp($line);
    my @trees = split(//, $line);
    push(@forest, \@trees);
}

# print Dumper(@forest);

my $x = 0;
my $y = 0;

my $clear = 0;
my $trees = 0;

foreach my $row (@forest) {
    print join(/:/, @{$row}), ": [$y]->[$x]", ($forest[$y]->[$x]), "\n";
    if ($forest[$y]->[$x] eq "#") {
        $trees++;
    } elsif ($forest[$y]->[$x] eq ".") {
        $clear++;
    } else {
        die "Illegal: ([$y]->[$x]): '$forest[$y]->[$x]'\n";
    }
    $x = ($x + 3) % ($width - 1);
    $y += 1;
}

print "Clear: $clear, forest: $trees\n";

