The directory contains feature and plugin specific configuration data.

FAQ
===

Why do some filenames end with ``.vim.vim``
-------------------------------------------

Filenames are made to closely match the plugin name, so that a simple ``git``
commit hook can check that the external exists and that the config is named
correctly.

But yeah, I agree it is kind of ugly.

Why all the dynamic expansion for ``loaded_*`` vars?
----------------------------------------------------

I'm glad you asked.  It takes practically no extra time at read, and means
I can just template up new config files.

The old ones are also that way to make it less effort to dive in to a random
file.
