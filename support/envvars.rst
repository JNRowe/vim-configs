Environment variables
=====================

These configs can be influenced by the following environment variables.

.. envvar:: PKG_LICENSE_DIR

    Location for text copies of common licenses, used in projectionist_
    :doc:`template setup <../localcfg/plugin_vim_projectionist>`.

.. envvar:: TMPDIR

    Location for user’s temporary files.

.. envvar:: VIM_PROFILE

    Whether to enable profiling support.  If set to a filename it will profile
    all files under ``~/.vim``, and if specified as ``<filename>:<function>``
    will profile only the specified functions.

.. _projectionist: https://github.com/tpope/vim-projectionist
