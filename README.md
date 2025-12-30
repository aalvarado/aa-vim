# AA-Vim
Vim / Nvim configuration.

## Support
Tested on the following Operating Systems:
* Windows 10/7
* OSX (Wherever Nvim works)
* Linux

## Dependencies
* git
* RipGrep
* Fzf
* Python 3
* Treesitter

## Installation
- Install Vim-Plug - https://github.com/junegunn/vim-plug
- Git clone aa-vim repo

```sh
git clone git@github.com:aalvarado/aa-vim.git
```

* Create symlinks

(Linux || OSX)

```
ln -s aa-vim/.vimrc ~/.vimrc
```

(Windows)

```
mklink .vimrc aa-vim\.vimrc

```
* Install Plugins

Open vim and type:

```vim
:PlugInstall
```

This will download all and install the plugins specified in the `.vimrc` file.

Restart vim to load all the plugins

## Previews
Android with Termux
![Screenshot_20220428-100217_Termux~2](https://user-images.githubusercontent.com/370322/165838492-9853b05a-b940-4447-950c-fb7377aefd8e.jpg)
