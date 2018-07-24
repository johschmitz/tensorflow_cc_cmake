#!/bin/bash

####
# Copy this install script to your tensorflow source folder root
####

INSTALL_PREFIX=/opt/tensorflow_cc_1_9_0
VERSION=1.9.0

####

mkdir -p $INSTALL_PREFIX/lib
cp bazel-bin/tensorflow/libtensorflow_cc.so $INSTALL_PREFIX/lib
cp bazel-bin/tensorflow/libtensorflow_framework.so $INSTALL_PREFIX/lib
cp bazel-out/host/bin/external/protobuf_archive/libprotobuf.a $INSTALL_PREFIX/lib

mkdir -p $INSTALL_PREFIX/include/tensorflow
cp -r tensorflow $INSTALL_PREFIX/include/
find $INSTALL_PREFIX/include/tensorflow -type f  ! -name "*.h" -delete

cp bazel-genfiles/tensorflow/core/framework/*.h  $INSTALL_PREFIX/include/tensorflow/core/framework
cp bazel-genfiles/tensorflow/core/kernels/boosted_trees/*.h  $INSTALL_PREFIX/include/tensorflow/core/kernels/boosted_trees
cp bazel-genfiles/tensorflow/core/lib/core/*.h  $INSTALL_PREFIX/include/tensorflow/core/lib/core
cp bazel-genfiles/tensorflow/core/protobuf/*.h  $INSTALL_PREFIX/include/tensorflow/core/protobuf
cp bazel-genfiles/tensorflow/core/util/*.h  $INSTALL_PREFIX/include/tensorflow/core/util
cp bazel-genfiles/tensorflow/cc/ops/*.h  $INSTALL_PREFIX/include/tensorflow/cc/ops

cp -r third_party $INSTALL_PREFIX/include/
rm -r $INSTALL_PREFIX/include/third_party/py

mkdir -p $INSTALL_PREFIX/include/google
cp -Lr bazel-tensorflow/external/protobuf_archive/src/google/protobuf $INSTALL_PREFIX/include/google

mkdir -p $INSTALL_PREFIX/include/eigen
cp -Lr bazel-tensorflow/external/eigen_archive/unsupported $INSTALL_PREFIX/include/eigen
cp -Lr bazel-tensorflow/external/eigen_archive/Eigen $INSTALL_PREFIX/include/eigen

./tensorflow/c/generate-pc.sh --prefix=$INSTALL_PREFIX --version=$VERSION
mkdir -p $INSTALL_PREFIX/lib/pkgconfig
cp tensorflow.pc $INSTALL_PREFIX/lib/pkgconfig/tensorflow_cc.pc

