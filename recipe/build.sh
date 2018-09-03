#!/bin/bash

GTEST_DIR=$SRC_DIR
GTEST_CXXFLAGS="-fPIC"

# Build and install static libraries
mkdir build_a
cd build_a
cmake -DCMAKE_CXX_FLAGS=${GTEST_CXXFLAGS} -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS=OFF -DBUILD_GMOCK=OFF -DCMAKE_INSTALL_LIBDIR=lib $GTEST_DIR
make
make install
cd $GTEST_DIR

# Build and install dynamic library
mkdir build_so
cd build_so
cmake -DCMAKE_CXX_FLAGS=${GTEST_CXXFLAGS} -DCMAKE_INSTALL_PREFIX=$PREFIX -DBUILD_SHARED_LIBS=ON -DBUILD_GMOCK=OFF -DCMAKE_INSTALL_LIBDIR=lib $GTEST_DIR
make
make install
cd $GTEST_DIR
