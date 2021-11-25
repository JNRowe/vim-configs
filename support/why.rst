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

Why do you indent ``viml`` so strangely?
----------------------------------------

My current indentation rules result favour this::

    function! display#fold_text() abort
        return substitute(
        \   foldtext(), '^+-\(-\+\)\s*\(\d\+\) lines: \(.*\)',
        \   {m -> repeat('─', v:foldlevel) . ' ' .
        \         <SID>shorten(m[3], m[2]) . '▼ ' . m[2] . ' lines'},
        \   ''
        \ )
    endfunction

whereas previously I would’ve indented the ``\`` characters too.  Neither option
is a good one, but |vim|’s prefixed line continuations means there isn’t
a better option available.

This current iteration breaks using the indentation as a text object(which is
annoying), but it does mean there is a little less whitespace needed for each
indent(which is good).

The other rule visible in the above example are that continued lines *must*
align with opening brace/argument.  You can see that the lambda continues on the
next line without much effort, and you can also see that the ``repeat()`` call
has been closed.

Again, there are few good choices here.  If *you* know of a cleaner way to deal
with style issues in vim…
