#!/bin/bash
PY_VERSION=$1
PREFIX=/eai/py`echo ${PY_VERSION} | cut -d '.' -f1-2 | sed 's/\.//g'`
echo "Installing Python ${PY_VERSION} at ${PREFIX}"
cd ./Python-${PY_VERSION}
CFLAGS="-I/eai/ssl/include/" CPPFLAGS="-I/eai/sqlite/include" LDFLAGS="-L/eai/ssl/lib64 -L/eai/sqlite/lib -Wl,-rpath=/eai/ssl/lib64 -Wl,-rpath=/eai/sqlite/lib" ./configure --prefix=${PREFIX} --with-openssl=/eai/ssl --with-openssl-rpath=auto --enable-optimizations
make
make install