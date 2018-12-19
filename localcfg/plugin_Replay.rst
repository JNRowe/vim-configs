``localcfg/plugin_Replay.vim``
==============================

Record video of replay sessions when possible::

    if exists('$DISPLAY') && executable('ffmpeg')
       let g:replay_record = v:true
    endif
