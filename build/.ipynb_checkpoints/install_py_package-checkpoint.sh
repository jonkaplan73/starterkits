#!/bin/bash

# [description]
#     Install a Python package from source
# [usage]
#     ./build/install_py_package.sh
#

# failure is a natural part of life
set -e

SOURCE_DIR=$(pwd)/swiptapi-py

pushd ${SOURCE_DIR}
    python3 setup.py develop || python3 setup.py develop --user
popd