MHFS Vimfiles
=============

My VIM settings and plugins.

Installation
------------

    git clone git://github.com/mhfs/vimfiles.git ~/code/vimfiles/
    git submodule init
    git submodule update

    ln -s ~/code/vimfiles/ ~/.vim
    ln -s ~/code/vimfiles/vimrc ~/.vimrc
    ln -s ~/code/vimfiles/gvimrc ~/.gvimrc

Updating Modules
----------------

    git submodule foreach git pull origin master

Customizing
-----------

You can set custom stuff in `~/.vimrc.after` and `~/.gvimrc.after`. Both are
sourced if present.

Credits
-------

Most of the settings were extracted from Janus.
