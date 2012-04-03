#aa-vim

This is my .vimrc configuration.works on OSX, Linux and Windows. It has some windows (tested on xp, vista, win7) specific settings.

#Notes

It uses Vundler to manage plugings which I think is an improvement above Pathogen or VAM. You can read about it here: http://www.charlietanksley.net/philtex/sane-vim-plugin-management/

The vundler set up guide is at:

https://github.com/gmarik/vundle/wiki/Vundle-for-Windows

You only need to do the git and curl on windows step, you do not need to clone the Vundler repo, since it is provided
as a git submodule.

I recommend using console2 http://sourceforge.net/projects/console/ for commandline usage.

##Dependencies
* 1) git
* 2) ctags
* 3) Ack
* 4) Python
* 5) Ruby


##Installation

First clone the repo and submodule update:

```
cd %userprofile%
git clone git@github.com:aalvarado/aa-vim.git
git submodule init
git submodule update
```


Create symlinks

(Linux || OSX)

```
ln -s path_to_aa-vim/_vimrc ~/.vimrc
ln -s path_to_aa-vim/.vim ~/.vim
```


(windows)

```
mklink /D .vim aa-vim\.vim
mklink _vimrc aa-vim\_vimrc

```

for windows xp you can use fsutil and create a hardlink http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/fsutil.mspx

Open up vim and type:

```
:BundleInstall
```

This will download all and install the plugins specified in the \_vimrc file.

Refresh your vimrc with:

```
:VimRC
```

Enjoy.
## Plugins
### The-NERD-tree
### The-NERD-Commenter
### fugitive.vim
### extradite.vim
### surround.vim
### ragtag.vim
### delimitMate.vim
### Syntastic
### Wombat
### set_utf8.vim
### xolox/vim-shell
### matchit.zip
### obsidian2.vim
### molokai
### ShowMarks7
### pythoncomplete
### pyflakes.vim
### Indent-Guides
### vim-scripts/UltiSnips
### sessionman.vim
### LustyExplorer
### LustyJuggler
### tpope/vim-rails.git
### altercation/vim-colors-solarized.git
### tpope/vim-haml.git
### mileszs/ack.vim.git
### ervandew/supertab.git
### vim-ruby/vim-ruby.git
### tpope/vim-vividchalk.git
### tpope/vim-cucumber.git
### mattn/gist-vim.git
### pangloss/vim-javascript.git
### timcharper/textile.vim.git
