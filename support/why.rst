Why ``$x`` (and other coding style questions)
=============================================

This document mentions things that you *may* find odd that have been given
*some* consideration.  It doesn’t mean I won’t change my mind about the things
mentioned below, it just means I had a [possibly weak] reason for doing
something *at the time* it was written.

If you find other things that seem odd or you simply know better ways to do
things, then *please* open an |issue| or drop me a |mail|!

.. contents::
    :local:

Why do you use ``l:`` prefix for local variables?
-------------------------------------------------

I really like the explicit nature of using the ``l:`` prefix.  While it is nice
that you can [often] define and refer to local variables without the explicit
namespace, doing so introduces a little mental processing to detect scope.
