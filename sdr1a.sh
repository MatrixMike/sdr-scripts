#! /bin/bash
# Build wxwidgets
# extracted as a subsection of main build as I have most problems with this...
# February   Sun 10 Feb 16:22:47 AEDT 2019
wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-3.1.0.tar.bz2
tar -xvjf wxWidgets-3.1.0.tar.bz2 
cd wxWidgets-3.1.0/  || exit
mkdir -p ~/Develop/wxWidgets-staticlib
./autogen.sh
./configure "--with-opengl --disable-shared --enable-monolithic --with-libjpeg --with-libtiff --with-libpng --with-zlib --disable-sdltest --enable-unicode --enable-display --enable-propgrid --disable-webkit --disable-webview --disable-webviewwebkit --prefix=`echo ~/Develop/wxWidgets-staticlib` CXXFLAGS="-std=c++0x" --with-libiconv=/usr"
make -j4
make install
cd ..
