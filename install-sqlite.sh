#!/bin/bash
SQLITE_VERSION="3420000"
cd ./sqlite-autoconf-${SQLITE_VERSION}
./configure --prefix=/eai/sqlite
make
make install