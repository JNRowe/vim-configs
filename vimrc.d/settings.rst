``vimrc.d/settings.vim``
========================

.. include:: ../.includes/vim9script.rst

.. include:: ../.includes/scriptencoding.rst

I want backups, but not in the project tree and I never want to accidentally
overwrite a :command:`cp --link` tree::

    set backup
    set backupcopy=auto,breakhardlink
    &backupdir = g:vim_cache_dir .. '/backup//'
    if !isdirectory(g:vim_cache_dir .. '/backup')
        call mkdir(g:vim_cache_dir .. '/backup', 'p', 0700)
    endif

I don’t often open :wikipedia:`MHTML` files, but when I do it is only for quick
edits and the resulting often *huge* backups are practically always useless to
me.

::

    set backupskip+=*.mht*

.. warning::

    While you’re thinking about ``'backupskip'`` consider adding adding paths
    your password managers, :command:`sudoedit`-type files and other things
    where there could be dangerous leaks through backups.  I use passwordstore_
    which ships with a helpful configuration file that takes care of the details
    for me, which could also serve as inspiration for other uses.

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

Use the far prettier popup windows for completions::

    if has('popupwin')
        set completeopt+=popup
    endif

Enable fancy Unicode display, see the builtin ``rust`` filetype and
:repo:`vim-cute-python <ehamberg/vim-cute-python>` for examples::

    if has('conceal')
        set concealcursor=nc
        set conceallevel=2
    endif

Ask instead of just failing when there are edited buffers and you call
:kbd:`:q`::

    set confirm

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

    &directory = printf('%s/swap//,%s', g:vim_cache_dir, &directory)
    if !isdirectory(g:vim_cache_dir .. '/swap')
        call mkdir(g:vim_cache_dir .. '/swap', 'p', 0700)
    endif

:wikipedia:`UTF-8` should be default on all systems now, and |vim| will pick
that up via :envvar:`LANG`, but we’ll force it just in case::

    # vint: -ProhibitEncodingOptionAfterScriptEncoding
    set encoding=utf-8
    # vint: +ProhibitEncodingOptionAfterScriptEncoding
    if &modifiable
        # This is per buffer, and breaks when using stdin as buffer for example
        set fileencoding=utf-8
    endif
    if v:lang =~? 'utf-8'
        set fileencodings=utf-8,latin1,default
    endif

Only files that *must* contain tabs(:file:`Makefile`) *should* contain tabs::

    set expandtab

Use prettier :wikipedia:`Unicode box drawing character
<Box_Drawing-Unicode_block>` for a cleaner looking interface::

    set fillchars+=vert:│
    if has('patch-8.2.2524')
        set fillchars+=foldopen:┌
        set fillchars+=foldsep:│
    endif

.. _custom-foldtext:

Configure folding support::

    if has('folding')
        set fillchars+=fold:\   # Intentional trailing space
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
        &grepprg = printf(
            'grep -nH --exclude-from=%s/grep_excludes $* /dev/null',
            g:xdg_data_dir
        )
    endif

.. note::

    :command:`ag` is just *so* much faster that any incompatibility is worth
    the grief.

Allow unsaved modified buffers in the background::

    set hidden

.. important::

    Don’t worry if that sounds scary, |vim| will warn if you try to exit without
    saving them!


Highlight searches::

    set hlsearch

.. _set-ignorecase:

Ignore case in searches, working in conjunction with `smartcase
<set-smartcase>`_::

    set ignorecase

Use the case of the inserted text to choose the case of completed text::

    set infercase

Having ``=`` in filename matches are more trouble then they’re worth::

    set isfname-=\=

Don’t continually update the screen when executing non-interactive commands::

    set lazyredraw

Prefer line wrapping at visually appealing locations::

    if has('linebreak')
        set linebreak
    endif

Show “hidden” whitespace in buffers::

    set list

    set listchars=tab:␉·,extends:…,nbsp:␠
    if has('conceal')
        set listchars+=conceal:Δ
    endif

Include angle brackets in pair matching::

    set matchpairs+=<:>

.. _matchtime:

Show matching parenthesis for three tenths of a second::

    set matchtime=3

The way |vim| recognises numbers for :kbd:`<C-{a,x}>` isn’t always great, so
forcibly telling it treat numbers as unsigned means we at least get “a
standard” behaviour, even if it isn’t the most intuitive.

