#!/usr/bin/perl

$first = 1;

print "{\n";
print "\t\"data\":[\n\n";

for (`cat /etc/ipsec.conf | grep -C1 conn | sed 's/\#//g' | sed 's/.*=//' | egrep -v 'conn|--' | awk 'NF' | paste -d ' ' - -`)
{
    ($con_name, $con_ip) = m/(\S+) (\S+)/;

    print "\t,\n" if not $first;
    $first = 0;

    print "\t{\n";
    print "\t\t\"{#CONNAME}\":\"$con_name\",\n";
    print "\t\t\"{#CONIP}\":\"$con_ip\"\n";
    print "\t}\n";
}

print "\n\t]\n";
print "}\n";
