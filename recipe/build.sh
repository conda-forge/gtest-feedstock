#!/bin/bash

GTEST_DIR=$SRC_DIR/googletest

# Copy headers
cp -r $GTEST_DIR/include/gtest $PREFIX/include/

# Build and copy static libraries
mkdir build_static
cd build_static
cmake $GTEST_DIR
make
cp libgtest.a $PREFIX/lib/
cp libgtest_main.a $PREFIX/lib/
cd $GTEST_DIR

# Build and copy dynamic libraries
mkdir build_dynamic
cd build_dynamic
cmake $GTEST_DIR -Dgtest_build_tests=ON
make -j${CPU_COUNT} ${VERBOSE_CM}
cp libgtest_dll${SHLIB_EXT} $PREFIX/lib/
cd $GTEST_DIR
