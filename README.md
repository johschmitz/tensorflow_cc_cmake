# tensorflow_cc_cmake
Simple Install script and cmake module for tensorflow C++ library.
This approach uses a vanilla bazel tensorflow build and also the protobuf and eigen libraries which are actually build as a part of the bazel tensorflow build.
I figured that this self contained approach is just simpler and less effort compared to other solutions that people have suggested.

## How to build
First build tensorflow_cc using bazel

    git clone https://github.com/tensorflow/tensorflow.git
    cd tensorflow
    git checkout v1.9.0
    ./configure
    bazel build tensorflow:libtensorflow_cc.so
    bazel build tensorflow:libtensorflow_framework.so

## How to install

Then set the prefix in the install shell script, copy it to the tensorflow root folder and run

    sudo ./install_tensorflow_cc.sh

## Environment variables

Add these lines to your .bashrc to help cmake and the compiler find the library

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/tensorflow_1_9_0/lib
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/tensorflow_1_9_0/lib/pkgconfig

## How to use

In your cmake project you might use the supplied cmake module to find tensorflow, protobuf and eigen.

## Note
Tested with Tensorflow 1.9.0
