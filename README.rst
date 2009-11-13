vim-configs
===========

This is just my personal vim_ configuration files that are shared
between hosts.  Maybe they're useful to you too, or better yet maybe
you'll spot *and* fix a bug!

If you find any problems with the configuration files in this repository
either drop me an email_ or file an issue_.  Locally, bugs are managed
with ditz_, so if you're working with a clone of the repository you can
report, list and fix bugs directly in the repository [#]_.

Installation
------------

Do not install these files!!  They'll likely break your current set up
and *may* even eat your dog.

That being said if your dog doesn't mean that much to you::

    git clone git://github.com/JNRowe/vim-configs.git ~/.vim
    cd ~/.vim
    git submodule update --init
    make

`GNU stow`_ v2 is required to manage plugins, the current v1 stable
releases will **not** work.  You may have to install `stow` from the
`git repository`_ as v2 has not been released at the time I wrote this
[#]_.

Scan over the ``vimrc`` file and figure out what you wish to do with it.
The choices are link it to ``~/.vimrc``, ``source`` it in your own
``~/.vimrc`` or simply cherrypick the parts of it you like.

.. [#] If you're using Gentoo_ you can find an ebuild for ditz_, in my
       overlay_.
.. [#] Gentoo_ users can install `GNU stow`_ directly from the `git
       repository`_ using the ``app-admin/stow-9999`` ebuild from my
       overlay_

.. _vim: http://www.vim.org/
.. _email: jnrowe@gmail.com
.. _issue: http://github.com/JNRowe/vim-configs/issues
.. _ditz: http://ditz.rubyforge.org/
.. _Gentoo: http://www.gentoo.org/
.. _overlay: http://github.com/JNRowe/misc-overlay
.. _GNU stow: http://savannah.gnu.org/projects/stow
.. _git repository: http://savannah.gnu.org/git/?group=stow

