GATEWAY_REPO_PATH ?= ENV_VAR_GATEWAY_REPO_PATH_NOT_PROVIDED
CWD ?= ENV_VAR_CWD_NOT_PROVIDED
POCKETJS_REPO_PATH ?= ENV_VAR_POCKETJS_REPO_PATH_NOT_PROVIDED
POCKET_CORE_REPO_PATH ?= ENV_VAR_POCKET_CORE_REPO_PATH_NOT_PROVIDED

# pocket network stack
# Using dockerhub production image
up-pokt-net-prod:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/up-net-prod.sh
down-pokt-net-prod:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/down-net-prod.sh

# Using locally built dev image
up-pokt-net-dev:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/up-net-dev.sh
down-pokt-net-dev:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/down-net-dev.sh


# pocket foundation stack
up-pokt-fdt:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) sh ./scripts/up-fdt.sh
down-pokt-fdt:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) sh ./scripts/down-fdt.sh

# pocket foundation stack
up-pokt-aps:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) sh ./scripts/up-aps.sh
down-pokt-aps:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) sh ./scripts/down-aps.sh

# pocket app solutions + pocket foundation + pocket network stack
# Spin up all in prod
up-pokt-all-prod:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/up-all-prod.sh
down-pokt-all-prod:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/down-all-prod.sh

# Spin up all in dev
up-pokt-all-dev:
	POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/up-all-dev.sh
down-pokt-all-dev:
	POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/down-all-dev.sh

config-pokt-all:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/config-all.sh
