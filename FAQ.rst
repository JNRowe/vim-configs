Frequently Asked Questions
==========================

This can't *possibly* be worth it
---------------------------------

Okay, thanks for pointing that out.

Why don't you support reloading of config files?
------------------------------------------------

A search through the history will show that this repository did, for a long
time, support reloading the configs.  However, the whole process is incredibly
brittle and really not all that useful.

``vim`` re-starts so quickly that it isn't worth the grief to support reloading,
especially given how annoying it is to handle all the tiny corner cases that
make the process a complete nightmare to debug.

I'd pay the cost if the cycle time was even close to a second, but it isn't.
Plus combined with ``mksession`` the editor pops back up in the editing state
as if we were using live reloading.
