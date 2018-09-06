Background
==========

I spend *literally* hours a day using a text editor, and so it matters to me
that it works well; fast, featureful, and — most importantly of all — stable.
vim_ fits the bill nicely…

That said, I am fickle, and I‘d switch in a heartbeat if another editor improved
my workflow in the slightest.

History
-------

Perhaps it helps to understand where I‘m coming from.  The following is
a little rambling history of how this repository came about.

Emacsen
'''''''

``emacs``, or more truthfully AmigaOS‘s MicroEMACS_, was my first real editor.
I loved it.  Absolutely. Loved. It.

You have to understand that prior to it I‘d basically only seen what I‘d
describe now as Notepad-esque things.  MicroEMACS_ was a breath of fresh air,
even if it was alarming how little it conformed to the UI guidelines for the
platform.

Later came `GNU Emacs`_, and in spite of how resource hungry it was, it was the
only editor I wanted to use for an *incredibly* long time.  Then about the same
time computers became fast enough to use `GNU Emacs`_ I switched away, as it
simply didn‘t fit in to the environment I was using.  It didn‘t interact
correctly with my desktop, the fonts were all screwy for math or foreign
languages, and it just felt somehow really dated.

Most of that has changed.  `GNU Emacs`_ can look and feel modern-ish with
a little effort.  I still use it from time to time when working at a co-worker’s
desk, and occasionally consider switching back to it full time.  In all honesty,
it is probably only org-mode_ and proportional fonts for comments that make me
want to switch back.

The dark years
''''''''''''''

For a couple of years I attempted to use a variety of “best of breed” editors
for different tasks.  It was awful.

I can‘t understand how people do it.  I mean *iff* you only edit Java then sure
a Java editor might be a good idea, but if you need five different Goliath IDEs
installed to work on a single project then you‘re simply doing it wrong.

Sublime Text
''''''''''''

Every now and then I play with `Sublime Text`_, but in the back of my mind
I know I won‘t settle in to it.

The very idea of a non-Free(note the capital F) text editor repulses me.  When
you spend the amount of time *using* a tool that I do the thought that tomorrow
it won‘t work is truly shocking [1]_.

There is also the issue of customisability, not being able to fix and extend
your tools is a frightening prospect for me.  I mean it offers *some* degree of
extensibility, but it is really quite limited.  The persistent undo package is
a great example of just how much grief the restrictiveness causes, look at the
``undotree`` branch for some true scariness(also the incredible ingenuity).

An example of how ridiculous it is can be is found by looking at the patches
that are applied in the binaries installed on my work machine.  It is bug ridden
enough that the current package maintainer is willing to support a stack of no
less than 15 very dirty patches that have been painstakingly fixed without
access to the source, which interestingly require vim_‘s ``xxd`` to apply [2]_.

I‘ve used it enough that I don‘t regret having my employer license a copy for
me, and I even jumped through hoops to have them pony up for some mildly
interesting plugins.

So why do I play with it?  Simple, occasionally people show me some cool thing
it can do and I want to play too.  Also, because for the past two years there
has been a constant promise of an Open Source clone floating around.

I‘m not sure if a Open Source clone would be enough for me to switch, but
I think it would make it plausible.  It might allow me, or someone else, to make
a usable ``vi`` mode though(``vintage`` appears to be designed for people who
think ``vi`` means “normal or insert”).

NotquiteVIM
'''''''''''

The NeoViM_ fork is interesting in a sort of not-``vim`` kind of way.  The
attempt to modernise ``vim`` is wonderful, but sadly they‘ve done it at the
expense of half a dozen or so features I rely on.

I‘m starting to believe it may be the future of vim_ though, and that bothers me
a little.  The additions over stock vim_ are not my cup of tea, and the removals
are breakages in my eyes.

As I stated above, I am fickle and I‘ll change my mind in a heartbeat if it
eventually brings some changes that are useful to me.  Right now I‘ll just thank
the developers for the nudge that brought modern IPC to stock ``vim``.

.. rubric:: Footnotes

.. [1] Or today if you‘re not capable of a few configuration hacks and are
   using a modern Linux distro.
.. [2] Apparently, it is simply because ``xxd`` is *always* available and it
   wasn‘t a top choice option.

.. _MicroEMACS: ftp://ftp.cs.helsinki.fi/pub/Software/Local/uEmacs-PK/
.. _GNU Emacs: https://www.gnu.org/software/emacs/
.. _org-mode: http://www.orgmode.org/
.. _vim: http://www.vim.org/
.. _NeoVim: https://neovim.io/
