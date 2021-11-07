``ftdetect/reminders.vim``
==========================

I use a |remind| a *lot*, as I write this there are 476 active reminders tucked
away in there.  Taking advantage of the ``INCLUDE`` directive and allowing all
your reminder files to live in their own directory seems like the only sane way
to handle this.

::

    " vint: -ProhibitAutocmdWithNoGroup
    autocmd BufRead,BufNewFile ~/.reminders.d/* setfiletype remind
    " vint: +ProhibitAutocmdWithNoGroup
