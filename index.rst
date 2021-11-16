vim-configs
===========

This is my personal |vim| configuration that is shared among hosts.  Maybe
they’re useful to you too, or — better yet — you’ll spot *and* fix a bug!

.. image:: /.static/hero.png
   :alt: Sample screenshot of configuration

It uses features introduced in :ref:`version 8.0 <supported-vim-version>`, but
should work with later versions.  It will *not* work with |neovim|, and that is
unlikely to change in the near future.

If you want a rambling backstory, see the :doc:`background document
<background>`.

If you find any problems with the files in this repository please either file an
|issue|, or drop me an |mail|.  However, please do not report problems when
using |neovim|, pull requests are fine though.

Installation
------------

Do not blindly install this repository!  It’ll likely break your current set up
and *may* even eat your dog.  That being said, if your dog doesn’t mean that
much to you:

.. code-block:: console

    $ git clone --recursive https://github.com/JNRowe/vim-configs.git ~/.vim
    $ cd !$
    $ ./build.py  # Generate ninja build rules, see --help for options
    $ ninja  # Build, or update, generated files

Scan over the generated ``.vim`` files and figure out what you wish to do with
them.  The choices are: run with it, override some of them with your own
:file:`~/.vim/vimrc`, or — most likely — to simply cherry pick the parts you
find least offensive.

Contents
--------

Help
''''

.. toctree::
    :titlesonly:

    background
    FAQ
    support/envvars
    support/leader_maps
    support/why

Also see the :ref:`glossary <genindex>`.

Vim files
'''''''''

.. toctree::
    :maxdepth: 1

    after/ftplugin/index
    autoload/index
    compiler/index
    ftdetect/index
    ftplugin/index
    localcfg/index
    vimrc.d/index

    vimrc
    dein

Development
'''''''''''

.. toctree::
    :titlesonly:

    todo

Future
''''''

.. toctree::
    :titlesonly:

    upgrades

Contributors
------------

I’d like to thank the following people who have contributed to ``vim-configs``.

Patches
'''''''

* <your name here>

Bug reports
'''''''''''

* Delphine Beauchemin

Ideas
'''''

* Nathan McGregor

If I’ve forgotten to include your name I wholeheartedly apologise.  Just drop me
a |mail| and I’ll update the list!

Bugs
----

If you find any problems, bugs or just have a question about this package either
file an |issue| or drop me a |mail|.

If you’ve found a bug please try to include a minimal testcase that reproduces
the problem, or even better a patch that fixes it!

.. spelling::

    Beauchemin
    configs
    testcase
