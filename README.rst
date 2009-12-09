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

Scan over the ``vimrc`` file and figure out what you wish to do with it.
The choices are link it to ``~/.vimrc``, ``source`` it in your own
``~/.vimrc`` or simply cherrypick the parts of it you like.

GNU stow
''''''''

`GNU stow`_ v2 is required to manage plugins, the current v1 stable releases
will **not** work.  You may have to install ``stow`` from the `git repository`_
as v2 has not been released at the time I wrote this [#]_.

If you wish to manually install a plugin with ``stow`` use ``make stow-<plugin
name>``, this is also the command to issue when you've updated a plugin in
``external/``.  If you wish to remove a particular plugin that has been stowed
``make unstow-<plugin name>`` is available.

The reason for using ``stow`` is simple; it means we don't have to continually
mangle ``runtimepath``.  If for some reason you can't use ``stow`` you could
include the output of the following snippet in your ``runtimepath`` setting::

    join(split(glob(expand("~/.vim/external/*")), "\n"), ',')

All it does is generate a comma separated list of paths in ``~/.vim/external``,
which is the format ``runtimepath`` expects.  If you wish to include or exclude
specific plugins with this method you'll need to change the globbing pattern, or
move directories around.  (I did say ``stow`` was a nice way to manage this!)

One of the biggest disadvantages of extending ``runtimepath`` as described above
is that vim's ``helptags`` need to be generated in every ``external/*/doc``
directory.  Where the ``stow`` approach means we only need to generate, and
update, the ``helptags`` in ``doc``.

If you wish to switch solely to extending ``runtimepath`` instead of using
``stow`` for some reason you should take a look at pathogen.vim_.  It has the
same problems as manually extending ``runtimepath``, but does make such usage
easier.

cupage
''''''

cupage_ is used to keep scripts that aren't managed via git_ in sync with their
releases, see ``cupage.conf``.  ``cupage`` v0.3.0, or above, is required if you
wish to make use of this functionality.

.. [#] If you're using Gentoo_ you can find an ebuild for ditz_, in my
       overlay_.
.. [#] Gentoo_ users can install `GNU stow`_ directly from the `git
       repository`_ using the ``app-admin/stow-9999`` ebuild from my
       overlay_.

.. _vim: http://www.vim.org/
.. _email: jnrowe@gmail.com
.. _issue: http://github.com/JNRowe/vim-configs/issues
.. _ditz: http://ditz.rubyforge.org/
.. _Gentoo: http://www.gentoo.org/
.. _overlay: http://github.com/JNRowe/misc-overlay
.. _GNU stow: http://savannah.gnu.org/projects/stow
.. _git repository: http://savannah.gnu.org/git/?group=stow
.. _cupage: http://github.com/JNRowe/cupage
.. _git: http://www.git-scm.com/
.. _pathogen.vim: http://www.vim.org/scripts/script.php?script_id=2332

