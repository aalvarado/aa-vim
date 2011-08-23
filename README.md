#aa-vim

This is my .vimrc (or rather _vimrc) configuration. it is very windows (tested on vista and win7) specific, but it should work fine on any other
OS by just naming the symlink .vimrc instead of _vimrc

#Notes

It uses Vundler to manage plugins.

The vundler set up guide is at: 

https://github.com/gmarik/vundle/wiki/Vundle-for-Windows

You only need to do the git and curl on windows step, you do not need to clone the Vundler repo, since it is provided
as a git submodule.

I recommend using console2 http://sourceforge.net/projects/console/ for commandline usage. 

I've configured my git to work only from bash. If you do it like this, `:BundleInstall` will only work 
from within bash. If you follow vundler's guide for windows, you can make it work straight from Gvim.


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

This will download all and install the plugins specified in the _vimrc file.

Restart vim after every install so you can use your newly installed plugins

Enjoy.
