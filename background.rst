Background
==========

.. note::

    This document is taken from my notes for a |vim| talk I semi-regularly give.
    It lacks a little context, but is hopefully helpful in understanding where
    this repository comes from.

I spend *literally* hours a day using a text editor, and so it matters to me
that it works well; fast, featureful, and — most importantly of all — stable.
|vim| fits the bill nicely…

That said, I am fickle, and I’d switch in a heartbeat if another editor improved
my workflow in the slightest.

History
-------

Perhaps it helps to understand where I’m coming from.  The following is
a little rambling history of how this repository came to be.

Emacsen
'''''''

``emacs``, or more truthfully AmigaOS’s MicroEMACS_, was my first real editor.
I loved it.  *Absolutely. Loved. It.*

You have to understand that before finding it I’d only seen what I would
describe now as Notepad-esque things.  MicroEMACS_ was a breath of fresh air,
even if it was alarming how little it conformed to the :abbr:`UI (User
Interface)` guidelines for the platform.

Later came `GNU Emacs`_, and despite how resource hungry it was, it was the only
editor I wanted to use for an *incredibly* long time.  Then about the same time
computers became fast enough to use `GNU Emacs`_ I switched away, as it simply
didn’t fit in to the environment I was using.  It didn’t interact correctly with
my desktop, the fonts were all screwy for math or foreign languages, and it just
felt somehow really dated.

Most of that has changed.  `GNU Emacs`_ can look and feel modern with a little
effort.  I still use it from time to time when working at a co-worker’s desk,
and occasionally consider switching back to it full time.  In all honesty, it
is probably only org-mode_ and proportional fonts for code comments that make me
want to switch back.

.. tip::

    Fellow :command:`vim` users should check out :repo:`evil-mode
    <emacs-evil/evil>`, an incredibly usable vi-style layer for
    :command:`emacs`.  Many common :command:`vim` plugins have been ported to
    work with it too!

The dark years
''''''''''''''

For a couple of years I attempted to use various “best of breed” editors for
different tasks.  It was awful.

I can’t understand how people do it.  I mean, *iff* you only edit Java, then
sure a Java editor might be a good idea.  However, if you need five different
Goliath :abbr:`IDE (Integrated Developer Environment)`\s installed to work on
a single project then you’re simply Doing It Wrong™.

Sublime Text
''''''''''''

Every now and then I play with `Sublime Text`_, but in the back of my mind
I know I won’t settle in to it.

The very idea of a non-Free(note the capital “F”) text editor repulses me.  When
you spend the amount of time *using* a tool that I do, then the thought that
tomorrow it won’t work is truly shocking [#]_.

There is also the issue of customisability, not being able to fix and extend
your tools is a frightening prospect.  I mean it offers *some* degree of
extensibility, but it is really quite limited.  The persistent undo package is
a great example of just how much grief the restrictiveness causes, look at the
``undotree`` branch for some true scariness(also the incredible ingenuity).

An example of how ridiculous closed source editors are can be found by looking
at the patches that are applied in the binaries installed on my work machine.
It is buggy enough that the current package maintainer is willing to support
a stack of no fewer than 15 very dirty patches, each of which have been
painstakingly fixed without access to the source.  Interestingly they require
|vim|’s :command:`xxd` to apply [#]_, almost as if to prove a point.

I’ve used it enough that I don’t regret having my employer license a copy for
me, and I even jumped through hoops to have them pony up for some mildly
interesting plugins too.

So, why do I play with it?  Simple, occasionally people show me some cool thing
it can do and I want to play too.  Also, because for the past few years there
has been a constant promise of an Open Source clone floating around.

I’m not sure if an Open Source clone would be enough for me to switch, but
I think it would make it plausible.  It might enable me, or someone else, to
make a usable ``vi`` mode though(``vintage`` appears to be designed for people
who think ``vi`` means “normal or insert”).

NotquiteVIM
'''''''''''

The |NeoViM| fork is interesting in a sort of not-:command:`vim` kind of way.
The attempt to modernise :command:`vim` is wonderful, but sadly they’ve done it
at the expense of half a dozen or so features I rely on.

I’m starting to believe it may be the future of |vim| though, and that bothers
me a little.  Many of the additions over stock |vim| are not my cup of tea, and
a few of the removals are breakages in my eyes.  Note that I’m *not* complaining
about the actual project, they’re free to do *whatever* they want.

As I stated above, I am fickle and I’ll change my mind in a heartbeat if it
eventually brings some changes that are useful to me.  Right now I’ll just thank
the developers for the nudge that brought modern :abbr:`IPC (Interprocess
Communication)` to stock :command:`vim`.

.. rubric:: Footnotes

.. [#] Or today if you’re not capable of a good few configuration hacks and are
       using a modern Linux distro.
.. [#] Apparently, it is simply because :command:`xxd` is *always* available
       and it wasn’t a top choice option.

.. _MicroEMACS: ftp://ftp.cs.helsinki.fi/pub/Software/Local/uEmacs-PK/
.. _GNU Emacs: https://www.gnu.org/software/emacs/
.. _org-mode: http://www.orgmode.org/

.. spelling::

    Emacsen
    esque
    featureful
    math