::

    set nrformats+=unsigned

.. tip::

    If the only date format you use is |ISO-8601| then disabling
    ``'nrformats'``’s octal mode and enabling unsigned should allow you seamless
    date fiddling without :repo:`vim-speeddating <tpope/vim-speeddating>`.

Always display relative line numbers in the GUI, but show actual line number
on current line::

    set number
    set relativenumber

.. image:: /.static/relative_numbering.png
   :alt: Example of combined numbering

.. _path-setting:

Don’t search for ``C`` includes from all filetypes::

    set path-=/usr/include

Use popup windows for previews::

    if has('textprop') || has('quickfix')
        set previewpopup=height:10
    endif

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

Save local options in session files, which is important for buffers that should
be displayed using ``'nolist'`` for example::

    set sessionoptions+=localoptions

Include terminal windows in sessions where possible::

    if has('mksession')
        set sessionoptions+=terminal
    endif

Make indentation always honour the user defined width::

    set shiftround

The *vast* majority of files I edit expect indentation to be four spaces::

    set shiftwidth=4

Disable |vim|’s intro message::

    set shortmess+=I

.. tip::

    If you’d like an intro screen, :repo:`vim-startify <mhinz/vim-startify>` is
    a :ref:`great replacement <vim-startify-intro>`.

Don’t show ``ins-completion-menu`` messages, they’re obvious from context and
the use of menu completion::

    set shortmess+=c

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
        const lang = split(v:lang, '\.')[0]
        &spellfile = printf('~/.vim/spell/%s.utf-8.add', lang)
        &spelllang = tolower(lang)

… and treat camel-cased words specially::

        set spelloptions+=camel
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

When switching buffers for ``quickfix`` jump to an existing window where
possible::

    set switchbuf=useopen

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

    This is enabled by |vim| for most terminal types that would support it, but
    the list |vim| uses is static and new terminals I’m testing can’t be added
    to it.

Enable undo files that cross sessions, and store those files in |XDG basedir|
compliant location::

    if has('persistent_undo')
        set undofile
        &undodir = printf('%s/undo//,%s', g:vim_data_dir, &undodir)
        if !isdirectory(g:vim_data_dir .. '/undo')
            call mkdir(g:vim_data_dir .. '/undo', 'p', 0700)
        endif
    endif

.. warning::

    You should give *serious* consideration to persistent undo before enabling
    it, as it quite clearly can lead to making all manner of previously
    ephemeral personal data persistent.  And, don’t forget that you can
    still :ref:`disable it locally <disable-undo-file>` if the need arises.

Double |vim|’s default swap file write time interval::

    set updatetime=8000

Store session files in |XDG basedir| compliant location::

    if has('mksession')
        &viewdir = g:vim_cache_dir .. '/view'
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
``r/media`` Ignore :file:`/media`
``r/tmp``   Ignore :file:`/tmp`
=========== =====================================================

::

    if has('viminfo')
        set viminfo='5000,<1000,%,r/media,r/tmp
        &viminfofile = g:vim_cache_dir .. '/viminfo'
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

Ignore files which we are unlikely to want to edit; PDF, |vim|’s swap files,
object and static library files, editor backups and sqlite_ databases.

::

    if has('wildignore')
        set wildignore+=*.pdf,*.swp,*.[ao],*~,*.db
    endif

Ignore case when completing files::

    set wildignorecase

.. note::

    It is a real shame this doesn’t honour the ``'smartcase'`` configuration and
    style.  The behaviour of this option is closer to the less useful — in
    my eyes — ``'ignorecase'``.

Insert longest common match when completing::

    set wildmode^=longest:full

Set string to show `wrapped lines <breakindentopt>`_::

    if has('linebreak')
        let &showbreak='» '
    endif

Use buffer and command name in window title::

    if has('title')
        set titlestring=
        set titlestring+=%{display#readable_path(expand('%'))}
        set titlestring+=\ -\ %{v:progname}  # Program name
    endif

The default minimum window height of one line is not useful enough to be
worthwhile, so allow window borders to touch::

    set winminheight=0

.. _passwordstore: https://www.passwordstore.org/
.. _Debian: https://debian.org/
.. _wordlist: http://wordlist.sourceforge.net/
.. _miscfiles: https://savannah.gnu.org/projects/miscfiles/
.. _sqlite: https://sqlite.org/

.. spelling::

    keycodes
    linewise
