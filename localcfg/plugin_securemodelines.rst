``localcfg/plugin_securemodelines.vim``
=======================================

With this plugin we don’t want builtin modeline support::

    set nomodeline

I like to know what is being skipped, mostly so that I can enable any options
which turn out to be safe *and* valuable::

    let g:secure_modelines_verbose = v:true

Don’t look beyond three lines::

    let g:secure_modelines_modelines = 3
