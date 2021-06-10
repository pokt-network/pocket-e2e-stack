#!/usr/bin/expect

set timeout -1

if { $env(POCKET_CORE_KEY) eq "" }  {
    spawn pocket start
} else {
    spawn pocket accounts import-raw $env(POCKET_CORE_KEY)
    sleep 1
    send -- "yo\n"
    expect eof
    spawn pocket accounts set-validator $env(POCKET_ADDRESS)
    sleep 1
    send -- "yo\n"
    expect eof
    spawn /bin/bash -c "export POCKET_CORE_SEEDS=$env(POCKET_CORE_SEEDS) && ./watch.sh"
}

sleep 1

send -- "yo\n"

expect eof

exit
