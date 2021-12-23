# i686-elf toolchain generator

These helper scripts are intended for building necessary toolchains for specified platforms, such as binutils and gcc compiler suite.

Currently macOS 11 Big Sur on Intel silicon and GCC 4.9.1 source is supported.

I've included a source patch for GCC to accomplish successful compilation. It is not needed to manually apply this patch onto source, script automatically applies it on the source.

Notice: git repos are used in the scripts are official FSF / GNU repositories for binutils and gcc sources.

## Usage

```sh
$ ./macos_env.sh
```

Output is created at `~/Desktop/cross` folder with name `cross.tar.gz` archive

## Requirements

Script needs below dependencies installed on system;

- homebrew
- git

`GCC@6` and `wget` is internal dependency and installed by the script onto the system and removed after operation.