#aa-vim

This is my .vimrc (or rather \_vimrc) configuration. it has some very windows (tested on xp, vista, win7) specific settings. Also tested on OSX
#Notes

It uses Vundler to manage plugings which I think is an improvement above Pathogen or VAM. You can read about it here: http://www.charlietanksley.net/philtex/sane-vim-plugin-management/ 

The vundler set up guide is at: 

https://github.com/gmarik/vundle/wiki/Vundle-for-Windows

You only need to do the git and curl on windows step, you do not need to clone the Vundler repo, since it is provided
as a git submodule.

I recommend using console2 http://sourceforge.net/projects/console/ for commandline usage. 

##Dependencies
* 1) git \- http://code.google.com/p/msysgit/
* 2) ctags \- http://ctags.sourceforge.net/
* 3) Perl and Ack for Ack.vim (if you don't need it, you don't need to install perl or ack) \- http://stackoverflow.com/questions/1023710/how-can-i-install-and-use-ack-library-on-windows
* 4) Python for ultisnips


##Installation

First clone the repo and submodule update:

```
cd %userprofile%
git clone git@github.com:aalvarado/aa-vim.git
git submodule update
```

Create symlinks (in a command cmd.exe window)

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

Restart vim after every install so you can use your newly installed plugins

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
