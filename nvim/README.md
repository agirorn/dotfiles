# neovim

## Install a reasent version of neovim 

__1. Remove to old version__

```shell
sudo apt remove --purge neovim
sudo apt autoremove
```

## Build from source

__1. Install build dependencies:__

```shell
sudo apt install ninja-build gettext cmake unzip curl git
```

__2. Clone the Neovim repository:__

```shell
git clone --depth 1 https://github.com/neovim/neovim.git -b release-0.10
cd neovim
```

__3. Build and install:__

```shell
make CMAKE_BUILD_TYPE=Release
sudo make install
# Neovim will now be installed on your system.
```
