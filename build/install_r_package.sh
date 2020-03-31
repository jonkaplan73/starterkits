set -e

SOURCE_DIR=$(pwd)/../swiptapi-r

pushd ${SOURCE_DIR}

	Rscript -e 'devtools::install_deps(".")'
    R CMD INSTALL \
        --no-docs \
        .

popd