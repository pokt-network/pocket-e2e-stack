#/usr/bin/env bash

curl \
    -X POST \
    -H 'Blockchain-Subdomain: ipfs' \
    -F file=@myfile "http://localhost:3000/v1/60676c9f7cbbfe002f0b9cbe/api/v0/add?quiet=true&quieter=true&progress=false&chunker=size-262144&pin=true&hash=sha2-256&inline-limit=32"
