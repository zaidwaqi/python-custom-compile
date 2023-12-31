#!/bin/bash
OPENSSL_VERSION="3.1.1"
cd ./openssl-${OPENSSL_VERSION}
./Configure --prefix=/eai/ssl --openssldir=/eai/ssl -Wl,-rpath=\\\$\$ORIGIN/../lib64
make
make install