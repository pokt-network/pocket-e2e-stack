#/usr/bin/env bash
/api/v0/version
curl \
    -X POST \
    -H 'Blockchain-Subdomain: ipfs' \
    -F file=./simplefile.txt "http://localhost:3000/v1/607d9f3064c40bc97ff5cb81/api/v0/add?quiet=true&quieter=true&progress=false&chunker=size-262144&pin=true&hash=sha2-256&inline-limit=32"
