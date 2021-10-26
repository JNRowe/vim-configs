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
Plus, combined with ``mksession`` the editor pops back up as if we were using
live reloading.

.. _Debian: https://debian.org/
.. _packaged in Debian Stable: https://packages.debian.org/vim
