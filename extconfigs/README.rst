The directory contains plugin specific configuration data.

FAQ
===

Why do some filenames end with ``.vim.vim``
-------------------------------------------

Filenames are made to match the external name, so that a simple git commit hook
with ``${fn:t:r}`` can check that the external exists and whether the config is
named correctly.

But yeah, I agree it is kind of ugly.
