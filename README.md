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

Adding Module
-------------

    git submodule add git@github.com:fatih/vim-go.git bundle/vim-go

Removing Module
---------------

1. Delete the relevant section from the `.gitmodules` file.
2. Stage the `.gitmodules` changes `git add .gitmodules`
3. Delete the relevant section from `.git/config`.
4. Run `git rm --cached path_to_submodule` (no trailing slash).
5. Run `rm -rf .git/modules/path_to_submodule`
6. Commit `git commit -m "Removed submodule <name>"`
7. Delete the now untracked submodule files `rm -rf path_to_submodule`

Customizing
-----------

You can set custom stuff in `~/.vimrc.after` and `~/.gvimrc.after`. Both are
sourced if present.

Credits
-------

Most of the settings were extracted from Janus.
