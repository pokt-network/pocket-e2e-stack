#!/usr/bin/env bash

curl -v \
    -H 'Content-Type: application/json' \
    -H 'Blockchain-Subdomain: ipfs' \
    -H 'Origin: Moonbase' \
    -X POST http://127.0.0.1:3000/v1/607d9f3064c40bc97ff5cb81/api/v0/ls\
    -d '{ "arg": "/ipfs/Qmexhq2sBHnXQbvyP2GfUdbnY7HCagH2Mw5vUNSBn2nxip" }'

# curl -X POST "http://127.0.0.1:5001/api/v0/ls?arg=/ipfs/Qmexhq2sBHnXQbvyP2GfUdbnY7HCagH2Mw5vUNSBn2nxip"
