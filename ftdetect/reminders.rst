``ftdetect/reminders.vim``
==========================

I use a remind_ a *lot*, as I write this there are 476 active reminders tucked
away in there.  Taking advantage of the ``INCLUDE`` directive and allowing all
your reminder files to live in their own directory seems like the only sane way
to handle this.

::

    autocmd BufRead,BufNewFile ~/.reminders.d/* setfiletype remind

.. _remind: http://www.roaringpenguin.com/products/remind
