#!/usr/bin/env bash

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