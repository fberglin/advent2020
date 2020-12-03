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

@sets = ( "1,1", "3,1", "5,1", "7,1", "1,2");
@paths = ();
foreach my $pair (@sets) {
    my $x = 0;
    my $y = 0;
    my $clear = 0;
    my $trees = 0;

    ($x_inc, $y_inc) = split(/,/, $pair);
    foreach my $row (@forest) {
        # print join(/:/, @{$row}), ": [$y]->[$x]", ($forest[$y]->[$x]), "\n";
        if ($forest[$y]->[$x] eq "#") {
            $trees++;
        } elsif ($forest[$y]->[$x] eq ".") {
            $clear++;
        } else {
            die "Illegal: ([$y]->[$x]): '$forest[$y]->[$x]'\n";
        }
        $x = ($x + $x_inc) % ($width - 1);
        $y += $y_inc;
        if ($y > scalar(@forest-1)) {
            last;
        }
    }
    print "$x_inc,$y_inc: Clear: $clear, forest: $trees\n";
    push(@paths, $trees);
}

$result = 1;
foreach $term (@paths) {
    $result = $result * $term;
}
print "Result: $result\n";

