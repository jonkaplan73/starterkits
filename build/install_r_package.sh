#!/bin/bash

# [description]
#     Install an R package from source
# [usage]
#     ./build/install_r_package.sh
# 

# failure is a natural part of life
set -e

SOURCE_DIR=$(pwd)/../swiptapi-r

pushd ${SOURCE_DIR}
    
    Rscript -e "devtools::document()"
    R CMD INSTALL \
        --no-docs \
        .

popd