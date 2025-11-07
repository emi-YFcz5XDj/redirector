GNU_C=gcc
WIN_C=x86_64-w64-mingw32-gcc
WIN_FLAGS=-municode -static -static-libgcc -Bstatic
UNIX_SRC=main.c unix_utils.c
WIN_SRC=main.c win32_utils.c

default: windows

all: windows unix

# Unix builds are mostly for debugging
unix: $(UNIX_SRC)
	$(GNU_C) -s -O2 -o redirector unix_utils.c main.c

unix_debug: $(UNIX_SRC)
	$(GNU_C) -g -o redirector unix_utils.c main.c

windows: $(WIN_SRC)
	$(WIN_C) -s -O2 $(WIN_FLAGS) -mwindows -o redirector.exe $^

windows_debug: $(WIN_SRC)
	$(WIN_C) $(WIN_FLAGS) -D DEBUG -o redirector_debug.exe $^
