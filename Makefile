GATEWAY_REPO_PATH ?= ENV_VAR_GATEWAY_REPO_PATH_NOT_PROVIDED
CWD ?= ENV_VAR_CWD_NOT_PROVIDED
POCKETJS_REPO_PATH ?= ENV_VAR_POCKETJS_REPO_PATH_NOT_PROVIDED
POCKET_CORE_REPO_PATH ?= ENV_VAR_POCKET_CORE_REPO_PATH_NOT_PROVIDED

# pocket network stack
# Using dockerhub production image
pokt-net-prod-config:
	POCKET_RELEASE_TAG=${POCKET_RELEASE_TAG} CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod/config.sh

pokt-net-prod-up:
	POCKET_RELEASE_TAG=${POCKET_RELEASE_TAG} CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod/up.sh
pokt-net-prod-down:
	POCKET_RELEASE_TAG=${POCKET_RELEASE_TAG} CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod/down.sh

# pocket network stack
# Using dockerhub production locally built image
pokt-net-prod-local-config:
	POCKET_CORE_TARGET_VERSION=$(POCKET_CORE_TARGET_VERSION) CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod-local/config.sh
pokt-net-prod-local-up:
	POCKET_CORE_TARGET_VERSION=$(POCKET_CORE_TARGET_VERSION) CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod-local/up.sh
pokt-net-prod-local-down:
	POCKET_CORE_TARGET_VERSION=$(POCKET_CORE_TARGET_VERSION) CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/prod-local/down.sh

# Using locally built dev image
pokt-net-dev-config:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/dev/config.sh

pokt-net-dev-up:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/dev/up.sh
pokt-net-dev-down:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-net/dev/down.sh


# pocket foundation stack
pokt-fdt-prod-config:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/prod/config.sh

pokt-fdt-prod-up:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/prod/up.sh
pokt-fdt-prod-down:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/prod/down.sh

# pocket foundation stack
pokt-fdt-dev-config:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/dev/config.sh

pokt-fdt-dev-up:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/dev/up.sh
pokt-fdt-dev-down:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ${CWD}/stacks/pokt-fdt/dev/down.sh

# pocket foundation stack
pokt-aps-prod-up:
	CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-aps/up.sh
pokt-aps-prod-down:
	CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-aps/down.sh

pokt-aps-dev-up:
	CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-aps/up.sh
pokt-aps-dev-down:
	CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-aps/down.sh


# pocket app solutions + pocket foundation + pocket network stack
# Spin up all in prod
pokt-all-prod-config:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/prod/config.sh

pokt-all-prod-up:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/prod/up.sh
pokt-all-prod-down:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/prod/down.sh

# Spin up all in dev
pokt-all-dev-config:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/dev/config.sh

pokt-all-dev-up:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/dev/up.sh
pokt-all-dev-down:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ${CWD}/stacks/pokt-all/dev/down.sh

