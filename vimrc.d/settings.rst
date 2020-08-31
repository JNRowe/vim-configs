``vimrc.d/settings.vim``
========================

.. include:: ../.includes/scriptencoding.rst

Change to current buffer’s directory::

    set autochdir

.. note::

    Many people seem to really dislike this option, but it seems to really
    suit the way I work.  If I want paths anchored from my project root
    I can always switch to the build terminal and open them from there.

I want backups, but not in the project tree and I never want to accidentally
overwrite a :command:`cp --link` tree::

    set backup
    set backupcopy=auto,breakhardlink
    let &backupdir = g:vim_cache_dir . '/backup//'
    call mkdir(g:vim_cache_dir . '/backup', 'p', 0700)

I don’t often open :wikipedia:`MHTML` files, but when I do it is only for quick
edits and the resulting *huge* backups are practically always useless to me.

::

    set backupskip+=*.mht*

Enable tooltips::

    if has('balloon_eval')
        set ballooneval
    endif

.. _breakindentopt:

Keep indent between wrapped lines and display the pretty `'showbreak'
<showbreak>`_ indicator::

    set breakindent
    set breakindentopt=sbr

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

Select a *safer* encryption default method if available or warn about
weakened encryption::

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

Highlight the current line but only `when it will be useful
<dynamic-cursorline>`_::

    set cursorline

If miscfiles_ is installed use its dictionary::

    if filereadable('/usr/share/dict/words')
        set dictionary^=/usr/share/dict/words
    endif

Keep swap files in `XDG basedir`_ compliant location::

    let &directory = g:vim_cache_dir . '/swap//,' . &directory
    call mkdir(g:vim_cache_dir . '/swap', 'p', 0700)

:wikipedia:`UTF-8` should be default on all systems now, and :command:`vim` will
pick that up via :envvar:`LANG`, but we’ll force it just in case::

    " vint: -ProhibitEncodingOptionAfterScriptEncoding
    set encoding=utf-8
    " vint: +ProhibitEncodingOptionAfterScriptEncoding
    set fileencoding=utf-8
    if v:lang =~? 'utf-8'
        set fileencodings=utf-8,latin1,default
    endif

Only files that *must* contain tabs(:file:`Makefile`) *should* contain tabs::

    set expandtab

If the term can support it use fancy Unicode for vertical split bar::

    if &termencoding ==# 'utf-8' || has('gui_running')
        set fillchars+=vert:│
    endif

Configure folding support including `fold display <custom-foldtext>`_::

    if has('folding')
        set fillchars+=fold:\   " Intentional trailing space
        set foldcolumn=2
        set foldlevelstart=99
        set foldmethod=syntax
        set foldtext=MyFoldText()
    endif

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
            \ . '--exclude-from=' . g:xdg_data_dir . '/grep_excludes $* /dev/null'
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

Make completion use the case of currently inserted text::

    set infercase

Having ``=`` in filename matches are more trouble then they’re worth::

    set isfname-=\=

Use :command:`vim`’s builtin manpage support by default::

    set keywordprg=:Man

Don’t continually update screen when executing non-interactive commands::

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
unset on some systems::

    set nrformats+=octal

.. note::

    This is mostly for having a standard behaviour across installations, I could
    just as easily live with excluding ``octal`` as long it was *always*
    disabled.

Disable line numbering by default, but `not in the GUI <gui-linenumbers>`_::

    set nonumber

Set an upper limit to the popup menu, as full screen height “feels” quite
unusable::

    if has('insert_expand')
        set pumheight=10
    endif

If available default to Python_ 3::

    if has('pythonx') && has('python3')
        set pyxversion=3
    endif

Always display count of changed lines::

    set report=0

Keep cursor line centred::

    set scrolloff=100

While *marginally* less secure using temporary files allows better handling of
encoding for pipes::

    if has('filterpipe')
        set noshelltemp
    endif

Make indentation always use user’s defined width::

    set shiftround

The *vast* majority of files I edit expect indentation to be four spaces::

    set shiftwidth=4

Disable :command:`vim`’s intro message, which would be displayed if
:repo:`vim-startify <mhinz/vim-startify>` is ever removed::

    set shortmess+=I

Don’t show ``ins-completion-menu`` messages, they’re obvious from context::

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

Make completion popups show complete matches which can often be used as call
tip::

    set showfulltag

