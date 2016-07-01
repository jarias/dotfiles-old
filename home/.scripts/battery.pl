#!/usr/bin/perl
#
# Copyright 2014 Pierre Mavro <deimos@deimos.fr>
# Copyright 2014 Vivien Didelot <vivien@didelot.org>
#
# Licensed under the terms of the GNU GPL v3, or any later version.
#
# This script is meant to use with i3blocks. It parses the output of the "acpi"
# command (often provided by a package of the same name) to read the status of
# the battery, and eventually its remaining time (to full charge or discharge).
#
# The color will gradually change for a percentage below 85%, and the urgency
# (exit code 33) is set if there is less that 5% remaining.

use strict;
use warnings;
use utf8;

my $acpi;
my $status;
my $percent;
my $full_text;
my $short_text;
my $bat_number = $ENV{BLOCK_INSTANCE} || 0;
my $bg_color;

# read the first line of the "acpi" command output
open (ACPI, "acpi -b | grep 'Battery $bat_number' |") or die;
$acpi = <ACPI>;
close(ACPI);

# fail on unexpected output
if ($acpi !~ /: (\w+), (\d+)%/) {
  die "$acpi\n";
}

$status = $1;
$percent = $2;
$full_text = "$percent%";

if ($status eq 'Discharging') {
  $full_text .= ' ';
} elsif ($status eq 'Charging') {
  $full_text .= ' ';
}

$short_text = $full_text;

# consider color and urgent flag only on discharge

if ($percent < 20) {
  $bg_color = "#FF0000";
  $full_text .= ' ';
} elsif ($percent < 40) {
  $bg_color = "#FFAE00";
  $full_text .= ' ';
} elsif ($percent < 60) {
  $bg_color = "#FFF600";
  $full_text .= ' ';
} elsif ($percent < 85) {
  $bg_color = "#55d400";
  $full_text .= ' ';
} elsif ($percent <= 100) {
  $bg_color = "#55d400";
  $full_text .= ' ';
}

if ($percent < 5) {
  exit(33);
}

# print text
print "<span background=\"$bg_color\" foreground=\"#303030\"> $full_text </span>\n";


exit(0);
