#!/bin/bash
# This script should install and build all needed stuff for
# using the SDRPlay on Ubuntu 16.04 or later.  It must be
# run as root. 
#
# This is part two.
# Here we build SoapySDR

#cd SoapySDR
cd SoapySDR || exit
mkdir build
#cd build
cd build || exit
cmake ..
make -j4
make install
ldconfig
cd ..
cd ..

# Now we build the SDRPlay module for Soapy

cd SoapySDRPlay || exit
mkdir build
cd build || exit
cmake ..
make
make install
cd ..
cd ..

# And we build SoapyRemote

cd SoapyRemote || exit
mkdir build
cd build || exit
cmake ..
make
make install
cd ..
cd ..

# And finally,  we build Cubic.  This takes a while!

cd CubicSDR || exit
mkdir build
cd build || exit
cmake ../ -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=~/Develop/wxWidgets-staticlib/bin/wx-config
make
make install
cd ..
cd ..
rm -R ~/Develop

# now we change permissions on these root-owned folders so the user can
# delete them at their leisure.

chmod -R 0777 ./*

# And we're done.   Cubic should work with the SDRPlay.  The user can
# run it from the terminal with CubicSDR or add this command to a menu.

#/* end of script 2 /*
