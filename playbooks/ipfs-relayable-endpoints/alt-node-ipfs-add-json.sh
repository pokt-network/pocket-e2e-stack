#/usr/bin/env bash

curl -X POST http://localhost:8081/v1/client/relay \
    -H 'Content-Type: application/json' \
    -d '{
        "payload": {
                "data": "{ \"path\": \"./simplefile.txt\" }",
                "method": "POST",
                "path": "/api/v0/add?quiet=true&quieter=true&progress=false&chunker=size-262144&pin=true&hash=sha2-256&inline-limit=32",
                "headers": {
                    "Abspath": "/home/heartbeat/kitchen/pocket/localnet/simplefile.txt",
                    "Content-Disposition": "form-data; name=\"file\"; file=\"simplefile.txt\"",
                    "Content-Type": "application/octet-stream"
                }
        },
        "proof": {
                "blockchain": "0142"
        }
    }' \
    -F file=@simplefile.txt