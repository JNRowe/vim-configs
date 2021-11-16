Environment variables
=====================

These configuration files can be influenced by the following environment
variables.

.. envvar:: LANG

    The default setting for all locale configuration, often overridden by
    category specific settings with ``LC_*``.

.. envvar:: PKG_LICENSE_DIR

    Location for text copies of common licenses, used in :repo:`projectionist
    <tpope/vim-projectionist>` :doc:`template setup
    <../localcfg/plugin_vim_projectionist>`.

.. envvar:: SHELL

    Shell used by fzf_ launcher, when :command:`vim` has not been compiled with
    terminal support.

.. envvar:: TERM

    This is used to control background colours.

.. envvar:: TERMINAL

    If set, it overrides guessing for fzf_’s launcher setting.

.. envvar:: TMPDIR

    Location for user’s temporary files.

.. envvar:: VIM_DISABLE_CURSORS

    If set then cursors keys are disabled.  This is entirely about
    :vimdoc:`learning motions <motion.txt>`, and not about promoting an
    “arrow keys are the devil’s plaything” sentiment.

.. envvar:: VIM_PROFILE

    Whether to enable profiling support.  If set to a filename it will profile
    all files under ``~/.vim``, and if specified as ``<filename>:<function>``
    will profile only the specified function.

.. envvar:: XDG_CACHE_HOME

    If set it configures the location for cache files.  See |XDG basedir| for
    how to configure it, and defaults.

.. envvar:: XDG_DATA_HOME

    If set it configures the location for data files.  See |XDG basedir| for
    how to configure it, and defaults.

.. _fzf: https://github.com/junegunn/fzf
