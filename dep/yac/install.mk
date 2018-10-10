#
# Common makefile include for tks-source and plugins
#  (requires MSYS shell, MSVC and GNU make)
#

# n=32bit build ("x86", jit)
# y=64bit build ("amd64", no jit)
BUILD_64=y

LIB_INSTALL_PREFIX=/home/cameron/src/VeeSeeVSTRack/dep/lib/


#
# Number of parallel targets to make
#
NUMJOBS=$(NUMBER_OF_PROCESSORS)


#
# Set to 'y' to use shared "zlib1.dll"
# (otherwise compile and statically link zlib sources)
#
ifeq ($(BUILD_64),y)
USE_SHARED_ZLIB=y
else
USE_SHARED_ZLIB=n
endif


#
# Set to 'y' to use shared libpng.dll
#  (otherwise compile and statically link libpng sources)
#  (actually you need to keep this set to 'n' on Win32
#   since the official libpng Win32 binaries are for GCC
#   and I've been too lazy to build the .dll myself ._°)
#
ifeq ($(BUILD_64),y)
USE_SHARED_LIBPNG=y
else
USE_SHARED_LIBPNG=n
endif


#
# Common source directory for 3rd party libs (libpng, zlib)
#
# Now this is a bit tricky: The directory name MUST use the
# MSDOS style drive:/path naming convention, NOT the MSYS
# /drive/path one! (required by the MSVC compiler)
#
OTHER_SRC=/home/cameron/src/VeeSeeVSTRack/include


#
# Path to zlib sources (required if USE_SHARED_ZLIB != y)
#  (zlib123.zip distribution)
#  (note) [19Jan2018] superceded by tks-source/zlib-1.2.11/ in windows build
#
ZLIB_SRC=/usr/include/


#
# Path to zlib binaries (required if USE_SHARED_ZLIB=y)
#  (zlib123-dll.zip distribution)
#  (note) [19Jan2018] superceded by tks-source/zlib-1.2.11/ in windows build
#
ZLIB_BIN=/usr/bin/


#
# Path to libpng sources (required if USE_SHARED_LIBPNG != y)
#  (lpng1235.zip)
#  (Note: you may need to fix "fileno" to "_fileno" in pngwio.c:140
#         because of ISO-C++ compliance)
#
LIBPNG_SRC=/usr/include/libpng16/


#
# Tool setup
#
CC        = c++
LD        = c++
LIB       = ar crs
CP        = cp -f
MAKE      = make
FIND      = find
MKDIR     = mkdir -p
RM        = rm -f
SED       = sed
ZIP       = zip
MD5SUM    = md5sum


#
# C compiler flags
#
CFLAGS= -D_CRT_SECURE_NO_DEPRECATE -Wdeprecated-declarations -DARCH_LIN -DLIN
ifeq ($(BUILD_64),y)
CFLAGS+= -DBUILD_64
endif


#
# C++ compiler flags
#
CPPFLAGS= $(CFLAGS)

#
# Default linker flags
#
# LDFLAGS= -INCREMENTAL:NO -VERSION:0.9
# ifeq ($(BUILD_64),y)
# LDFLAGS += -MACHINE:X64 
# else
# LDFLAGS += -MACHINE:X86 
# endif


#
# Size optimization linker flags (used by plugins)
#
LDFLAGS_SIZE=


#
# Extra includes
#
EXTRA_INCLUDES=


#
# Extra library paths
#
EXTRA_LIBS=


#
# Default Optimization flags
#
OPTFLAGS= -O3 -Ofast


#
# Size optimization flags (used by plugins)
#
OPTFLAGS_SIZE= -Os -GL -GF -Gy -GA


#
# Which flags to use for plugins
#
OPTFLAGS_PLUGIN = $(OPTFLAGS)


#
# Debug flags
#
DBGFLAGS=


#
# Nothing to change after this line-----------------------------
#
CFLAGS+= $(EXTRA_INCLUDES) $(DBGFLAGS)
CPPFLAGS+= $(EXTRA_INCLUDES) $(DBGFLAGS)
LDFLAGS+= $(EXTRA_LIBS)


ARCH_LIN=y
undefine ARCH_WIN