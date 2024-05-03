#!/usr/bin/perl

# i wrote this perl script solely by copying from chatgpt
# "Write once, read never" the memes were right.

use strict;
use warnings;

use JSON;

if (@ARGV < 1) {
    die "Usage: ./sendemail.pl <Hourly sync log file>"
}

# argument parsing
my $hsl = $ARGV[0];

unless (-e $hsl) {
    die "Specified hourly sync log file does not exist"
}

# get date time
my ($second, $minute, $hour, $monthday, $month, $year) = localtime();
$year += 1900;
$month += 1;
my $datetime = sprintf("%d-%02d-%02d %02d:%02d:%02d", $year, $month, $monthday, $hour, $minute, $second);

# read creds
my $creds_text = do {
    open(my $json_fh, "<", "./credentials.json")
        or die("Can't open credentials file: $!");
    local $/;
    <$json_fh>
};

# decode
my $creds;
eval {
    $creds = decode_json($creds_text);
};

if ($@) {
    die "Error decoding credentials file: $@";
}

# get the values
my $from_who = $creds->{"from-who"};
my $to_who = $creds->{"to-who"};
my $smtp = $creds->{"smtp"};
my $username = $creds->{"username"};
my $password = $creds->{"password"};

# email topic
my $topic = "Hourly sync log at $datetime";

# get the username
my $user_username = $ENV{"USER"} || $ENV{"LOGNAME"} || "whatever your name is";

# read hsl
my $hsl_text = do {
    open(my $hsl_fh, "<", $hsl)
        or die("Can't open hourly sync log file: $!");
    local $/;
    <$hsl_fh>
};

# create email text
my $email_text = <<"EMAILTEXTDONERIGHTNOW";
Dear $user_username, a hourly sync log has happened at $datetime.

$hsl_text

======================

Sincerely,
    sendemail.pl
EMAILTEXTDONERIGHTNOW

print "Sending email now!"
