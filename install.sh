#!/bin/bash
installdir=/usr/local

source /usr/mpi/gcc/openmpi-4.1.2a1/bin/mpivars.sh
sudo yum install -y openssl-devel libattr-devel bzip2-devel
mkdir deps
cd deps
  wget https://github.com/hpc/libcircle/releases/download/v0.3/libcircle-0.3.0.tar.gz
  wget https://github.com/llnl/lwgrp/releases/download/v1.0.4/lwgrp-1.0.4.tar.gz
  wget https://github.com/llnl/dtcmp/releases/download/v1.1.4/dtcmp-1.1.4.tar.gz
  wget https://www.libarchive.org/downloads/libarchive-3.5.1.tar.gz
  wget https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2.tar.gz
  wget https://github.com/hpc/mpifileutils/releases/download/v0.11.1/mpifileutils-v0.11.1.tgz

  tar -zxf libcircle-0.3.0.tar.gz
  cd libcircle-0.3.0
    ./configure --prefix=$installdir
    make install
  cd ..

  tar -zxf lwgrp-1.0.4.tar.gz
  cd lwgrp-1.0.4
    ./configure --prefix=$installdir
    make install
  cd ..

  tar -zxf dtcmp-1.1.4.tar.gz
  cd dtcmp-1.1.4
    ./configure --prefix=$installdir --with-lwgrp=$installdir
    make install
  cd ..

  tar -zxf libarchive-3.5.1.tar.gz
  cd libarchive-3.5.1
    ./configure --prefix=$installdir
    make install
  cd ..

  tar -xzf cmake-3.25.2.tar.gz
  cd cmake-3.25.2
    ./bootstrap && make && sudo make install
  cd ..

  tar -zxf mpifileutils-v0.11.1.tgz
  cd mpifileutils-v0.11.1
  mkdir build
  cd build
    cmake .. \
      -DWITH_LibArchive_PREFIX=$installdir \
      -DCMAKE_INSTALL_PREFIX=$installdir
    make -j install
  cd ..
cd ..
