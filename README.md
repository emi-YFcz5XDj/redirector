# Redirector

Runs an arbitrary executable specified in the config file.

This is primarily useful for launching a custom executable when using Steam Proton. Being a Windows program, it ensures that the Wine prefix will be created before launch. This is best used through the `%command%` variable in Steam launch options, enabling the construction of custom launch commands.

## Example Steam launch option

```
bash -c 'exec "${@/SkyrimSELauncher.exe/redirector.exe}"' -- %command%
```

## How it works

The Redirector will read a file location stored in `redirector.conf` (relative to the working directory) and execute it.

## Build Requirements

You'll need the following:
- gcc
- make
- Mingw64
- Mingw64 pthread static libraries

### Fedora 42
```
sudo dnf install gcc make mingw64-gcc mingw64-winpthreads-static
```

### Arch
```
sudo pacman -S gcc make mingw-w64-gcc mingw-w64-winpthreads
```

Check MinGW's [downloads page](https://www.mingw-w64.org/downloads/) for a more complete list of available packages.

## Build

A Makefile is provided to simplify the process.

- Running `make` or `make windows` will compile Windows binaries
- Running `make unix` will compile Unix binaries
- Running `make all` will compile all binaries

