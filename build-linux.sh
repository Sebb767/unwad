
# normal build

echo building unwad

cd include/minizip
gcc -c \
-Dunix=1 \
minizip.c miniunz.c zip.c unzip.c ioapi.c
cd ../..

g++ -Wall \
-I./include/pngpp -I./include \
src/unwad.cpp include/qmus2mid/qmus2mid.cpp \
include/minizip/minizip.o include/minizip/ioapi.o include/minizip/zip.o include/minizip/unzip.o \
-lmagic -lpng -lz \
-o unwad

strip unwad

echo building unwad.static

g++ -Wall \
-I./include/pngpp -I./include \
src/unwad.cpp include/qmus2mid/qmus2mid.cpp \
include/minizip/minizip.o include/minizip/ioapi.o include/minizip/zip.o include/minizip/unzip.o \
/usr/lib/x86_64-linux-gnu/libmagic.a /usr/lib/x86_64-linux-gnu/libpng.a /usr/lib/x86_64-linux-gnu/libz.a \
-o unwad.static

strip unwad.static

cd include/minizip
rm *.o
cd ../..
