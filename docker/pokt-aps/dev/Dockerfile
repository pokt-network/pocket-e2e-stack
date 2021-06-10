# Check out https://hub.docker.com/_/node to select a new base image
FROM node:12.15-slim

ENV PATH="$PATH:/usr/src/pocketjs/node_modules/.bin/"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

RUN mkdir -p /usr/src/pocketjs

WORKDIR /usr/src/pocketjs

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
RUN npm install --save tsnodemon

COPY . .

CMD /bin/bash -c "./node_modules/.bin/tsnodemon -x '/usr/bin/docker restart pokt-fdt-gw'"
