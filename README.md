MHFS Vimfiles
=============

My VIM settings and plugins.

Installation
------------

    git clone git://github.com/mhfs/vimfiles.git ~/Code/vimfiles/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/Code/vimfiles/bundle/Vundle.vim
    vim +PluginInstall +qall

    ln -s ~/Code/vimfiles/ ~/.vim
    ln -s ~/Code/vimfiles/vimrc ~/.vimrc
    ln -s ~/Code/vimfiles/gvimrc ~/.gvimrc

Customizing
-----------

You can set custom stuff in `~/.vimrc.after` and `~/.gvimrc.after`. Both are
sourced if present.

Credits
-------

Most of the settings were extracted from Janus.
