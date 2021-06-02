#!/usr/bin/expect

set ppkfilepath $argv; # Grab the first command line parameter
set timeout -1

log_user 1;

spawn sh -c "mkdir -p /home/app/.pocket/config"
spawn sh -c "cp /tmp/*.json /home/app/.pocket/config/"
spawn sh -c "echo $ppkfilepath"
# spawn sh -c "pocket accounts import-armored $ppkfilepath"

spawn pocket accounts import-raw $env(POCKET_CORE_KEY)
sleep 1
# send -- "$env(POCKET_CORE_PASSPHRASE)\n"
send -- "yo\n"
expect eof

spawn sh -c "echo \"done with import raw\"";

# spawn sh -c "pocket accounts set-validator `pocket accounts list | cut -d' ' -f2- `"
spawn pocket accounts set-validator $env(POCKET_CORE_ACCOUNT_ADDRESS)
send -- "yo\n"
send -- "yo\n"
# send -- "$env(POCKET_CORE_PASSPHRASE)\n"
# send -- "$env(POCKET_CORE_PASSPHRASE)\n"
expect eof
# spawn sh -c "echo \"done with set-validator\""

sleep 1
send -- "yo\n"
send -- "yo\n"
expect eof
exit
