#!/bin/sh

# required homebrew, git, wget
# builds binutils 2.24, gcc 4.9.1
brew install gcc@6 wget
mkdir -p /Users/$USER/Desktop/cross
export TARGET=i686-elf
export PREFIX=/Users/$USER/Desktop/cross
export CC=/usr/local/Cellar/gcc@6/6.5.0_7/bin/gcc-6
export CXX=/usr/local/Cellar/gcc@6/6.5.0_7/bin/g++-6
export CPP=/usr/local/Cellar/gcc@6/6.5.0_7/bin/cpp-6
export LD=/usr/local/Cellar/gcc@6/6.5.0_7/bin/gcc-6
git clone git://sourceware.org/git/binutils-gdb.git --branch binutils-2_24 binutils-2_24
git clone git://gcc.gnu.org/git/gcc-old.git --branch gcc-4_9_1-release gcc-4_9_1
cd binutils-2_24
./configure --prefix=$PREFIX --target=$TARGET --disable-multilib --disable-nls --disable-werror
make
make install
cd ..
cd gcc-4_9_1
cat ../except.patch | git apply -v
mkdir gcc-build
./contrib/download_prerequisites
cd gcc-build
../configure --prefix=$PREFIX --target=$TARGET --disable-nls --disable-libssp --disable-libquadmath --enable-languages=c --disable-werror --without-headers --disable-multilib
make
make install
cd ../../
rm -rf gcc-4_9_1 binutils-2_24
cd /Users/$USER/Desktop
tar cvzf cross.tar.gz cross/
brew uninstall gcc@6 wget
brew autoremove