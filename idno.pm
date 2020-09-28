#!/user/bin/perl
use strict;
package idno;

my $sn = 10000000;

sub generateBySn {
    my $sns = sprintf("%08d", $sn++);

    my $zone = substr(${sns},0,6);
    my $seq = substr(${sns},6,2) . int(rand(9) + 1);
    my $birthday = 1970 + int(rand(40)) . sprintf("%02d",int(rand(11))+1) . int(rand(3)) . int(rand(8)+1);

    my $head = $zone . $birthday . $seq;
    my $idno = $head . &id_cksum($head);

    printf "%s  ",$head;
    return $idno;
}


sub id_cksum {
    my $idno = shift;

    my @weight = (7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
    my @validate = ('1','0','x','9','8','7','6','5','4','3','2');
    my @dights = split "",$idno;
    my $sum = 0;
    my $i = 0;
    for my $digit (@dights) {
        $sum += int($digit) * $weight[$1];
        $i++;
    }

    return $validate[$sum % 11];
}

