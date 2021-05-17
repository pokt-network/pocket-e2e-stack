GATEWAY_REPO_PATH ?= ENV_VAR_GATEWAY_REPO_PATH_NOT_PROVIDED
CWD ?= ENV_VAR_CWD_NOT_PROVIDED
POCKETJS_REPO_PATH ?= ENV_VAR_POCKETJS_REPO_PATH_NOT_PROVIDED
POCKET_CORE_REPO_PATH ?= ENV_VAR_POCKET_CORE_REPO_PATH_NOT_PROVIDED

# pocket network stack
up-pokt-net:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/up-net.sh
down-pokt-net:
	CWD=$(CWD) POCKET_CORE_REPO_PATH=$(POCKET_CORE_REPO_PATH) sh ./scripts/down-net.sh

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
up-pokt-all:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/up-all.sh
down-pokt-all:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/down-all.sh
config-pokt-all:
	GATEWAY_REPO_PATH=$(GATEWAY_REPO_PATH) CWD=$(CWD) POCKETJS_REPO_PATH=$(POCKETJS_REPO_PATH) sh ./scripts/config-all.sh
