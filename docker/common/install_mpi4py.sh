#!/bin/bash

set -ex

MPI4PY_VERSION="3.1.5"
RELEASE_URL="https://github.com/mpi4py/mpi4py/archive/refs/tags/${MPI4PY_VERSION}.tar.gz"
#curl -L ${RELEASE_URL} | tar -zx -C /tmp
# Bypassing compatibility issues with higher versions (>= 69) of setuptools.
tar -xzvf mpi4py-3.1.5.tar.gz -C /tmp
sed -i 's/>= 40\.9\.0/>= 40.9.0, < 69/g' /tmp/mpi4py-${MPI4PY_VERSION}/pyproject.toml
pip3 install /tmp/mpi4py-${MPI4PY_VERSION} -i https://pypi.tuna.tsinghua.edu.cn/simple

rm -rf /tmp/mpi4py*
