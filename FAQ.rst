Frequently Asked Questions
==========================

..
    Ask them, and perhaps they’ll become frequent enough to be added here ;)

.. contents::
    :local:

This can’t *possibly* be worth it
---------------------------------

Okay, thanks for pointing that out.

.. _supported-vim-version:

How do you decide what version of |vim| you support?
----------------------------------------------------

I simply defer to Debian_.  Whatever is `packaged in Debian Stable`_ is the base
version for me.  The Debian maintainers do an *amazing* job of packaging |vim|
and keeping on top of the necessary changes, and they have my most sincere
thanks for that!  At time of writing James McCoy(jamessan) has put in over
**fifteen** years keeping things working so that we don’t have to.

That said I don’t mind using features from more recent releases where it feels
useful, but they’ll always be guarded behind a version check.  You can find the
list of things I’d like to use if I dropped this requirement in the
:doc:`pending changes <../upgrades>` document.

Why don’t you support reloading of configuration files?
-------------------------------------------------------

A search through the history will show that this repository did, for a long
time, support reloading the configuration files.  However, the whole process is
incredibly brittle and really not all that useful.

|vim| restarts so quickly that it isn’t worth the grief to support reloading.
This is especially true given how annoying it is to handle all the tiny corner
cases that make the process a complete nightmare to debug.

I’d pay the cost if the cycle time was even close to a second, but it isn’t.
Plus, combined with :vimdoc:`mksession <starting.txt#mks>`/:ref:`vim-obsession
<vim-obsession-plugin>` plugin the editor pops back up as if we were using live
reloading.

Isn’t it really difficult to edit ``viml`` in ``reST``?
-------------------------------------------------------

It could be, but this is one of the perfect use cases for the :ref:`:NrrwRgn
<nrrwrgn-plugin>` plugin.  You can use it to open sections of a file in
a different window, and that window can have its own options configured
including the filetype.

I can’t state enough how useful this plugin can be.  It makes writing and
working with files with mixed content, such as templates, a smooth experience.

Post 2020, when will in-person tutorials begin again?
-----------------------------------------------------

Frankly, I have no idea.  I *really* miss presenting, so they’ll return as soon
as possible.  The original venue is no longer an option for non-pandemic
reasons, and new venues are currently hard to pin down for pandemic reasons.

In the meantime should you have questions feel free to ask by |mail|.
I genuinely do enjoy replying to them, as I often learn something new along the
way.

.. tip::

    **Co-workers**:  You can find recordings of old sessions on µfilm under
    ``JNRowe/vim``, and you should feel free to ask |vim| questions by the other
    methods in my contact details too!

Why are the commit messages littered with emoji?
------------------------------------------------

Co-workers.

Less flippantly, it is the style in a couple of projects I’m working on and I’m
struggling to get used it.  The simplest way forward was to force myself to do
so in an unimportant repository, using :ref:`custom maps
<gitcommit-emoji-commits>` to simplify input.

.. _vim-vim-filenames:

Why do some output filenames end with ``.vim.vim``
--------------------------------------------------

Filenames are made to closely match the plugin name, so that a simple
:command:`git` commit hook can check that the plugin exists and that the file is
named correctly.

But yeah, I agree that it is kinda ugly.

The hook I use is *sadly* dependent on an internal tool, but a similar effect
could be achieved with |zsh| in :file:`.git/hooks/pre-commit`:

.. code-block:: zsh

    dein_repos=${XDG_CACHE_HOME:-~/.cache}/vim/dein/repos
    extras=()
    for f (localcfg/plugin_*.vim) {
        plug_name=${f:t:r:s/plugin_//:gs/_/?/}
        if [[ -z "${dein_repos}/*/*/${plug_name}(/N)" ]]; then
            extras+=$i
        fi
    }
    if [[ ${#extras} -gt 0 ]] {
        echo "Extra config files:"
        echo ${(F)extras}
        exit 255
    }

.. warning::

    I haven’t tested this beyond a quick shell session, but it is a start should
    you wish to do something similar using just :file:`.git/hooks/pre-commit`.
    [Co-workers: Vasily’s ``hookworm`` contains my hook in its examples
    document.]

Why does using the mouse scroll wheel breaks my file
----------------------------------------------------

There are many, many ways to :vimdoc:`move through a buffer
<motion.txt#text-objects>` in vim.  Once you’ve learned them, keys such as
:kbd:`PageUp` and the mouse in general become a very weak means for navigation.

If we’re not using the mouse for its normal purpose, we can use it for something
:ref:`far more cool <scroll-wheel-override>`

.. _Debian: https://debian.org/
.. _packaged in Debian Stable: https://packages.debian.org/vim

.. spelling::

    µfilm
