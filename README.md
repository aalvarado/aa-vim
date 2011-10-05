#aa-vim

This is my .vimrc (or rather \_vimrc) configuration. it is very windows (tested on vista and win7) specific, but it should work fine on any other
OS by just naming the symlink .vimrc instead of \_vimrc

#Notes

It uses Vundler to manage plugings which I think is an improvement above Pathogen or VAM. You can read about it here: http://www.charlietanksley.net/philtex/sane-vim-plugin-management/ 

The vundler set up guide is at: 

https://github.com/gmarik/vundle/wiki/Vundle-for-Windows

You only need to do the git and curl on windows step, you do not need to clone the Vundler repo, since it is provided
as a git submodule.

I recommend using console2 http://sourceforge.net/projects/console/ for commandline usage. 

##Dependencies
* 1) git - http://code.google.com/p/msysgit/
* 2) ctags - http://ctags.sourceforge.net/
* 3) Perl and Ack for Ack.vim (if you don't need it, you don't need to install perl or ack) - http://stackoverflow.com/questions/1023710/how-can-i-install-and-use-ack-library-on-windows
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
Open up vim and type: 

```
:BundleInstall
```

This will download all and install the plugins specified in the \_vimrc file.

Restart vim after every install so you can use your newly installed plugins

Enjoy.
##Plugins
###Nerdtree

###Nerd Commenter

###Fugitive

###Extradite

###Surround

###RagTag

###Delimate

###Syntastic

###Vim-shell

###EasyTags

###Matchit

###Mini Buffer Explroer

###ShowMarks(7)

###PythonComplete

###Pyflakes

###Vim-rails

###ACK

###SuperTab

###Vim-ruby

###Vim-cucumber

###Vim-javascript

###Taglist

###Snipmate

