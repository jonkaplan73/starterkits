
SOURCE_DIR=$(pwd)/../

pushd ${SOURCE_DIR}
    
    Rscript -e "roxygen2::roxygenize('swiptapi-r')"

popd