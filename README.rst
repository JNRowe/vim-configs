vim-configs
===========

This is just my personal vim_ configuration files that are shared between hosts.
Maybe they're useful to you too, or better yet maybe you'll spot *and* fix
a bug!

It uses features introduced in version 7.3, but should work with later versions.

If you find any problems with the configuration files in this repository either
file an issue_ or drop me an email_.

Installation
------------

Do not install these files!!  They'll likely break your current set up and *may*
even eat your dog.

That being said if your dog doesn't mean that much to you::

    git clone git://github.com/JNRowe/vim-configs.git ~/.vim
    cd ~/.vim
    git submodule update --init
    make

Scan over the ``vimrc`` file and figure out what you wish to do with it.  The
choices are link it to ``~/.vimrc``, ``source`` it in your own ``~/.vimrc`` or
simply cherrypick the parts of it you like.

cupage
''''''

cupage_ is used to keep scripts that aren't managed via git_ in sync with their
releases, see ``cupage.conf``.  ``cupage`` v0.3.0, or above, is required if you
wish to make use of this functionality.

.. _vim: http://www.vim.org/
.. _email: jnrowe@gmail.com
.. _issue: http://github.com/JNRowe/vim-configs/issues
.. _Gentoo: http://www.gentoo.org/
.. _overlay: http://github.com/JNRowe/misc-overlay
.. _cupage: http://github.com/JNRowe/cupage
.. _git: http://www.git-scm.com/

..
    :vim: set ft=rst ts=4 sw=4 et:
