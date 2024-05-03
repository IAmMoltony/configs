#!/usr/bin/perl

# i wrote this perl script solely by copying from chatgpt
# "Write once, read never" the memes were right.

use strict;
use warnings;

use JSON;
use Net::SMTP;

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

# get the username
my $user_username = $ENV{"USER"} || $ENV{"LOGNAME"} || "whatever your name is";

# read hsl
my $hsl_text = do {
    open(my $hsl_fh, "<", $hsl)
        or die("Can't open hourly sync log file: $!");
    local $/;
    <$hsl_fh>
};

# email subject
my $subject = "Hourly sync log at $datetime";

# create email text
my $email_text = <<"EMAILTEXTDONERIGHTNOW";
Dear $user_username, a hourly sync log has happened at $datetime.

$hsl_text

======================

Sincerely,
    sendemail.pl
EMAILTEXTDONERIGHTNOW

print "Sending email now!"

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

# assume the port is 25
# TODO put this into the json file
my $smtp_port = 25;

# connec to the server
my $connec = Net::SMTP->new($smtp, Port => $smtp_port, Debug => 1);
die "Failed to connect to $smtp: $!" unless $connec

# authenticaion
$connec->auth($username, $password) or die "Email auth failed: $!";

# set the from and to
$connec->mail($from_who);
$connec->to($to_who);

# start the email
$connec->datasend("From: $from_who\n");
$connec->datasend("To: $to_who\n");
$connec->datasend("Subject: $subject");

# add the email text (body)
$connec->datasend("\n$email_text\n");

# stop the email
$connec->dataend();

# bye bye
$connec->quit;
