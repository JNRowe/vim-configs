``vimrc.d/settings.vim``
========================

.. include:: ../.includes/scriptencoding.rst

I want backups, but not in the project tree and I never want to accidentally
overwrite a :command:`cp --link` tree::

    set backup
    set backupcopy=auto,breakhardlink
    let &backupdir = g:vim_cache_dir . '/backup//'
    if !isdirectory(g:vim_cache_dir . '/backup')
        call mkdir(g:vim_cache_dir . '/backup', 'p', 0700)
    endif

Where necessary, remove duplicates entries for readability::

    if !has('patch-8.1.1519')
        let &backupskip = join(uniq(split(&backupskip, ',')), ',')
    endif

.. note::

    The duplicates occur because :command:`vim` defaults to including
    ``$TEMP``, ``$TMPDIR`` and ``$TMP`` which are often symlinks to the same
    locations.

I don’t often open :wikipedia:`MHTML` files, but when I do it is only for quick
edits and the resulting often *huge* backups are practically always useless to
me.

::

    set backupskip+=*.mht*

Enable tooltips::

    if has('balloon_eval')
        set ballooneval
    endif

.. _breakindentopt:

Keep indent between wrapped lines and display the pretty `'showbreak'
<showbreak>`_ indicator::

    if has('linebreak')
        set breakindent
        set breakindentopt=sbr
    endif

.. _colorcolumn-config:

Show a marker as maximum line length cue::

    set colorcolumn=+1

Show completion popup even where there is only a single item, this allows us to
see the call signature in supported filetypes for example.

::

    set completeopt+=menuone

Enable fancy Unicode display, see the builtin ``rust`` filetype and
:repo:`vim-cute-python <ehamberg/vim-cute-python>` for examples::

    if has('conceal')
        set concealcursor=nc
        set conceallevel=2
    endif

Ask instead of just failing when there are edited buffers and you call
:kbd:`:q`::

    set confirm

Select a :vimdoc:`safer encryption method <options.txt#blowfish2>` if available
or warn about weakened encryption::

    if has('cryptv')
        if has('patch-7.4.401')
            set cryptmethod=blowfish2
        else
            let v:warningmsg = 'Using old blowfish cryptmethod'
            echohl WarningMsg
            echomsg v:warningmsg
            echohl none
            set cryptmethod=blowfish
        endif
    endif

.. tip::

    While the built-in encryption support can be useful at times, a better
    solution is probably to use an external tool that can be accessed outside
    :command:`vim`.  For instance, gnupg_ which can be supported transparently
    via :repo:`vim-gnupg <jamessan/vim-gnupg>`.

Highlight the current line, but only `when it will be useful
<dynamic-cursorline>`_::

    set cursorline

If a wordlist is available use it as the completion dictionary::

    if filereadable('/usr/share/dict/words')
        set dictionary^=/usr/share/dict/words
    endif

.. tip::

    On Debian_ systems this file tends to be provided by packages from the
    wordlist_ project(see ``aptitude search '~Pwordlist'`` for options).  On
    other systems, and possibly on Debian too, it may be provided by GNU’s
    miscfiles_ package.

Keep swap files in |XDG basedir| compliant location::

    let &directory = g:vim_cache_dir . '/swap//,' . &directory
    if !isdirectory(g:vim_cache_dir . '/swap')
        call mkdir(g:vim_cache_dir . '/swap', 'p', 0700)
    endif

:wikipedia:`UTF-8` should be default on all systems now, and :command:`vim` will
pick that up via :envvar:`LANG`, but we’ll force it just in case::

    " vint: -ProhibitEncodingOptionAfterScriptEncoding
    set encoding=utf-8
    " vint: +ProhibitEncodingOptionAfterScriptEncoding
    if &modifiable
        " This is per buffer, and breaks when using stdin as buffer for example
        set fileencoding=utf-8
    endif
    if v:lang =~? 'utf-8'
        set fileencodings=utf-8,latin1,default
    endif

Only files that *must* contain tabs(:file:`Makefile`) *should* contain tabs::

    set expandtab

If the term can support it, use box drawing character for unbroken vertical
split bar::

    if &termencoding ==# 'utf-8' || has('gui_running')
        set fillchars+=vert:│
    endif

.. _custom-foldtext:

Configure folding support::

    if has('folding')
        set fillchars+=fold:\   " Intentional trailing space
        set foldcolumn=2
        set foldlevelstart=99
        set foldmethod=syntax
        set foldtext=display#fold_text()
    endif

.. image:: /.static/fold_text.png
   :alt: Examples of display#fold_text() display

Configure formatting:

