## ----------------------------------------------------------------------
## The purpose of this Makefile is to provide a simple and easy to use
## tool for building and installing the required dependencies for the	
## custom Python setup. The Makefile is used to install the following:
## - OpenSSL
## - SQLite
## - Python 3.11
## - Python 3.10
## The Python binaries are linked to the provide OpenSSL and SQLite
## libraries. This allows for highly customized Python installations to
## meet any specific requirements.
## ----------------------------------------------------------------------

help:        ## Show this help.
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

OPENSSL_VERSION="3.1.1"
SQLITE_VERSION="3420000"
PY311_VERSION="3.11.4"
PY310_VERSION="3.10.12"

.ONESHELL: 
.PHONY: pre download extract openssl sqlite python311 python310 chmod

pre:         ## Install pre-requisites
	@dnf -y install perl-IPC-Cmd perl-Pod-Html wget zlib-devel libffi-devel

download:    ## Download source files
	@wget https://www.openssl.org/source/openssl-$(OPENSSL_VERSION).tar.gz
	@wget https://www.sqlite.org/2023/sqlite-autoconf-$(SQLITE_VERSION).tar.gz
	@wget https://www.python.org/ftp/python/$(PY311_VERSION)/Python-$(PY311_VERSION).tgz
	@wget https://www.python.org/ftp/python/$(PY310_VERSION)/Python-$(PY310_VERSION).tgz

extract:     ## Extract source files
	@tar -xvf openssl-$(OPENSSL_VERSION).tar.gz
	@tar -xvf sqlite-autoconf-$(SQLITE_VERSION).tar.gz
	@tar -xvf Python-$(PY311_VERSION).tgz
	@tar -xvf Python-$(PY310_VERSION).tgz

openssl:     ## Install OpenSSL	
	@mkdir -p /eai/ssl
	@chmod +x install-openssl.sh
	@./install-openssl.sh

sqlite:      ## Install SQLite
	@mkdir -p /eai/sqlite
	@chmod +x install-sqlite.sh
	@./install-sqlite.sh

py311:       ## Install Python 3.11
	@mkdir -p /eai/py311
	@chmod +x install-py.sh
	@./install-py.sh $(PY311_VERSION)

py310:       ## Install Python 3.10
	@mkdir -p /eai/py310
	@chmod +x install-py.sh
	@./install-py.sh $(PY310_VERSION)

chmod:       ## Set permissions
	@chmod -R o+rx /eai