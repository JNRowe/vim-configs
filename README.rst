vim-configs
===========

This is my personal vim_ configuration files that are shared among hosts.
Maybe they’re useful to you too, or better yet you’ll spot *and* fix a bug!

It uses features introduced in version 8.0, but should work with later
versions.  It will *not* work with neovim_, and that is unlikely to change in
the near future.

If you want a rambling back story, see ``background.rst`` in this repository.

If you find any problems with the files in this repository either file an
issue_, or drop me an email_.  However, please do not report problems when
using neovim_, pull requests are fine though.

Installation
------------

Do not blindly install this repository!!  It’ll likely break your current set
up and *may* even eat your dog.

That being said if your dog doesn’t mean that much to you:

.. code-block:: shell

    git clone --recursive https://github.com/JNRowe/vim-configs.git ~/.vim
    cd ~/.vim
    # Rebuild generated language and documentation tag files
    gup -u

Scan over the ``vimrc`` file and figure out what you wish to do with it.  The
choices are: to just run with it, override it with your own ``~/.vimrc`` or
— most likely — simply to cherry pick the parts of it you like.

.. _vim: http://www.vim.org/
.. _email: jnrowe@gmail.com
.. _issue: https://github.com/JNRowe/vim-configs/issues
.. _neovim: https://neovim.io
