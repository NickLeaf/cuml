CMAKE_COMMON_VARIABLES=" -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX11_ABI=$BUILD_ABI"


if [ -n "$MACOSX_DEPLOYMENT_TARGET" ]; then
    # C++11 requires 10.9
    # but cudatoolkit 8 is build for 10.11
    export MACOSX_DEPLOYMENT_TARGET=10.11
fi

# show environment
printenv
# Cleanup local git
git clean -xdf
# Change directory for build process
cd cuML
# Use CMake-based build procedure
mkdir build
cd build
# configure
cmake $CMAKE_COMMON_VARIABLES ..
# build
make -j${PARALLEL_LEVEL} VERBOSE=1 install
