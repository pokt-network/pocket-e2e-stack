# Prepares a dockerfile to run a pocket node whose source code will be mounted
# from the host for local development and hot reloading.

# Dynamically pull Go-lang version for the image
ARG GOLANG_IMAGE_VERSION=golang:1.18.2-alpine

# First build step to build the app binary
FROM ${GOLANG_IMAGE_VERSION} AS builder

ARG POCKET_E2E_STACK_RELATIVE_PATH
ARG POCKET_CORE_REPO_RELATIVE_PATH
ARG POCKET_NETWORK_TENDERMINT_RELATIVE_PATH

# Install dependencies
RUN apk -v --update --no-cache add \
	curl \
	git \
	groff \
	less \
	mailcap \
	gcc \
	libc-dev \
	bash  \
	leveldb-dev && \
	rm /var/cache/apk/* || true

# Environment and system dependencies setup
ENV POCKET_ROOT=/go/src/github.com/pokt-network
ENV POCKET_PATH=${POCKET_ROOT}/pocket-core
ENV TENDERMINT_PATH=${POCKET_ROOT}/tendermint
ENV GO111MODULE="on"
ENV EXECCOMMAND="start --keybase=false --datadir=/home/app/.pocket"
ENV POCKET_CORE_SEEDS="notparsed"
ENV POCKET_CORE_KEY="nokeyisparsed"
ENV POCKET_CORE_ACCOUNT_ADDRESS="noaddressisparsed"

# Create directories for the source code.
RUN mkdir -p ${POCKET_ROOT}
RUN mkdir -p ${POCKET_PATH}
RUN mkdir -p ${TENDERMINT_PATH}
WORKDIR $POCKET_ROOT

# Copy the source code from the host.
COPY ${POCKET_CORE_REPO_RELATIVE_PATH} ${POCKET_PATH}
COPY ${POCKET_NETWORK_TENDERMINT_RELATIVE_PATH} ${TENDERMINT_PATH}

# Copying deps and hot reloading/watch script
COPY ${POCKET_E2E_STACK_RELATIVE_PATH}/watch.sh ./
COPY ${POCKET_E2E_STACK_RELATIVE_PATH}/prepare-tendermint.sh ./
COPY ${POCKET_E2E_STACK_RELATIVE_PATH}/entrypoint-dev.sh /home/app/entrypoint.sh
COPY ${POCKET_E2E_STACK_RELATIVE_PATH}/command.sh /home/app/command.sh
COPY ${POCKET_E2E_STACK_RELATIVE_PATH}/local_command_dev.sh /home/app/local_command_dev.sh

RUN apk add --update --no-cache expect bash leveldb-dev
RUN addgroup -S app \
	&& adduser -S -G app app
RUN mkdir -p /home/app/.pocket/config
RUN chown -R app /home/app/.pocket
RUN chown -R app /go

# Overwrite go.mod files for local development
RUN sed -i 's|^replace github.com/tendermint/tendermint => .*$|replace github.com/tendermint/tendermint => '$TENDERMINT_PATH'|' $TENDERMINT_PATH/go.mod
RUN cp $TENDERMINT_PATH/go.mod $POCKET_ROOT/go.mod.tendermint

RUN sed -i 's|^replace github.com/tendermint/tendermint => .*$|replace github.com/tendermint/tendermint => '$TENDERMINT_PATH'|' $POCKET_PATH/go.mod
RUN cp $POCKET_PATH/go.mod $POCKET_ROOT/go.mod.core

# Clear vendor directory to reset the previous run
RUN rm -rf $TENDERMINT_PATH/vendor
RUN rm -rf $POCKET_PATH/vendor

# Build main binaries using the mainline dependencies.
RUN cd ${TENDERMINT_PATH} \
	&& go build -o ${GOPATH}/bin/tendermint cmd/tendermint/main.go
RUN cd ${POCKET_PATH} \
	&& go build -tags cleveldb -o ${GOPATH}/bin/pocket app/cmd/pocket_core/main.go

# Install reflex and dlv
RUN go install github.com/cespare/reflex@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

ENTRYPOINT ["/home/app/entrypoint.sh"]
