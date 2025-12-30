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

## Customizations
- Neovim leader is `,`
- Command mode is also `;`
- Mapped `jj` to `escape` in insert mode
- `,ff` will open the fzf files fuzzy search
- `,fv` that is `<leader>fv` will open up nvim-tree which is a file browser
- `,x` writes and quits the file
- `,w` writes the file
- There's autowrite for markdown files
- There's autocomplete for braces. for example typing `(` then `<tab>` autcomples and places cursor in the middle, same with single quotes, double quotes and angled. this `{<tab>` auto completes to this `{|}` but also works with `{<space><tab>` auto completes to `{ | }` which is very convenient. You jump with `<c-l>` or `<c-j>` between the end and the last cursor position

- This is made for editing markdown files as simple as possible. 

## Previews


Android with Termux
![Screenshot_20220428-100217_Termux~2](https://user-images.githubusercontent.com/370322/165838492-9853b05a-b940-4447-950c-fb7377aefd8e.jpg)
