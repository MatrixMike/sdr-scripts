#!/bin/bash
# sub-shell as recommended by shellcheck
mkdir build
cd build || exit
cmake ..
make
make install
cd ..
cd ..
