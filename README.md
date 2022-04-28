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
* Ruby

## Installation
- Install Vim-Plug - https://github.com/junegunn/vim-plug
- Git clone aa-vim repo

```sh
git clone git@github.com:aalvarado/aa-vim.git
```

* Create symlinks

(Linux || OSX)

```
ln -s path_to_aa-vim/_vimrc ~/.vimrc
```

(windows)

```
mklink /D .vim aa-vim\.vim
mklink _vimrc aa-vim\_vimrc

```
* Install Plugins

Open vim and type:

```vim
:PlugInstall
```

This will download all and install the plugins specified in the `.vimrc` file.

Restart vim to load all the plugins