Hop to matching parenthesis when inserting closing character as a visual
hint::

    set showmatch

.. note::

    You can adjust the “flash time” with `'matchtime' <matchtime>`_.

No need to display current mode as :repo:`vim-airline <vim-airline/vim-airline>`
changes the statusline to indicate mode::

    set noshowmode

.. _set-smartcase:

Make searches case in sensitive when an upper case character is typed, working
in conjunction with `ignorecase <set-ignorecase>`_::

    set smartcase

Pretend that :kbd:`<Tab>` is four spaces::

    set softtabstop=4

Configure spell checking and include a personal spell checking list for use
with :kbd:`zg`::

    if has('spell')
        set spell
        let s:lang = substitute($LANG, '\..*', '', '')
        execute 'set spellfile=~/.vim/spell/' . s:lang . '.utf-8.add'
        execute 'set spelllang=' . tolower(s:lang)
    endif

Prefer horizontal splits toward the bottom of the screen::

    set splitbelow

… and vertical splits toward the right of the screen::

    set splitright

Don’t jump to the start of line when changing buffers or issuing linewise
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

Enable undo files that cross sessions, and store those files in `XDG basedir`_
compliant location::

    if has('persistent_undo')
        set undofile
        let &undodir = g:vim_data_dir . '/undo//,' . &undodir
        call mkdir(g:vim_data_dir . '/undo', 'p', 0700)
    endif

.. warning::

    You should give *serious* consideration to persistent undo before enabling
    it, as it quite clearly can lead to making all manner of previously
    ephemeral personal data persistent.  And, don’t forget that if you do
    choose to enable it then you can still disable it on a per-filetype basis if
    the need arises.

Double :command:`vim`’s default swap file write time interval::

    set updatetime=8000

Store session files in `XDG basedir`_ compliant location::

    if has('mksession')
        let &viewdir = g:vim_cache_dir . '/view'
        call mkdir(&viewdir, 'p', 0700)
    endif

Configure ``'viminfo'`` and store :file:`viminfo` files in `XDG basedir`_
compliant location:

========= =====================================================
Option    Use
========= =====================================================
``'5000`` Store marks for 5000 files
``<1000`` Save up to 1000 lines for registers
``h``     Disable ``'hlsearch'`` when :file:`viminfo` is loaded
========= =====================================================

::

    if has('viminfo')
        set viminfo='5000,<1000,h
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
visual, insert and replace::

    set whichwrap+=<,>,[,]

Ignore files which we are unlikely to want to edit; PDF, :command:`vim`’s swap
files, object and static library files, editor backups and sqlite_ databases.

::

    if has('wildignore')
        set wildignore+=*.pdf,*.swp,*.[ao],*~,*.db
    endif

Insert longest common match by default::

    set wildmode^=longest:full

Use fancy Unicode characters to show for `wrapped lines <breakindentopt>`_::

    if has('linebreak')
        let &showbreak='» '
    endif

Use buffer and command name in window title::

    if has('title') && (has('gui_running') || &title)
        set titlestring=
        set titlestring+=%F " File name
        set titlestring+=\ -\ %{v:progname} " Program name
    endif

.. _custom-foldtext:

Custom foldtext setting::

    if has('folding')
        function! s:shorten(text, line_str)
            let l:text = a:text
            " Non-getline() text length
            let l:base = 19
            let l:text_width = winwidth(0) - v:foldlevel - len(a:line_str) - l:base
            if strlen(l:text) > l:text_width
                let l:text = l:text[:l:text_width] . '…'
            endif
            return l:text
        endfunction

        function! MyFoldText()
            return substitute(foldtext(), '^+-\(-\+\)\s*\(\d\+\) lines: \(.*\)',
                \             {m -> repeat('─', v:foldlevel) . ' ' .
                \                   s:shorten(m[3], m[2]) . '▼ ' . m[2] . ' lines'},
                \             '')
        endfunction
    endif

.. image:: /.static/myfoldtext.png
   :alt: Examples of MyFoldtext() display

.. note::

    Parsing ``foldtext()`` *may* be brittle, but manual creation is loads of
    work; whitespace, ``&cms`` :abbr:`RegEx (Regular Expression)` escaping(C
    fex), ``&fdr``, no ``scanf()``, &c.

.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
.. _XDG basedir: http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
.. _Python: https://www.python.org/
.. _sqlite: https://sqlite.org/
