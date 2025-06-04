GNU_C=gcc
WIN_C=x86_64-w64-mingw32-gcc
WIN_FLAGS=-municode -static -static-libgcc -Bstatic -lpthread
WIN_SRC=main.c win32_utils.c

default: windows

all: windows unix

# Unix build is mostly for debugging
unix: main.c unix_utils.c
	$(GNU_C) -s -O2 -o redirector unix_utils.c main.c

windows: $(WIN_SRC)
	$(WIN_C) -s -O2 $(WIN_FLAGS) -mwindows -o redirector.exe $^

windows_debug: $(WIN_SRC)
	$(WIN_C) $(WIN_FLAGS) -D DEBUG -o redirector_debug.exe $^