================ ====================================
Option           Use
================ ====================================
``r``            Continue comment on :kbd:`<Enter>`
``n``            Indent text in number lists
``l`` (lower L)  Don’t automatically break long lines
``1`` (number 1) Don’t break line on one letter word
================ ====================================

::

    set formatoptions+=rnl1

When :repo:`the_silver_searcher <ggreer/the_silver_searcher>` is installed
*always* use it::

    if executable('ag')
        set grepprg=ag\ --vimgrep
        set grepformat=%f:%l:%c:%m
    else
        let &grepprg = 'grep -nH '
        \   . '--exclude-from=' . g:xdg_data_dir . '/grep_excludes '
        \   . '$* /dev/null'
    endif

.. note::

    :command:`ag` is just *so* much faster that any incompatibility is worth
    the grief.

Allow unsaved modified buffers in the background::

    set hidden

.. important::

    Don’t worry if that sounds scary, :command:`vim` will warn if you try to
    exit without saving them!

.. _set-ignorecase:

Ignore case in searches, working in conjunction with `smartcase
<set-smartcase>`_::

    set ignorecase

Use the case of the inserted text to choose the case of completed text::

    set infercase

Having ``=`` in filename matches are more trouble then they’re worth::

    set isfname-=\=

Use :command:`vim`’s builtin manpage support::

    set keywordprg=:Man

.. note::

    When :ref:`vim-man <vim-man-plugin>` is installed it overrides the ``:Man``
    command with an enhanced version.

Don’t continually update the screen when executing non-interactive commands::

    set lazyredraw

Prefer line wrapping at visually appealing locations::

    if has('linebreak')
        set linebreak
    endif

Show “hidden” whitespace in buffers::

    set list

    if &termencoding ==# 'utf-8' || has('gui_running')
        set listchars=tab:␉·,extends:…,nbsp:␠
        if has('conceal')
            set listchars+=conceal:Δ
        endif
    else
        set listchars=tab:>-,extends:>,nbsp:_
    endif

Include angle brackets in pair matching::

    set matchpairs+=<:>

.. _matchtime:

Show matching parenthesis for three tenths of a second::

    set matchtime=3

Always include ``octal`` in ``'nrformats'`` as the :file:`defaults.vim` will
unset it on some systems::

    set nrformats+=octal

.. note::

    This is mostly for having a standard behaviour across installations, I could
    just as easily live with excluding ``octal`` as long it was *always*
    disabled.

Support increment and decrement on single characters too::

    set nrformats+=alpha

.. note::

    I’m unsure if I want this, but I’m playing with it for lists in text.
    Should it only be in :file:`prose.rst`?

Disable line numbering by default, but `not in the GUI <gui-linenumbers>`_::

    set nonumber

Set an upper limit to the popup menu, as full screen height *feels* quite
unusable::

    if has('insert_expand')
        set pumheight=10
    endif

If available default to |Python| 3::

    if has('pythonx') && has('python3')
        set pyxversion=3
    endif

Always display count of changed lines::

    set report=0

Keep cursor line centred::

    set scrolloff=100

Include terminal windows in sessions where possible::

    if has('mksession')
        set sessionoptions+=terminal
    endif

Make indentation always honour the user defined width::

    set shiftround

The *vast* majority of files I edit expect indentation to be four spaces::

    set shiftwidth=4

Disable :command:`vim`’s intro message::

    set shortmess+=I

.. tip::

    If you’d like an intro screen, :repo:`vim-startify <mhinz/vim-startify>` is
    a :ref:`great replacement <vim-startify-intro>`.

Don’t show ``ins-completion-menu`` messages, they’re obvious from context and
the use of menu completion::

    set shortmess+=c

.. _matchpos:

Show match position when searching::

    if has('patch-8.1.1270')
        set shortmess-=S
    endif

Always display partial commands::

    if has('cmdline_info') && has('showcmd')
        set showcmd
    endif

Make completion popups show complete matches that may include call tips and
other useful information::

    set showfulltag

Hop to matching parenthesis when inserting closing character as a visual
hint::

    set showmatch

.. tip::

    You can adjust the “flash time” with `'matchtime' <matchtime>`_.

No need to display current mode as :repo:`vim-airline <vim-airline/vim-airline>`
changes the statusline to indicate mode::

    set noshowmode

.. _set-smartcase:

Make searches case insensitive when an upper case character is typed, as an
addition to `ignorecase <set-ignorecase>`_::

    set smartcase

Make insert mode :kbd:`<Tab>` perform indentation aware movement::

    set softtabstop=-1

Configure spell checking and include a personal spell checking list for use
with :kbd:`zg`::

    if has('spell')
        set spell
        let s:lang = split(v:lang, '\.')[0]
        execute 'set spellfile=~/.vim/spell/' . s:lang . '.utf-8.add'
        execute 'set spelllang=' . tolower(s:lang)
    endif

