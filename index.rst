vim-configs
===========

This is my personal vim_ configuration that is shared among hosts.  Maybe
they’re useful to you too, or — better yet — you’ll spot *and* fix a bug!

It uses features introduced in version 8.0, but should work with later versions.
It will probably *not* work with neovim_, and that is unlikely to change in the
near future.

If you want a rambling backstory, see the :doc:`background` document.

If you find any problems with the files in this repository either file an
issue_, or drop me an mail_.  However, please do not report problems when using
neovim_, pull requests are fine though.

Installation
------------

Do not blindly install this repository!  It’ll likely break your current set up
and *may* even eat your dog.  That being said, if your dog doesn’t mean that
much to you:

.. code-block:: console

    $ git clone --recursive https://github.com/JNRowe/vim-configs.git ~/.vim
    $ cd !$
    $ ./build.py  # Generate ninja build rules, see --help for options
    $ ninja  # Rebuild generated language and documentation tag files

Scan over the generated ``.vim`` files and figure out what you wish to do with
them.  The choices are: run with it, override some of them with your own
``~/.vimrc``, or — most likely — simply cherry pick the parts of you like.

Contents
--------

Help
''''

.. toctree::
    :titlesonly:

    background
    FAQ

Vim files
'''''''''

.. toctree::
    :titlesonly:

    after/ftplugin/index
    ftdetect/index
    ftplugin/index
    localcfg/index
    vimrc.d/index

    vimrc
    dein

Indices and tables
''''''''''''''''''

* :ref:`genindex`
* :ref:`search`

Contributors
------------

I’d like to thank the following people who have contributed to ``vim-configs``.

Patches
'''''''

* <your name here>

Bug reports
'''''''''''

* <your name here>

Ideas
'''''

* Nathan McGregor

If I’ve forgotten to include your name I wholeheartedly apologise.  Just drop me
a mail_ and I’ll update the list!

Bugs
----

If you find any problems, bugs or just have a question about this package either
file an issue_ or drop me a mail_.

If you’ve found a bug please try to include a minimal testcase that reproduces
the problem, or even better a patch that fixes it!

.. _vim: http://www.vim.org/
.. _neovim: https://neovim.io/
.. _issue: https://github.com/JNRowe/vim-configs/issues
.. _mail: jnrowe@gmail.com
