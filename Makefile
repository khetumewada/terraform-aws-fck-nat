all: check

.PHONY: check
check:
	terraform init -backend=false && terraform validate