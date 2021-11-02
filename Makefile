
.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


#
# ----- END PREAMBLE -----
#


.PHONY: install_tools
install_tools:  ## Install tools needed for project.
	scripts/install_tools

#
# ----- START CHECK TARGETS -----
#

# This target ensures that the pre-commit hook is installed and kept up to date
# if pre-commit updates.
.PHONY: ensure_pre_commit
ensure_pre_commit: .git/hooks/pre-commit install_pre_commit ## Ensure pre-commit is installed
.git/hooks/pre-commit: /usr/local/bin/pre-commit

.PHONY: install_pre_commit
install_pre_commit:  ## Installs pre-commit hooks
	pre-commit install
	pre-commit install-hooks

.PHONY: check_go_version
check_go_version: .check_go_version.stamp ## Check that the correct Golang version is installed
.check_go_version.stamp: scripts/check-go-version
	scripts/check-go-version
	touch .check_go_version.stamp

.PHONY: check_gopath
check_gopath: .check_gopath.stamp ## Check that $GOPATH exists in $PATH
.check_gopath.stamp: scripts/check-gopath
ifndef CIRCLECI
	scripts/check-gopath
else
	@echo "No need to check go path on CircleCI."
endif
	touch .check_gopath.stamp

# ----- END CHECK TARGETS -----
#

#
# ----- START RANDOM TARGETS -----
#

.PHONY: .check_go_version.stamp gofmt
gofmt:  ## Run go fmt over all Go files
	go fmt ./...

.PHONY: pre_commit_all
pre_commit_all: ensure_pre_commit ## Run pre-commit against all files
	pre-commit run --all-files

.PHONY: clean
clean: ## Clean all generated files
	rm -rf ./bin

default: help
