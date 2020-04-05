set -e

SOURCE_DIR=$(pwd)/../swiptapi-py

pushd ${SOURCE_DIR}
    python3 setup.py develop
popd