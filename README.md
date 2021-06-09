<h1 align="center">Local Development Setup</h1>
<p align="center">
    <img src="https://assets.website-files.com/609e7a6f2ec5c05d866ed6d3/60a7cd2bbdce89ccfbf8ff97_POKT_Logo_S_Color.png" />
</p>
<p align="center">This is a local development setup with all of the pocket tools in development mode to allow for feature development, debugging and higher flexibility when   dealing with the stack.
</p>
</br>
<h1 align="center">User guide</h2>


<h2 align="center">How to use</h2>



### Launching the pocket foundation stack
<br/>


##### 1. Properly configure the gateway

Make sure you are on the `dev/make-use-locally` branch on the gateway repository.

Make sure you follow the proper instructions to replicate the production databse locally (_check the gateway README.md_)****

Afterwards, add a new entry in the "applications" collection in the gateway's database with the values located in `config/mongo-db-app.json`

Then, make sure you add the blockchains you are concerned with to the `Blockchains` collection as you have added them to the chains.json in `config/chains.json` in this project.

##### 2. Bring the pocket foundation stack up


```bash
$ GATEWAY_REPO_PATH=YOUR_LOCAL_GATEWAY_REPO_PATH make up-pokt-fdt 
```

Similarly, bring it down using:
```bash
$ GATEWAY_REPO_PATH=YOUR_LOCAL_GATEWAY_REPO_PATH make down-pokt-fdt 
```

### Launching the pocket network stack

##### 1. Launch the stack in production mode by using the dockerhub official pocket core production image (_currently at RC-0.6.3_)
```bash
$ make up-pokt-net-prod
```

Similarly, bring it down using:
```bash

$ make down-pokt-net-prod 
```
##### 2. Launch the stack in development mode by linking your local repository of pocket-core and building from it and benefiting from hot reload features 

```bash
$ POCKET_CORE_REPO_PATH=_path_to_your_local_version_of_pocket_core_ make up-pokt-net-dev
```
Similarly, bring it down using:
```bash
$ make down-pokt-net-prod 
```

### Launching the pocket app solutions stack

_Incoming_
```

```

```

```

### Launching it all together

> Since we do not want to clutter the SDK with docker specific files, this repo is where you'd find the development docker image for pocketjs, still there are a few things you have to introduce to pocketjs to make it smoothly work:
> 1.  update tsconfig.json to exclude `dist` directory
> 2. create a `.dockerignore` file in pocketjs directory and ignore `./node_modules` and `./dist` directories

_pocket app solutions stack (_pocket-js_) + pocket foundation stack (_gateway + dependencies_) + pocket network stack (_a localnet pocket-core fullnode_)_

##### 1. Develping against a dockerhub production image of pocket-core

```bash
$ GATEWAY_REPO_PATH=GW_PATH CWD=_LOCALNET_REPO_PATH POCKETJS_REPO_PATH=POCKETJS_REPO_PATH make up-pokt-all-prod
```

Similarly, bring it down using:
```bash
$ GATEWAY_REPO_PATH=GW_PATH \ 
  CWD=_LOCALNET_REPO_PATH \
  POCKETJS_REPO_PATH=POCKETJS_REPO_PATH \
  make down-pokt-all-prod
```

##### 2. Developing against a local version of pocket-core with hot reload
```bash
$ POCKET_CORE_REPO_PATH=_LOCAL_POCKET_CORE_REPO_PATH_ \
  GATEWAY_REPO_PATH=GW_PATH \
  CWD=_LOCALNET_REPO_PATH \ 
  POCKETJS_REPO_PATH=POCKETJS_REPO_PATH \
  make up-pokt-all-dev
```

Similarly, bring it down using:
```bash
$ POCKET_CORE_REPO_PATH=_LOCAL_POCKET_CORE_REPO_PATH_ \
  GATEWAY_REPO_PATH=GW_PATH \
  CWD=_LOCALNET_REPO_PATH \
  POCKETJS_REPO_PATH=POCKETJS_REPO_PATH \
  make down-pokt-all-dev
```

### Configure new accounts

_incoming_
```
```

### How to contribute

_incoming_
