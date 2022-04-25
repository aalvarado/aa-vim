# AA-Vim
`.vimrc` configuration.

It works (for me) on the following Operating Systems:

- Windows 10/7
- OSX (Wherever Nvim works)
- Linux

# Notes
Relies on several plugins

## Dependencies
* 1) git
* 2) RipGrep
* 3) Fzf
* 4) Python 3
* 5) Ruby

## Installation
- Install Vim-Plug - https://github.com/junegunn/vim-plug
- Git clone aa-vim repo

```sh
git clone git@github.com:aalvarado/aa-vim.git
```

- Create symlinks

(Linux || OSX)

```
ln -s path_to_aa-vim/_vimrc ~/.vimrc
```

(windows)

```
mklink /D .vim aa-vim\.vim
mklink _vimrc aa-vim\_vimrc

```
- Install Plugins

Open vim and type:

```vim
:PlugInstall
```

This will download all and install the plugins specified in the \_vimrc file.

Refresh your vimrc with:

```
:VimRC
```
