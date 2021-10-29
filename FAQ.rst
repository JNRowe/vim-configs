Frequently Asked Questions
==========================

..
    Ask them, and perhaps they’ll become frequent enough to be added here ;)

.. contents::
    :local:

This can’t *possibly* be worth it
---------------------------------

Okay, thanks for pointing that out.

How do you decide what version of :command:`vim` you support?
-------------------------------------------------------------

I simply defer to Debian_.  Whatever is `packaged in Debian Stable`_ is the base
version for me.  The Debian maintainers do an *amazing* job of packaging
:command:`vim` and keeping on top of the necessary changes, and they have my
most sincere thanks for that!  At time of writing James McCoy(jamessan) has put
in over **fifteen** years keeping things working so that we don’t have to.

That said I don’t mind using features from more recent releases where it feels
useful, but they’ll always be guarded behind a version check.  You can find the
list of things I’d like to use if I dropped this requirement in the
:doc:`pending changes <../upgrades>` document.

Why don’t you support reloading of config files?
------------------------------------------------

A search through the history will show that this repository did, for a long
time, support reloading the configs.  However, the whole process is incredibly
brittle and really not all that useful.

:command:`vim` re-starts so quickly that it isn’t worth the grief to support
reloading, especially given how annoying it is to handle all the tiny corner
cases that make the process a complete nightmare to debug.

I’d pay the cost if the cycle time was even close to a second, but it isn’t.
Plus, combined with :vimdoc:`mksession <starting.txt#mks>`/:ref:`vim-obsession
<vim-obsession-plugin>` plugin the editor pops back up as if we were using live
reloading.

Post 2020, when will in-person tutorials begin again?
-----------------------------------------------------

Frankly, I have no idea.  I *really* miss presenting, so they’ll return as soon
as possible.  The original venue is no longer an option for non-pandemic
reasons, and new venues are currently hard to pin down for pandemic reasons.

In the meantime should you have questions feel free to ask by mail_.
I genuinely do enjoy replying to them, as I often learn something new along the
way.

.. note::

    **Co-workers**:  You can find recordings of old sessions on µfilm under
    ``JNRowe/vim``, and you should feel free to ask :command:`vim` questions by
    the other methods in my contact details too!

.. _Debian: https://debian.org/
.. _packaged in Debian Stable: https://packages.debian.org/vim
.. _mail: jnrowe@gmail.com
