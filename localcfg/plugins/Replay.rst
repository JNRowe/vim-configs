``localcfg/plugins/Replay.vim``
===============================

.. include:: ../../.includes/scriptversion.rst

Record video of replay sessions when possible::

    if exists('$DISPLAY') && executable('ffmpeg')
       const g:replay_record = v:true
    endif
