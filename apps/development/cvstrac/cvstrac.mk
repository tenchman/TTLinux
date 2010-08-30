#!/usr/bin/make
#
#### The toplevel directory of the source tree.
#
SRCDIR = .

#### C Compiler and options for use in building executables that
#    will run on the platform that is doing the build.
#
BCC = $(CC)

#### The suffix to add to executable files.  ".exe" for windows.
#    Nothing for unix.
#
E =

#### C Compile and options for use in building executables that 
#    will run on the target platform.  This is usually the same
#    as BCC, unless you are cross-compiling.
#
#TCC = gcc -O6
TCC = $(CC) -Os -fomit-frame-pointer -falign-functions=1 -falign-jumps=1 -falign-loops=1 -mpreferred-stack-boundary=2
#TCC = gcc -g -O0 -Wall -fprofile-arcs -ftest-coverage

#### Extra arguments for linking against SQLite
#
LIBSQLITE = -lsqlite3 -lm -lcompat

#### Installation directory
#
INSTALLDIR = $(DESTDIR)/usr/bin

LDFLAGS = -static -Wl,--gc-sections
# You should not need to change anything below this line
###############################################################################
include $(SRCDIR)/main.mk
