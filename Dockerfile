FROM quay.io/centos/centos:stream8

RUN dnf install -y glibc-langpack-en python3.11 make gcc gcc-c++

# Set virtual environment as entrypoint
ENTRYPOINT ["/bin/bash"]
