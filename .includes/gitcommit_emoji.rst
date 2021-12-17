A few co-workers are now decorating their commits with emojis for expressing
their types, and I’ll *try* to do so when committing to those projects::

    for [s:key, s:char] in [['new', '🌟'], ['del', '❌'], ['fix', '🐛'],
    \                       ['ref', '⟳'], ['tool', '🔨']]
        silent execute 'iabbrev <buffer> _' . s:key . ' ' . s:char
    endfor
