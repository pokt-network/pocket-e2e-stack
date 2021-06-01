#!/usr/bin/expect

set ppkfilepath $argv; # Grab the first command line parameter
set timeout -1

log_user 1;

spawn sh -c "mkdir -p /home/app/.pocket/config"
spawn sh -c "cp /tmp/*.json /home/app/.pocket/config/"
spawn sh -c "echo $ppkfilepath"
# spawn sh -c "pocket accounts import-armored $ppkfilepath"
spawn sh -c "pocket accounts import-raw $env(POCKET_CORE_KEY)"
sleep 2

send -- "$env(POCKET_CORE_PASSPHRASE)\n"
send -- "$env(POCKET_CORE_PASSPHRASE)\n"

expect eof

spawn sh -c "echo \"done with import raw\"";

# spawn sh -c "pocket accounts set-validator `pocket accounts list | cut -d' ' -f2- `"
spawn sh -c "pocket accounts set-validator $env(POCKET_CORE_ACCOUNT_ADDRESS)"
sleep 5
send -- "$env(POCKET_CORE_PASSPHRASE)\n"
expect eof
spawn sh -c "echo 'pocket core seeds: '$env(POCKET_CORE_SEEDS)'"
spawn sh -c "echo \"done with set-validator\""
