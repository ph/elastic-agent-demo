SHELL=/usr/bin/env bash
VERSION?=8.1.2
URL?="https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-${VERSION}-linux-x86_64.tar.gz"
BASE_ARTIFACT=${shell basename ${URL}}

.PHONY: help
help: ## - Show help message
	@printf "${CMD_COLOR_ON} usage: make [target]\n\n${CMD_COLOR_OFF}"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | sed -e "s/^Makefile://" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: vm
vm: ## - Start a Linux VM
	@vagrant up ubuntu2004

.PHONY: download
download: ## - Download Elastic Agent
	@printf "${CMD_COLOR_ON} Retrieve elastic-agent ${BASE_ARTIFACT}\n${CMD_COLOR_OFF}"
	@rm -rf data/
	@mkdir -p data
	@wget ${URL} -O data/${BASE_ARTIFACT}

.PHONY: demo
demo: ## - Start the Elastic Agent demo
	@printf "${CMD_COLOR_ON} Start Elastic Agent demo on linux\n${CMD_COLOR_OFF}"
	@$(MAKE) download
	@$(MAKE) vm
