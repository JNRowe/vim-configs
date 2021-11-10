``localcfg/plugin_vim_peekaboo``
================================

When I know the register I’m aiming for I’ll hit it quick enough to still see an
annoying flash, so skip the display for short delays::

    let g:peekaboo_delay = 250

The full register listing with its extra whitespace *feels* cleaner to me::

    let g:peekaboo_compact = v:false
