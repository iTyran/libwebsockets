#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

OUTPUT=$DIR/..
cd $OUTPUT

mkdir -p $OUTPUT/dist

mkdir -p build_armeabi
cd build_armeabi

cmake -DANDROID_ABI=armeabi -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake -DLWS_WITH_SSL=OFF -DLWS_WITHOUT_SERVER=ON -DLWS_WITHOUT_TESTAPPS=ON -DCMAKE_INSTALL_PREFIX:PATH=$OUTPUT/dist/armv5 $@ ../..
make
make install


cd ../
mkdir -p build_armeabi-v7a
cd build_armeabi-v7a

cmake -DANDROID_ABI=armeabi-v7a -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake -DLWS_WITH_SSL=OFF -DLWS_WITHOUT_SERVER=ON -DLWS_WITHOUT_TESTAPPS=ON -DCMAKE_INSTALL_PREFIX:PATH=$OUTPUT/dist/armv7a $@ ../..
make
make install

cd ../
mkdir -p build_arm64-v8a
cd build_arm64-v8a

cmake -DANDROID_ABI=arm64-v8a -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake -DLWS_WITH_SSL=OFF -DLWS_WITHOUT_SERVER=ON -DLWS_WITHOUT_TESTAPPS=ON -DCMAKE_INSTALL_PREFIX:PATH=$OUTPUT/dist/armv8a $@ ../..
make
make install

cd ../
mkdir -p build_x86
cd build_x86

cmake -DANDROID_ABI=x86 -DCMAKE_TOOLCHAIN_FILE=../android.toolchain.cmake -DLWS_WITH_SSL=OFF -DLWS_WITHOUT_SERVER=ON -DLWS_WITHOUT_TESTAPPS=ON -DCMAKE_INSTALL_PREFIX:PATH=$OUTPUT/dist/x86 $@ ../..
make
make install


# cmake -DANDROID_ABI=armeabi -DCMAKE_TOOLCHAIN_FILE=../scripts/toolchain-android-ndk-r8e.cmake $@ ../..