#/usr/bin/env bash

curl -X POST http://localhost:8081/v1/client/relay \
    -H 'Content-Type: application/json' \
    -d '{
        "payload": {
            "data": "{\"args\": {\"file\": \"./simplefile.txt\"}}",
            "method": "POST",
            "path":"/api/v0/add",
            "headers": {
                "Abspath": "/home/heartbeat/kitchen/pocket/localnet/simplefile.txt",
                "Content-Disposition": "form-data; name=\"file\"; file=\"simplefile.txt\"",
                "Content-Type": "application/octet-stream"
            }
        },
        "proof": {
            "blockchain": "0142"
        }
    }'


curl \
    -X POST \
    -H 'Blockchain-Subdomain: ipfs' \
    -F file=./simplefile.txt "http://localhost:3000/v1/607d9f3064c40bc97ff5cb81/api/v0/add?quiet=true&quieter=true&progress=false&chunker=size-262144&pin=true&hash=sha2-256&inline-limit=32"

curl -X POST http://localhost:8081/v1/client/relay \
    -H 'Content-Type: application/json' \
    -d '{
        "payload": {
            "method": "POST",
            "path":"api/v0/ls?arg=/ipfs/Qmexhq2sBHnXQbvyP2GfUdbnY7HCagH2Mw5vUNSBn2nxip",
            "headers": {}
        },
        "proof": {
            "blockchain": "0142"
        }
    }'

curl \
    -H 'Content-Type: application/json' \
    -H 'Blockchain-Subdomain: ipfs' \
    -H 'Origin: Moonbase' \
    -d '{}' \
    -X POST http://localhost:3000/v1/607d9f3064c40bc97ff5cb81/api/v0/ls?arg=/ipfs/Qmexhq2sBHnXQbvyP2GfUdbnY7HCagH2Mw5vUNSBn2nxip