Prefer making horizontal splits toward the bottom of the screen::

    set splitbelow

… and vertical splits toward the right of the screen::

    set splitright

Don’t jump to the start of a line when changing buffers or issuing linewise
edits::

    set nostartofline

Adjust completion to make ``.lua`` lower priority so that :repo:`moonscript
<leafo/moonscript>` files are preferred::

    set suffixes+=.lua

Limit line length to 80 characters, but be aware that some filetypes will
override this to match community standards::

    set textwidth=80

Make :kbd:`~` available as an operator::

    set tildeop

Only timeout on keycodes::

    set notimeout
    set ttimeout

Set title in terminals::

    set title

Use smoother redraws::

    set ttyfast

.. note::

    This is enabled by :command:`vim` for most terminal types that would
    support it, but the list :command:`vim` uses is static and new terminals
    I’m testing can’t be added to it.

Enable undo files that cross sessions, and store those files in |XDG basedir|
compliant location::

    if has('persistent_undo')
        set undofile
        let &undodir = g:vim_data_dir . '/undo//,' . &undodir
        if !isdirectory(g:vim_data_dir . '/undo')
            call mkdir(g:vim_data_dir . '/undo', 'p', 0700)
        endif
    endif

.. warning::

    You should give *serious* consideration to persistent undo before enabling
    it, as it quite clearly can lead to making all manner of previously
    ephemeral personal data persistent.  And, don’t forget that you can
    still :ref:`disable it locally <disable-undo-file>` if the need arises.

Double :command:`vim`’s default swap file write time interval::

    set updatetime=8000

Store session files in |XDG basedir| compliant location::

    if has('mksession')
        let &viewdir = g:vim_cache_dir . '/view'
        if !isdirectory(&viewdir)
            call mkdir(&viewdir, 'p', 0700)
        endif
    endif

Configure ``'viminfo'`` and store :file:`viminfo` files in |XDG basedir|
compliant location:

=========== =====================================================
Option      Use
=========== =====================================================
``'5000``   Store marks for 5000 files
``<1000``   Save up to 1000 lines for registers
``%``       Store buffer list, which is nice for cycling sessions
``h``       Disable ``'hlsearch'`` when :file:`viminfo` is loaded
``r/media`` Ignore /media
``r/tmp``   Ignore /tmp
=========== =====================================================

::

    if has('viminfo')
        set viminfo='5000,<1000,%,h,r/media,r/tmp
        let &viminfofile = g:vim_cache_dir . '/viminfo'
    endif

.. note::

    The mark and register count are high enough that we are unlikely to lose
    history, but also capped so that they can’t act as local :abbr:`DoS
    (Denial of Service)`.

Allow moving to “empty” blocks in visual block mode::

    if has('virtualedit')
        set virtualedit=block
    endif

Allow moving over lines with :kbd:`<Left>` and :kbd:`<Right>` in normal,
visual, insert and replace modes::

    set whichwrap+=<,>,[,]

Ignore files which we are unlikely to want to edit; PDF, :command:`vim`’s swap
files, object and static library files, editor backups and sqlite_ databases.

::

    if has('wildignore')
        set wildignore+=*.pdf,*.swp,*.[ao],*~,*.db
    endif

Ignore case when completing files::

    set wildignorecase

.. note::

    It is a real shame this doesn’t honour the ``smartcase`` configuration and
    style.  The behaviour of this option is closer to the less useful — in
    my eyes — ``ignorecase``.

Insert longest common match when completing::

    set wildmode^=longest:full

Set string to show `wrapped lines <breakindentopt>`_::

    if has('linebreak')
        if &termencoding ==# 'utf-8' || has('gui_running')
            let &showbreak='» '
        else
            let &showbreak='> '
        endif
    endif

Use buffer and command name in window title::

    if has('title') && (has('gui_running') || &title)
        function! RelativeName() abort
            " Dig in to projectionist’s data for project root
            let l:p = get(b:, 'projectionist', {})
            if l:p != {}
                return substitute(expand('%:p'), '^' . keys(l:p)[0] . '/',
                \                 '', '')
            else
                return expand('%')
            endif
        endfunction
        set titlestring=
        set titlestring+=%{RelativeName()}  " File name
        set titlestring+=\ -\ %{v:progname} " Program name
    endif

The default minimum window height of one line is not useful enough to be
worthwhile, so allow window borders to touch::

    set winminheight=0

.. _gnupg: https://www.gnupg.org/
.. _Debian: https://debian.org/
.. _wordlist: http://wordlist.sourceforge.net/
.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
.. _sqlite: https://sqlite.org/
