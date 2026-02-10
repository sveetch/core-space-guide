DOCS_PATH=docs
SPHINX_BUILDPATH=$(DOCS_PATH)/_build
DISTRIBUTED_PATH=dist

# Paths for the audit itself
PYTHON_INTERPRETER=python3
VENV_PATH=.venv
VENV_BIN=$(VENV_PATH)/bin

PYTHON_BIN=$(VENV_BIN)/python
PIP_BIN=$(VENV_BIN)/pip
FLAKE=$(VENV_BIN)/flake8
SPHINX_RELOAD=$(PYTHON_BIN) $(DOCS_PATH)/livedoc.py

# Formatting variables, FORMATRESET is always to be used last to close formatting
FORMATBLUE:=$(shell tput setab 4)
FORMATBOLD:=$(shell tput bold)
FORMATRESET:=$(shell tput sgr0)

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo
	@echo "  clean                          -- to clean EVERYTHING (Warning)"
	@echo "  clean-pycache                  -- to remove all __pycache__, this is recursive from current directory"
	@echo "  clean-install                  -- to clean Python side installation"
	@echo "  clean-build                    -- to remove documentation builds"
	@echo
	@echo "  install                        -- to install this project with virtualenv and Pip"
	@echo
	@echo "  html                           -- to build HTML documentation"
	@echo "  pdf                            -- to build PDF documentation"
	@echo
	@echo "  livedoc                        -- to run livereload server to rebuild HTML documentation on source changes"
	@echo
	@echo "  release                        -- to release current build into Github pages directory"
	@echo

clean-pycache:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning Python cache <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf .pytest_cache
	find . -type d -name "__pycache__"|xargs rm -Rf
	find . -name "*\.pyc"|xargs rm -f
.PHONY: clean-pycache

clean-build:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning builds <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf $(SPHINX_BUILDPATH)
.PHONY: clean-build

clean-install:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Cleaning install <---$(FORMATRESET)\n"
	@echo ""
	rm -Rf $(VENV_PATH)
.PHONY: clean-install

clean: clean-install clean-build clean-pycache
.PHONY: clean

venv:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Installing virtual environment <---$(FORMATRESET)\n"
	@echo ""
	virtualenv -p $(PYTHON_INTERPRETER) $(VENV_PATH)
.PHONY: venv

install: venv
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Installing requirements <---$(FORMATRESET)\n"
	@echo ""
	$(PIP_BIN) install -r requirements.txt
.PHONY: install

html:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building HTML documentation <---$(FORMATRESET)\n"
	@echo ""
	cd $(DOCS_PATH) && make html
.PHONY: html

pdf:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Building PDF documentation <---$(FORMATRESET)\n"
	@echo ""
	cd $(DOCS_PATH) && make rinohpdf
.PHONY: pdf

livedoc:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Watching sources <---$(FORMATRESET)\n"
	@echo ""
	$(SPHINX_RELOAD)
.PHONY: livedoc

release:
	@echo ""
	@printf "$(FORMATBLUE)$(FORMATBOLD)---> Release into Github pages directory <---$(FORMATRESET)\n"
	@echo ""
	mkdir -p $(DISTRIBUTED_PATH)
	rm -Rf $(DISTRIBUTED_PATH)/html
	cp -r $(SPHINX_BUILDPATH)/html $(DISTRIBUTED_PATH)/
.PHONY: livedoc
