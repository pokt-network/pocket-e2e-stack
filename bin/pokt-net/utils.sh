
source_and_export_env() {
  CWD=$(pwd)
  if [[ ! -f "$CWD/.env" ]]; then
    echo "No .env file was found"
    exit 1;
  else
    echo "Found .env, exporting..."
  fi

  source .env
  export CWD=$CWD
  export POCKET_CORE_REPOS_PATH=$POCKET_CORE_REPOS_PATH
  export POCKET_CORE_REPO_PATH=$POCKET_CORE_REPO_PATH
  export POCKET_NETWORK_TENDERMINT_PATH=$POCKET_NETWORK_TENDERMINT_PATH
  export POCKET_E2E_STACK_PATH=$POCKET_E2E_STACK_PATH
  export DEBUG=$DEBUG
}

function check_env_var() {
  local env_value="${!1}"
  if [ -z "${env_value}" ]; then
    echo "${1} is not set"
    exit 1
  fi
}

function quiet_check_env_var() {
  local env_value="${!1}"
  if [ -z "${env_value}" ]; then
    echo "${1} is not set"
    return 1
  fi
}

function check_required_env_vars() {
  check_env_var "CWD"
  check_env_var "POCKET_CORE_REPOS_PATH"
  check_env_var "POCKET_CORE_REPO_PATH"
  check_env_var "POCKET_NETWORK_TENDERMINT_PATH"
  check_env_var "POCKET_E2E_STACK_PATH"
}

# TODO(olshansky): this is a bit hacky so consider refactoring.
function update_chains_json() {
  if [[ ! -z ${ETH_ALTRUIST} && ! -z ${POLY_ALTRUIST} ]]; then
    echo "ETH_ALTRUIST and POLY_ALTRUIST are set so we are going update chains.json"
    sed "s#http://user:pass@eth.altruist.com#${ETH_ALTRUIST}#g" stacks/pokt-net/shared/chains.template.json > stacks/pokt-net/shared/chains.local.json
    sed -i '' "s#http://user:pass@poly.altruist.com#${POLY_ALTRUIST}#g" stacks/pokt-net/shared/chains.local.json
  else
    echo "ETH_ALTRUIST and POLY_ALTRUIST are not set so we are not going update chains.json"
    cp stacks/pokt-net/shared/chains.template.json > stacks/pokt-net/shared/chains.local.json
  fi
}

function check_docker() {
  if ! docker info > /dev/null 2>&1; then
    echo "Docker is not installed or running. Going to try and start it..."
    open /Applications/Docker.app
    sleep 3
    while (! docker stats --no-stream ); do
      echo "Waiting for Docker to launch..."
      sleep 3
    done
  fi

  swarm_status="$(docker info --format '{{.Swarm.LocalNodeState}}')"
  if [ "$swarm_status" != "active" ]; then
    echo "Docker not in swarm mode. Going to try and initialize it..."
    docker swarm init > /dev/null 2>&1
  fi
}

