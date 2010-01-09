" DotOutlineTree
"================
"
"   After sourcing this plugin, you can make outline of your document by
"   pressing ':DOT'.
"
" Description:
"-------------
"
"   This plugin makes outline of a document.
"
"   Currently, it supports three formats:
"       - reStructuredText
"       - TaskPaper
"       - dot-structured text (.. title)
"
" Maintainer:
"------------
"
"   Shuhei Kubota <kubota.shuhei+vim@gmail.com>
"
" Install Description:
"---------------------
"
"   Put this plugin in your plugin directory (e.g. $VIMRUNTIME/plugin). Then
"   restart VIM.
"
" Usage:
"-------
"
" Basic Commands
"~~~~~~~~~~~~~~~
"
"   :DotOutlineTree (:DOT)
"
"       This command constructs an outline tree, and shows an outline window.
"       But it does scanning the buffer, structuring nodes, and outputting the
"       data every time. This makes VIM slow at the moment.
"
" Key Mappings (and Commands)
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
"       <Enter>:
"           jumps to the node.
"           (:DOTJump)
"
"       r:
"           refreshes the outline tree.
"           (:DOTUpdate)
"
"       <Esc>:
"           escapes from the outline window, leaving it shown.
"           (:DOTEscape)
"
"       q:
"           escapes from the outline window, hiding it.
"           (:DOTQuit)
"
"       <C-H>:
"           creates an uncle node.
"           (:DOTCreateUncleNode)
"
"       <C-J>, o:
"           creates a next sibling node.
"           (:DOTCreateSiblingNode)
"
"       <C-K>:
"           creates a child node.
"           (:DOTCreateChildNode)
"
"       <C-L>:
"           creates a last child node.
"           (:DOTCreateChildNodeL)
"
"       d:
"           deletes a node. If the node which the cursor is on  has children,
"           they are deleted recursively.
"           (:DOTDeleteNode)
"
"       <C-U>:
"           flips nodes upward.
"           e.g. (<C-U>ing on a node `hoge')
"             .foo     .hoge
"             .hoge => ..piyo
"             ..piyo   .foo
"             .bar     .bar
"           (:DOTFlipUpward)
"
"           This operation may break a structure of text.
"           Then, press u to undo.
"
"       <C-D>:
"           flips nodes downward.
"           e.g. (<C-D>ing on a node `hoge')
"             .foo     .foo
"             .hoge => .bar
"             ..piyo   .hoge
"             .bar     ..piyo
"           (:DOTFlipDownward)
"
"           This operation may break a structure of text.
"           Then, press u to undo.
"
"       <<:
"           brings up the level of nodes.
"           e.g.
"             ...hoge => ..hoge
"           (:DOTDecLevel)
"
"       >>:
"           brings down the level of nodes.
"           e.g.
"             ...hoge => ....hoge
"           (:DOTIncLevel)
"
"       u:
"           undoes.
"           This command is forwarded to a text buffer.
"           (:DOTUndo)
"
"       <C-R>:
"           redoes.
"           This command is forwarded to a text buffer.
"           (:DOTRedo)
"
"       y:
"           copies the entire of the node and its descendant nodes.
"           (:DOTCopy)
"
"       p, P:
"           pastes text.
"           (:DOTPaste, :DOTPasteP)
"
"       h:
"           fold outline tree.
"           (if g:DOT_foldTree==1)
"
"       l:
"           unfold outline tree.
"           (if g:DOT_foldTree==1)
"
" Formats
"~~~~~~~~
"
" Supported Formats
"``````````````````
"
"   This plugin supports three formats. ('type_name')
"
"   - reStructuredText ('rest'):
"
"       Supports 'section headers'.
"
"       An added new level (child node) is always marked with :::::::, so you
"       need to modify marks.
"
"       TITLE
"       =====
"       TEXT
"       TEXT
"
"   - TaskPaper ('taskpaper'):
"
"       Supports 'project'. (but nested project is not supported)
"
"       PROJECT:
"       - TASK
"       - TASK
"
"   - dot-structured text ('base' or omitted)
"
"       . TITLE
"       TEXT
"       TEXT
"       .. CHILD TITLE
"       TEXT
"       TEXT
"
" Declaration
"````````````
"
"   DOT detects the type of your document automatically.
"   So, in most cases, you don't need to tell DOT what type of your document
"   is.
"
"   (YOU CAN SKIP THIS Declaration SECTION)
"
"   You can declare the format of your document.
"   There are two ways to do it.
"
"   1. append a type_name to modeline
"
"       like below.
"
"       /* vim:set et tw=60: <type_name> */
"       e.g. /* vim:set et tw=60: <rest> */
"
"   2. original 'outline' line
"
"       outline: <type_name>
"       e.g. outline: <taskpaper>
"
"   In any way, you declare a format (type_name), or 'base' format is used to
"   parse your document.
"
"
" Variables
"~~~~~~~~~~
"
"   (A right hand side value is a default value.)
"
"   b:DOT_newMethod = g:DOT_newMethod
"   g:DOT_newMethod = 'vertical new'
"
"       Commands above creates a new window. This variable specifies the way the
"       new window is created.
"
"       e.g. 'new'
"
"   b:DOT_windowSize = g:DOT_windowSize
"   g:DOT_windowSize = 30
"
"       The size of the new window.
"
"   b:DOT_closeOnJump = g:DOT_closeOnJump
"   g:DOT_closeOnJump = 0
"
"       After you decided to jump to some node...
"
"           0: the outline window will still be opened
"              (and a main text window is activated)
"           1: the window will be closed
"
"   b:DOT_useNarrow = g:DOT_useNarrow
"   g:DOT_useNarrow = 0
"
"       With this option on, you can narrow to text of the node you chose.
"       Other text is to be folded.
"
"       To enable this feature, you have to get the "narrow" plugin.
"       http://www.vim.org/scripts/script.php?script_id=2097
"
"   b:DOT_headingMark = g:DOT_headingMark
"   g:DOT_headingMark = '.'
"
"       A heading mark. This is used only in dot-structured text mode.
"       (<base> document type)
"
"   b:DOT_foldTree = g:DOT_foldTree
"   g:DOT_foldTree = 0
"
"       Show outline trees ...
"
"           0: unfolded (expanded)
"           1: folded
"

let s:DOT_OPTION_NEW_METHOD = 'DOT_newMethod'
if !exists('g:'.s:DOT_OPTION_NEW_METHOD)
    let g:DOT_newMethod = 'vertical new'
endif

let s:DOT_OPTION_WINDOW_SIZE = 'DOT_windowSize'
if !exists('g:'.s:DOT_OPTION_WINDOW_SIZE)
    let g:DOT_windowSize = '30'
endif

let s:DOT_OPTION_CLOSE_ON_JUMP = 'DOT_closeOnJump'
if !exists('g:'.s:DOT_OPTION_CLOSE_ON_JUMP)
    let g:DOT_closeOnJump = 0
endif

let s:DOT_OPTION_USE_NARROW = 'DOT_useNarrow'
if !exists('g:'.s:DOT_OPTION_USE_NARROW)
    let g:DOT_useNarrow = 0
endif

let s:DOT_OPTION_HEADING_MARK = 'DOT_headingMark'
if !exists('g:'.s:DOT_OPTION_HEADING_MARK)
    let g:DOT_headingMark = '.'
endif

let s:DOT_OPTION_FOLD_TREE = 'DOT_foldTree'
if !exists('g:'.s:DOT_OPTION_FOLD_TREE)
    let g:DOT_foldTree = 0
endif


command!        DOT                     :call <SID>DOT_execute(<line1>)
command!        DotOutlineTree          :call <SID>DOT_execute(<line1>)
" updating
command!        DOTUpdate               :call <SID>DOT_update()
" back to the text buffer
command!        DOTJump                 :call <SID>DOT_jump(<line1>)
command!        DOTEscape               :call <SID>DOT_escape()
command!        DOTQuit                 :call <SID>DOT_quit()
" creation / deletion
command!        DOTCreateSiblingNode    :call <SID>DOT_createSiblingNode(<line1>)
command!        DOTCreateChildNode      :call <SID>DOT_createChildNode(<line1>)
command!        DOTCreateChildNodeL     :call <SID>DOT_createChildNodeL(<line1>)
command!        DOTCreateUncleNode      :call <SID>DOT_createUncleNode(<line1>)
command! -range DOTDeleteNode           :call <SID>DOT_deleteNode(<line1>, <line2>)
" movement
command! -range DOTIncLevel             :call <SID>DOT_incLevel(<line1>, <line2>)
command! -range DOTDecLevel             :call <SID>DOT_decLevel(<line1>, <line2>)
command!        DOTFlipUpward           :call <SID>DOT_flipUpward(<line1>)
command!        DOTFlipDownward         :call <SID>DOT_flipDownward(<line1>)
" undo/redo
command!        DOTUndo                 :call <SID>DOT_undo()
command!        DOTRedo                 :call <SID>DOT_redo()
" clipboard
command! -range DOTCopy                 :call <SID>DOT_copy(<line1>, <line2>)
command!        DOTPaste                :call <SID>DOT_paste_p(<line1>)
command!        DOTPasteP               :call <SID>DOT_paste_P(<line1>)
" debugging
command!        DOTDump                 :call <SID>DOT_dump()


function! g:DOT_setOldDefaultKeyMap()
    call g:DOT_setDefaultKeyMap()

    " creation / deletion
    noremap  <buffer> <silent>  <C-J>   :DOTCreateUncleNode<CR>
    noremap  <buffer> <silent>  <C-K>   :DOTCreateSiblingNode<CR>
    noremap  <buffer> <silent>  <C-L>   :DOTCreateChildNode<CR>
    noremap  <buffer> <silent>  L       :DOTCreateChildNodeL<CR>
endfunction


function! g:DOT_setDefaultKeyMap()
    " updating
    noremap  <buffer> <silent>  r       :DOTUpdate<CR>

    " back to the text buffer
    noremap  <buffer> <silent>  <Enter> :DOTJump<CR>
    noremap  <buffer> <silent>  <Esc>   :DOTEscape<CR>
    noremap  <buffer> <silent>  q       :DOTQuit<CR>

    " creation / deletion
    noremap  <buffer> <silent>  <C-H>   :DOTCreateUncleNode<CR>
    noremap  <buffer> <silent>  <C-J>   :DOTCreateSiblingNode<CR>
    noremap  <buffer> <silent>  o       :DOTCreateSiblingNode<CR>
    noremap  <buffer> <silent>  <C-K>   :DOTCreateChildNode<CR>
    noremap  <buffer> <silent>  <C-L>   :DOTCreateChildNodeL<CR>
    noremap  <buffer> <silent>  d       :DOTDeleteNode<CR>

    " movement
    nnoremap  <buffer> <silent>  <<     :DOTDecLevel<CR>
    nnoremap  <buffer> <silent>  >>     :DOTIncLevel<CR>
    vnoremap  <buffer> <silent>  <      :DOTDecLevel<CR>
    vnoremap  <buffer> <silent>  >      :DOTIncLevel<CR>
    noremap  <buffer> <silent>  <C-U>   :DOTFlipUpward<CR>
    noremap  <buffer> <silent>  <C-D>   :DOTFlipDownward<CR>

    " undo/redo
    noremap  <buffer> <silent>  u       :DOTUndo<CR>
    noremap  <buffer> <silent>  <C-R>   :DOTRedo<CR>

    " clipboard
    noremap  <buffer> <silent>  y       :DOTCopy<CR>
    noremap  <buffer> <silent>  p       :DOTPaste<CR>
    noremap  <buffer> <silent>  P       :DOTPasteP<CR>

    " folding
    nnoremap <buffer> <silent>  l  zo
    nnoremap <buffer> <silent>  h  zc

    " cursor
    nnoremap <buffer> <silent>  j  j0
    nnoremap <buffer> <silent>  k  k0
endfunction



"--------------------
" Interfacese & main functions
"--------------------

let s:DOT_BUFFER_PREFIX = 'DotOutlineTree'
let s:DOT_DEFAULT_TYPE = 'base'
let s:DOT_INDENT_STRING = '  '
if !exists('g:DOT_types') | let g:DOT_types = [s:DOT_DEFAULT_TYPE] | endif


function! s:DOT_execute(dokozonoLineNum)
    let inTreeBuff = s:DOT__inTreeBuffer(bufnr('%'))

    call s:DOT_update()

    call s:DOT__openTreeBuffWindow(s:Util_getOption(s:DOT_OPTION_NEW_METHOD, 'vertical new'))
    call s:DOT__renderTree(b:DOT_rootNode.firstChild)

    " place the cursor
    let cursorPos = 0
    if inTreeBuff
        let cursorPos = a:dokozonoLineNum
    else
        let node = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
        let cursorPos = s:Node_getNodeIndex(b:DOT_rootNode, node)
    endif
    execute cursorPos

    if s:Util_getOption('DOT_foldTree', 0)
        setlocal foldmethod=manual
        call s:DOT__fold()
        if s:Util_getOption('DOT_foldTree', 0) == 1
            silent execute 'normal zv'
        else
            silent execute 'normal zO'
        endif
    endif
    silent execute 'normal 0'
endfunction


function! s:DOT__fold()
    let i = len(getbufline('%', 1, '$'))
    while i >= 1
        let node = s:Node_getNthNode(b:DOT_rootNode, i)
        let lastDescNode = s:Node_getLastDescendantNode(node)
        let lastIdx = s:Node_getNodeIndex(b:DOT_rootNode, lastDescNode)

        if i != lastIdx
            "echom i.','.lastIdx.'fold (' . node.title . '=>' . lastDescNode.title . ')'
            silent execute i.','.lastIdx.'fold'
        endif

        let i = i - 1
    endwhile
endfunction


function! s:DOT__renderTree(node)
    setlocal modifiable

    " stop the yank hijack
    let old_yank = @"

    " clear
    %delete

    " render tree
    call s:DOT__renderTreeInner(a:node)

    execute 0
    delete

    let @" = old_yank

    setlocal nomodifiable
endfunction


function! s:DOT__renderTreeInner(node)
    if (a:node is s:Node_NULL) || s:DOT__nodeIsTerminator(a:node) | return | endif
    "if a:node.title == ':NULL:' | return | endif

    call append(line('$'), repeat(s:DOT_INDENT_STRING, a:node.level - 1) . a:node.title)

    call s:DOT__renderTreeInner(a:node.firstChild)
    call s:DOT__renderTreeInner(a:node.nextSibling)
endfunction


function! s:DOT__openTreeBuffWindow(openMethod)
    if s:DOT__inTreeBuffer(bufnr('%'))
        " in a list buffer
        if bufexists(b:DOT_textBuffNum)
            " ok
        else
            " text buffer doesn't exist now
            throw 'text buffer ' . bufname(s:DOT_textBuffNum) . ' doesn''t exist any more'
        endif
    else
        " in a text buffer

        let treeBuffNum = bufnr(s:DOT_BUFFER_PREFIX . bufnr('%'), 1) " create unless it exists
        let b:DOT_treeBuffNum = treeBuffNum

        " open
        let listWinNum = bufwinnr(bufname(b:DOT_treeBuffNum))
        if listWinNum == -1
            " create window
            execute a:openMethod
            let windowSize = s:Util_getOption(s:DOT_OPTION_WINDOW_SIZE, '30')
            if match(a:openMethod, '[vV]') != -1
                execute windowSize . 'wincmd |'
            else
                execute windowSize . 'wincmd _'
            endif

            execute 'buffer ' . treeBuffNum
        else
            " focus
            execute listWinNum . 'wincmd w'
        endif
    endif
    "
    setlocal nowrap nonumber buftype=nofile bufhidden=delete noswapfile
    call g:DOT_keyMapFunction()

    setlocal foldtext=g:DOT_foldtext()
endfunction


function! g:DOT_foldtext()
    let node = s:Node_getNthNode(b:DOT_rootNode, v:foldstart)
    return repeat(s:DOT_INDENT_STRING, node.level - 1) . node.title . ' [' . (v:foldend - v:foldstart) . ']'
endfunction


function! s:DOT_update()
    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let textBuffNum = b:DOT_textBuffNum
        let treeBuffNum = bufnr('%')
    else
        let textBuffNum = bufnr('%')
        let treeBuffNum = bufnr(s:DOT_BUFFER_PREFIX . bufnr('%'), 1) " create unless it exists
    endif

    call setbufvar(textBuffNum, 'DOT_rootNode', s:DOT__buildNodeTree(textBuffNum))
    call setbufvar(textBuffNum, 'DOT_treeBuffNum', treeBuffNum)
    call setbufvar(treeBuffNum, 'DOT_rootNode', getbufvar(textBuffNum, 'DOT_rootNode'))
    call setbufvar(treeBuffNum, 'DOT_textBuffNum', textBuffNum)

    if !exists('b:DOT_foldTree')
        call setbufvar(treeBuffNum, 'DOT_foldTree', g:DOT_foldTree)
    endif

    if inTreeBuffer
        call s:DOT__renderTree(b:DOT_rootNode.firstChild)
        execute cursorPos
    endif

    " using Narrow
    if s:Util_getOption(s:DOT_OPTION_USE_NARROW, 0) != 0 && exists(':Widen')
        silent! execute 'Widen'
    endif
endfunction


function! s:DOT_escape()
    if !s:DOT__inTreeBuffer(bufnr('%')) | return | endif

    let textWinNum = bufwinnr(bufname(b:DOT_textBuffNum))
    execute textWinNum . 'wincmd w'
endfunction


function! s:DOT_quit()
    if s:DOT__inTreeBuffer(bufnr('%'))
        call s:Util_switchCurrentBuffer(b:DOT_textBuffNum, 'new')
    endif

    if exists('b:DOT_treeBuffNum')
        execute 'bdelete ' . b:DOT_treeBuffNum
        unlet b:DOT_treeBuffNum
    endif
    if exists('b:DOT_rootNode') | unlet b:DOT_rootNode | endif
endfunction


function! s:DOT_jump(dokozonoLineNum)
    if !s:DOT__inTreeBuffer(bufnr('%')) | return | endif

    call s:DOT_update()

    let node = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    let textBuffLineNum = node.lineNum

    call s:Util_switchCurrentBuffer(b:DOT_textBuffNum, 'new')

    execute textBuffLineNum
    normal zt

    " using Narrow
    if s:Util_getOption(s:DOT_OPTION_USE_NARROW, 0) != 0 && exists(':Narrow')
        let outofNarrowNode = s:Node_getNextNode(s:Node_getLastDescendantNode(node))

        silent! execute 'Widen'
        silent! execute node.lineNum . ',' . (outofNarrowNode.lineNum - 1) . 'Narrow'
    endif

    if s:Util_getOption(s:DOT_OPTION_CLOSE_ON_JUMP, 0) != 0 | call s:DOT_quit() | endif
endfunction


function! s:DOT__inTreeBuffer(buffNum)
    return (getbufvar(a:buffNum, 'DOT_textBuffNum') != '')
endfunction


function! s:DOT_createSiblingNode(dokozonoLineNum)
    call s:DOT__createNode(a:dokozonoLineNum, 0, 'Sibling')
endfunction


function! s:DOT_createChildNode(dokozonoLineNum)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
    endif

    if node is b:DOT_rootNode.lastChild
        echo 'You can''t create any node after the terminal node.'
        return
    endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    let title = input('First Child: ')
    if strlen(title) == 0 | return | endif

    let lineNumToInsert = s:Node_getNextNode(node).lineNum - 1 " insert just before the next node

    "echoe 'base:' . baseNode.title
    "echoe 'dest:' . lastNode.title
    "echoe 'lineNumToInsert:' . lineNumToInsert

    let sttype = getbufvar(buffNum, 'DOT_type')
    if strlen(sttype) == 0 | let sttype = 'base' | endif

    call s:Text_insertHeading(
                \ buffNum,
                \ lineNumToInsert,
                \ title,
                \ node.level + 1,
                \ 'g:DOT_' . sttype . 'DecorateHeading')

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos + 1
    endif
endfunction


function! s:DOT_createChildNodeL(dokozonoLineNum)
    call s:DOT__createNode(a:dokozonoLineNum, 1, 'Last Child')
endfunction


function! s:DOT_createUncleNode(dokozonoLineNum)
    call s:DOT__createNode(a:dokozonoLineNum, -1, 'Uncle')
endfunction


function! s:DOT_deleteNode(dokoLineNum1, dokoLineNum2)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum2)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum2)
    endif

    if node1 is b:DOT_rootNode
        echo 'You can''t delete nothing but nodes.'
        return
    endif
    if node2 is b:DOT_rootNode.lastChild
        echo 'You can''t delete the terminal node.'
        return
    endif

    let lastNode1 = s:Node_getLastDescendantNode(node1)
    let lastNode2 = s:Node_getLastDescendantNode(node2)

    let msg = 'Are you sure to delete '
    if (node1 is node2) 
        if (node1 isnot lastNode1)
            let msg = msg . '''' . node1.title . ''' and its decendants?'
        else
            let msg = msg . '''' . node1.title . ''' ?'
        endif
    else
         let msg = msg . 'these nodes?'
    endif

    echo msg . ' [y/N] '
    let answer = tolower(nr2char(getchar()))
    " clear
    normal :<Esc>
    if answer != 'y' | return | endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    let lastLineNum = max([
                \ s:Node_getNextNode(lastNode1).lineNum - 1,
                \ s:Node_getNextNode(lastNode2).lineNum - 1])
    call s:Text_deleteLines(node1.lineNum, lastLineNum)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_incLevel(dokoLineNum1, dokoLineNum2)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum2)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum2)
    endif

    if node1 is b:DOT_rootNode
        echo 'You can''t inclement nothing but nodes.'
        return
    endif
    if node2 is b:DOT_rootNode.lastChild
        echo 'You can''t inclement level of the terminal node.'
        return
    endif
    if node1 is b:DOT_rootNode.firstChild
        echo 'You can''t inclement level of the first top node.'
        return
    endif

    let lastNode = s:Node_getNextNode(s:Node_getLastDescendantNode(node2))
    let node = node1

    let sttype = getbufvar(buffNum, 'DOT_type')
    if strlen(sttype) == 0 | let sttype = 'base' | endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    while node isnot lastNode
        call s:Text_setHeading(buffNum, node.title, node.level + 1, node.lineNum, 'g:DOT_' . sttype . 'SetHeading')
        let node = s:Node_getNextNode(node)
    endwhile

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_decLevel(dokoLineNum1, dokoLineNum2)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum2)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum2)
    endif

    if node1 is b:DOT_rootNode
        echo 'You can''t declement nothing but nodes.'
        return
    endif
    if node2 is b:DOT_rootNode.lastChild
        echo 'You can''t declement level of the terminal node.'
        return
    endif
    if node1 is b:DOT_rootNode.firstChild
        echo 'You can''t declement level of the first top node.'
        return
    endif

    let lastNode = s:Node_getNextNode(s:Node_getLastDescendantNode(node2))

    " test run
    let node = node1
    while node isnot lastNode
        if node.level == 1
            echo 'Some node is top-level.'
            return
        endif
        let node = s:Node_getNextNode(node)
    endwhile

    let sttype = getbufvar(buffNum, 'DOT_type')
    if strlen(sttype) == 0 | let sttype = 'base' | endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    " run
    let node = node1
    while node isnot lastNode
        call s:Text_setHeading(buffNum, node.title, node.level - 1, node.lineNum, 'g:DOT_' . sttype . 'SetHeading')
        let node = s:Node_getNextNode(node)
    endwhile

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_undo()
    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        call s:Util_switchCurrentBuffer(b:DOT_textBuffNum, 'new')
    endif

    undo

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_flipUpward(dokozonoLineNum)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
    endif

    let lastNode = s:Node_getLastDescendantNode(node)

    let destNode = node
    while destNode isnot b:DOT_rootNode && node.level < s:Node_getPrevNode(destNode).level
        let destNode = s:Node_getPrevNode(destNode)
    endwhile
    let destNode = s:Node_getPrevNode(destNode)

    " error
    if s:DOT__nodeIsTerminator(node)
        echo 'You can''t move the terminal node.'
        return
    elseif destNode is s:Node_NULL || destNode is b:DOT_rootNode
        echo 'you can''t move any nodes over the first node.'
        return
    endif

    " used moving the cursor
    let srcNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, node)
    let lastNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, lastNode)
    let destNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, destNode)

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    let firstLineNum = node.lineNum
    let lastLineNum = s:Node_getNextNode(lastNode).lineNum - 1

    " copy
    let lines = s:Text_getLines(firstLineNum, lastLineNum)
    " delete
    call s:Text_deleteLines(firstLineNum, lastLineNum)
    " paste
    call s:Text_insertLines(
                \ destNode.lineNum - 1,
                \ lines)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos - (srcNodeIndex - destNodeIndex)
    endif
endfunction


function! s:DOT_flipDownward(dokozonoLineNum)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum1)
    endif

    let lastNode = s:Node_getLastDescendantNode(node)

    let destNode = s:Node_getNextNode(lastNode)
    while !s:DOT__nodeIsTerminator(destNode) && node.level < s:Node_getNextNode(destNode).level
        let destNode = s:Node_getNextNode(destNode)
    endwhile
    let destNode = s:Node_getNextNode(destNode)

   " error
    if s:DOT__nodeIsTerminator(node)
        echo 'You can''t move the terminal node.'
        return
    elseif destNode is s:Node_NULL
        echo 'you can''t move any nodes over the terminal node.'
        return
    endif

    " used moving the cursor
    let srcNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, node)
    let lastNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, lastNode)
    let destNodeIndex = s:Node_getNodeIndex(b:DOT_rootNode, destNode)

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    let firstLineNum = node.lineNum
    let lastLineNum = s:Node_getNextNode(lastNode).lineNum - 1

    " copy
    let lines = s:Text_getLines(firstLineNum, lastLineNum)
    " paste
    call s:Text_insertLines(
                \ destNode.lineNum - 1,
                \ lines)
    " delete
    call s:Text_deleteLines(firstLineNum, lastLineNum)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos + (destNodeIndex - lastNodeIndex - 1)
    endif
endfunction


function! s:DOT_redo()
    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        call s:Util_switchCurrentBuffer(b:DOT_textBuffNum, 'new')
    endif

    redo

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_copy(dokoLineNum1, dokoLineNum2)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNthNode(b:DOT_rootNode, a:dokoLineNum2)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum1)
        let node2 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokoLineNum2)
    endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    call s:Text_copy(node1.lineNum, s:Node_getNextNode(node2).lineNum - 1)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_paste_p(dokozonoLineNum)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
    endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    call s:Text_paste(s:Node_getNextNode(node1).lineNum)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_paste_P(dokozonoLineNum)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node1 = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node1 = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
    endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    call s:Text_paste(node1.lineNum)

    if inTreeBuffer
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT_dump()
    call s:DOT_update()
    call s:DOT__dumpTree(b:DOT_rootNode)
endfunction


function! s:DOT__detectType(buffNum)
    let lines = getbufline(a:buffNum, 1, '$')

    " defined by the user
    let type = getbufvar(a:buffNum, 'DOT_type')
    if index(g:DOT_types, type, 0, 1) != -1 | return type | endif

    " defined by the text buffer
    let TYPE_DECLARATOR_PATTERN = '\v.*%(%(vi|vim|ex)%([^:]*:)|outline)%([^:]*:)[^<]*\<\s*([^>]+)\s*\>.*' " very magic
    let i = 0
    while i < min([&modelines, len(lines)])
        " downward
        let type = substitute(lines[i], TYPE_DECLARATOR_PATTERN, '\1', 'i')
        if index(g:DOT_types, type, 0, 1) != -1 | return type | endif

        " upward
        let type = substitute(lines[len(lines) - 1 - i], TYPE_DECLARATOR_PATTERN, '\1', 'i')
        if index(g:DOT_types, type, 0, 1) != -1 | return type | endif

        let i += 1
    endwhile
    if index(g:DOT_types, type, 0, 1) != -1 | return type | endif

    if &filetype == 'rst' || &filetype == 'rest' | return 'rest' | endif
    if &filetype == 'taskpaper' | return 'taskpaper' | endif

    " auto detection
    let ranks = {}
    for sttype in g:DOT_types
        let Init = function('g:DOT_' . sttype . 'Init')
        call Init(a:buffNum)
        unlet Init
        let headings = s:Text_collectHeadings(
                            \ a:buffNum, 
                            \ function('g:DOT_' . sttype . 'DetectHeading'), 
                            \ function('g:DOT_' . sttype . 'ExtractTitle'),
                            \ function('g:DOT_' . sttype . 'ExtractLevel'))
        let ranks[sttype] = len(headings)
    endfor

    let rankList = sort(items(ranks), 's:DOT__rankSortingPred')
    if len(rankList) > 0
        return rankList[0][0]
    endif

    return 'base' " default type
endfunction

" descending order
function! s:DOT__rankSortingPred(i1, i2)
    return a:i1[1] == a:i2[1] ? 0 : a:i1[1] < a:i2[1] ? 1 : -1
endfunction

function! s:DOT__buildNodeTree(buffNum)
    let rootNode = s:Node_create(':ROOT:', 0, 0)

    let sttype = s:DOT__detectType(a:buffNum)

    let Init = function('g:DOT_' . sttype . 'Init')
    call Init(a:buffNum)
    let headings = s:Text_collectHeadings(
                        \ a:buffNum, 
                        \ function('g:DOT_' . sttype . 'DetectHeading'), 
                        \ function('g:DOT_' . sttype . 'ExtractTitle'),
                        \ function('g:DOT_' . sttype . 'ExtractLevel'))
    let addedTerminator = 0
    let lastNode = rootNode
    for h in headings
        if h.level == 1 && strlen(substitute(h.title, ' ', '', 'g')) == 0
            let h.title = ''
            let addedTerminator = 1
        endif
        let lastNode = s:Node_add(lastNode, h.title, h.level, h.lineNum)
    endfor

    if !addedTerminator
        call s:Node_add(lastNode, '', 1, len(getbufline(a:buffNum, 1, '$')) + 1)
    endif

    " maybe built the tree successfully
    call setbufvar(a:buffNum, 'DOT_type', sttype)

    return rootNode
endfunction


function! s:DOT__nodeIsTerminator(node)
    return (a:node.title == '')
endfunction


function! s:DOT__createNode(dokozonoLineNum, levelDelta, titlePrompt)
    call s:DOT_update()

    let inTreeBuffer = s:DOT__inTreeBuffer(bufnr('%'))
    if inTreeBuffer
        let cursorPos = line('.')
        let buffNum = b:DOT_textBuffNum
        let node = s:Node_getNthNode(b:DOT_rootNode, a:dokozonoLineNum)
    else
        let buffNum = bufnr('%')
        let node = s:Node_getNodeByLineNum(b:DOT_rootNode, a:dokozonoLineNum)
    endif

    if node is b:DOT_rootNode.lastChild
        echo 'You can''t create any node after the terminal node.'
        return
    endif
    if node.level + a:levelDelta < 1
        echo 'You can''t create 0-level node.'
        return
    endif

    let title = input(a:titlePrompt . ': ')
    if strlen(title) == 0 | return | endif

    call s:Util_switchCurrentBuffer(buffNum, 'new')

    let lastNode = s:Node_getLastDescendantNode(node)
    let lineNumToInsert = s:Node_getNextNode(lastNode).lineNum - 1 " insert just before the next node

    "echoe 'base:' . baseNode.title
    "echoe 'dest:' . lastNode.title
    "echoe 'lineNumToInsert:' . lineNumToInsert

    let sttype = getbufvar(buffNum, 'DOT_type')
    if strlen(sttype) == 0 | let sttype = 'base' | endif

    call s:Text_insertHeading(
                \ buffNum,
                \ lineNumToInsert,
                \ title,
                \ node.level + a:levelDelta,
                \ 'g:DOT_' . sttype . 'DecorateHeading')

    if inTreeBuffer
        let cursorPos = s:Node_getNodeIndex(b:DOT_rootNode, lastNode) + 1
        call s:DOT_execute(line('.'))
        execute cursorPos
    endif
endfunction


function! s:DOT__dumpTree(node)
    if a:node is s:Node_NULL | return | endif
    "if a:node.title == ':NULL:' | return | endif

    echom a:node.lineNum . ' : [' . a:node.level . '] ' . a:node.title

    call s:DOT__dumpTree(a:node.firstChild)
    call s:DOT__dumpTree(a:node.nextSibling)
endfunction


function! g:DOT_baseDecorateHeading(buffNum, title, level)
    return {'lines':[repeat(s:DOT_baseGetHeadingMark(a:buffNum), a:level) . ' ' . a:title, '', '', ''], 'cursorPos': [1, 0]}
endfunction


function! g:DOT_baseInit(buffNum)
endfunction


function! g:DOT_baseDetectHeading(buffNum, targetLine, targetLineIndex, entireLines)
    return (a:targetLine =~ s:DOT_baseGetRegExp(a:buffNum))
endfunction


function! g:DOT_baseExtractTitle(buffNum, targetLine, targetLineIndex, entireLines)
    return substitute(a:targetLine, s:DOT_baseGetRegExp(a:buffNum), '\2', '')
endfunction


function! g:DOT_baseExtractLevel(buffNum, targetLine, targetLineIndex, entireLines)
    return strlen(substitute(a:targetLine, s:DOT_baseGetRegExp(a:buffNum), '\1', '')) / strlen(s:DOT_baseGetHeadingMark(a:buffNum))
endfunction


function! g:DOT_baseSetHeading(buffNum, title, level, lineNum)
    call setline(a:lineNum, repeat(s:DOT_baseGetHeadingMark(a:buffNum), a:level) . ' ' . a:title)
endfunction


function! s:DOT_baseGetHeadingMark(buffNum)
    return s:Util_getOption(s:DOT_OPTION_HEADING_MARK, '.')
endfunction


function! s:DOT_baseGetRegExp(buffNum)
    "return '^\(\.\+\)\s*\(.*\)$'
    return '\V\^\(\%('.s:DOT_baseGetHeadingMark(a:buffNum).'\)\+\)\s\*\(\.\*\)\$'
endfunction



"--------------------
" Accessors to text buffer
"--------------------

function! s:Text_collectHeadings(buffNum, headingDetector, titleExtractor, levelExtractor)
    let lines = getbufline(a:buffNum, 1, '$')

    let lineNum = 1
    let headings = []
    for line in lines
        if a:headingDetector(a:buffNum, line, lineNum - 1, lines)
            call add(headings, {
                     \ 'lineNum': lineNum,
                     \ 'title': a:titleExtractor(a:buffNum, line, lineNum - 1, lines),
                     \ 'level': a:levelExtractor(a:buffNum, line, lineNum - 1, lines),
                     \ })
        endif

        let lineNum += 1
    endfor

    return headings
endfunction


function! s:Text_setHeading(buffNum, title, level, lineNum, headingSetter)
    call function(a:headingSetter)(a:buffNum, a:title, a:level, a:lineNum)
endfunction


function! s:Text_getLines(firstLineNum, lastLineNum)
    return getline(a:firstLineNum, a:lastLineNum)
endfunction


" deletes   lines[firstLineNum, firstLineNum + 1, ... , lastLineNum]
function! s:Text_deleteLines(firstLineNum, lastLineNum)
    execute a:firstLineNum . ',' . a:lastLineNum . 'delete'
endfunction


function! s:Text_insertLines(lineNum, contents)
    call append(a:lineNum, a:contents)
endfunction


function! s:Text_insertHeading(buffNum, lineNum, title, level, headingDecorator)
    let Fn = function(a:headingDecorator)
    let headingInfo = Fn(a:buffNum, a:title, a:level)
    call append(a:lineNum, headingInfo.lines)

    let pos = getpos('.')
    let pos[1] = a:lineNum + 1 + headingInfo.cursorPos[0]
    let pos[2] += headingInfo.cursorPos[1]
    call setpos('.', pos)
endfunction


function! s:Text_copy(firstLineNum, lastLineNum)
    execute a:firstLineNum . ',' . a:lastLineNum . 'yank'
endfunction


function! s:Text_paste(lineNum)
    execute a:lineNum
    normal "0P
endfunction



"--------------------
" Node definitions & creations
"--------------------


" NULL node
if !exists('s:Node_NULL')
    let s:Node_NULL = {'title': ':NULL:', 'level':0, 'lineNum':0}
    " has no relationships
endif


function! s:Node_create(title, level, lineNum)
    return {
          \ 'title' : a:title,
          \ 'level' : a:level,
          \ 'lineNum' : a:lineNum,
          \ 'nextSibling' : s:Node_NULL,
          \ 'previousSibling' : s:Node_NULL,
          \ 'parentNode' : s:Node_NULL,
          \ 'firstChild' : s:Node_NULL,
          \ 'lastChild' : s:Node_NULL,
          \ 'childNodes' : [],
          \ }
endfunction


function! s:Node_add(rootNode, title, level, lineNum)
    let lastNode = s:Node_getLastNode(a:rootNode)

    let newNode = s:Node_create(a:title, a:level, a:lineNum)
    if lastNode.level + 1 < newNode.level
        let newNode.level -= lastNode.level + 1
    endif

    if newNode.level < lastNode.level
        let parentNode = lastNode
        while newNode.level <= parentNode.level
            let parentNode = parentNode.parentNode
        endwhile
        call s:Node_appendChild(parentNode, newNode)
    elseif lastNode.level < newNode.level
        call s:Node_appendChild(lastNode, newNode)
    else " ==
        call s:Node_appendChild(lastNode.parentNode, newNode)
    endif

    return newNode
endfunction


function! s:Node_appendChild(parentNode, childNode)
    let oldLastChild = a:parentNode.lastChild

    let oldLastChild.nextSibling = a:childNode
    let a:childNode.previousSibling = oldLastChild

    let a:childNode.parentNode = a:parentNode
    if a:parentNode.firstChild is s:Node_NULL | let a:parentNode.firstChild = a:childNode | endif
    let a:parentNode.lastChild = a:childNode
    call add(a:parentNode.childNodes, a:childNode)
endfunction


function! s:Node_getLastNode(rootNode)
    if a:rootNode.lastChild is s:Node_NULL | return a:rootNode | endif
    return s:Node_getLastNode(a:rootNode.lastChild)
endfunction


function! s:Node_getNodeByLineNum(rootNode, lineNum)
    let candidate = a:rootNode
    for c in a:rootNode.childNodes
        if a:lineNum < c.lineNum | break | endif " found?
        let candidate = c
    endfor

    if candidate is a:rootNode | return a:rootNode | endif

    " search among childNodes
    return s:Node_getNodeByLineNum(candidate, a:lineNum)
endfunction


function! s:Node_getNthNode(node, n)
    if (a:n == 0 || a:node is s:Node_NULL) | return a:node | endif

    if a:node.firstChild isnot s:Node_NULL
        let nextNode = a:node.firstChild
    elseif a:node.nextSibling isnot s:Node_NULL
        let nextNode = a:node.nextSibling
    else
        let nextNode = a:node.parentNode
        while (nextNode isnot s:Node_NULL) && (nextNode.nextSibling is s:Node_NULL)
            let nextNode = nextNode.parentNode
        endwhile
        if nextNode isnot s:Node_NULL | let nextNode = nextNode.nextSibling | endif
    endif

    return s:Node_getNthNode(nextNode, a:n - 1)
endfunction


function! s:Node_getNextNode(node)
    return s:Node_getNthNode(a:node, 1)
endfunction


function! s:Node_getPrevNode(node)
    if a:node is s:Node_NULL | return a:node | endif

    let p = a:node.parentNode
    while p isnot s:Node_NULL && s:Node_getNextNode(p) isnot a:node
        let p = s:Node_getNextNode(p)
    endwhile

    return p
endfunction


function! s:Node_getLastDescendantNode(node)
    if ((a:node is s:Node_NULL) || (a:node.lastChild is s:Node_NULL)) | return a:node | endif

    return s:Node_getLastDescendantNode(a:node.lastChild)
endfunction


function! s:Node_getNodeIndex(rootNode, node)
    return s:Node_getNodeIndexInner(a:rootNode, a:node, 0)
endfunction


function! s:Node_getNodeIndexInner(rootNode, node, currIndex)
    if a:rootNode is a:node | return a:currIndex | endif
    if a:rootNode is s:Node_NULL | return -1 | endif

    return s:Node_getNodeIndexInner(s:Node_getNextNode(a:rootNode), a:node, a:currIndex + 1)
endfunction


"--------------------
" Misc
"--------------------

function! s:Util_getOption(optName, defaultValue)
    let value = a:defaultValue

    let nsPriority = ['b', 'w', 't', 'g']
    for ns in nsPriority
        if ns == 'b'
            if s:DOT__inTreeBuffer(bufnr('%'))
                let textBuffNum = b:DOT_textBuffNum
            else
                let textBuffNum = bufnr('%')
            endif

            let bvalue = getbufvar(textBuffNum, a:optName)
            if len(bvalue) != 0
                let value = bvalue
                break
            endif
        elseif exists(ns.':'.a:optName)
            let value = eval(ns.':'.a:optName)
            break
        endif
    endfor

    return value
endfunction

function! s:Util_switchCurrentBuffer(buffNum, newcmd)
    if bufnr('%') == a:buffNum | return a:buffNum | endif

    let prevBuffNum = bufnr('#')
    let winNum = bufwinnr(a:buffNum)
    if winNum == -1
        execute a:newcmd 
        execute 'buffer ' a:buffNum
    else
        execute winNum . 'wincmd w'
    endif

    return prevBuffNum
endfunction


"--------------------
" deferred
"--------------------

if !exists('g:DOT_keyMapFunction')
    let g:DOT_keyMapFunction = function('g:DOT_setDefaultKeyMap')
endif


"--------------------
" making one object file
"--------------------

"
"reStructuredText plugin for DOT
"===============================
"
"ThisIs:
"-------
"   A plugin for DOT.
"   With this plugin, DOT can make outline tree from reStrucredText.
"
"Usage:
"-------
"   Add a new line to the target buffer.
"       > outline: <rest>
"   or
"       > vim: set hoge : <rest>

if index(g:DOT_types, 'rest') == -1
    call add(g:DOT_types, 'rest')
endif

let s:DOT_REST_REGEXP = '\m^[-=`:.''"~^_*+#]\{2,\}$'

function! g:DOT_restInit(buffNum)
    call setbufvar(a:buffNum, 'DOT_restSectionMarks', [])
    "let b:DOT_restSectionMarks = []
endfunction

" section 1.            <- detected
" ===============       <- not detected
function! g:DOT_restDetectHeading(buffNum, targetLine, targetLineIndex, entireLines)
    let detected = 0

    if a:targetLineIndex == len(a:entireLines) - 1 | return 0 | endif

    let nextLine = s:DOT__restStripCommenterCharacters(a:buffNum, a:entireLines[a:targetLineIndex + 1])

    " ignore an over line of a TITLE
    if a:targetLineIndex + 3 < len(a:entireLines)
        let nextLine3 = s:DOT__restStripCommenterCharacters(a:buffNum, a:entireLines[a:targetLineIndex + 3])
        if nextLine[0] == nextLine3[0] | return 0 | endif
    endif

    if nextLine =~ s:DOT_REST_REGEXP && a:targetLine !~ s:DOT_REST_REGEXP
        let detected = 1

        " add if no entry
        let mark = nextLine[0]
        "echoe mark . ' ' . nextLine
        if index(getbufvar(a:buffNum, 'DOT_restSectionMarks'), mark) == -1
            call add(getbufvar(a:buffNum, 'DOT_restSectionMarks'), mark)
        endif
    endif

    return detected
endfunction


function! g:DOT_restExtractTitle(buffNum, targetLine, targetLineIndex, entireLines)
    " strip leading spaces
    return substitute(a:targetLine, '\V\^\%(\s\*\)\(\.\*\)\$', '\1', '')
endfunction


function! g:DOT_restExtractLevel(buffNum, targetLine, targetLineIndex, entireLines)
    let mark = s:DOT__restStripCommenterCharacters(a:buffNum, a:entireLines[a:targetLineIndex + 1])[0]
    "echom l:mark . (index(getbufvar(a:buffNum, 'DOT_restSectionMarks'), l:mark) + 1) . join(getbufvar(a:buffNum, 'DOT_restSectionMarks'))
    return index(getbufvar(a:buffNum, 'DOT_restSectionMarks'), mark) + 1
endfunction


function! g:DOT_restSetHeading(buffNum, title, level, lineNum)
    let mark = ':'
    if a:level <= len(getbufvar(a:buffNum, 'DOT_restSectionMarks')) | let mark = getbufvar(a:buffNum, 'DOT_restSectionMarks')[a:level - 1] | endif

    call setline(a:lineNum, [a:title, repeat(mark, 20)])
endfunction


function! g:DOT_restDecorateHeading(buffNum, title, level)
    let mark = ':'
    if a:level <= len(getbufvar(a:buffNum, 'DOT_restSectionMarks')) | let mark = getbufvar(a:buffNum, 'DOT_restSectionMarks')[a:level - 1] | endif

    return {'lines':[a:title, repeat(mark, 20), '', ''], 'cursorPos': [2, 0]}
endfunction


function! s:DOT__restStripCommenterCharacters(buffNum, line)
    let commentpattern = '\v' . substitute(escape(getbufvar(a:buffNum, '&commentstring'), '.*\()[]{}?'), '%s', '(.*)', '')
    return substitute(a:line, commentpattern, '\1', '')
    "echoe commentpattern
    "echoe line . ' => ' . nextLine
endfunction
"
" vim: set et ff=unix fenc=utf-8 sts=4 sw=4 ts=4 : <rest>
"
"TaskPaper plugin for DOT:
"
"ThisIs:
"   A plugin for DOT.
"   With this plugin, DOT can make outline tree from TaskPaper.
"
"Usage:
"   Add a new line to the target buffer.
"       > outline: <taskpaper>
"   or
"       > vim: set hoge : <taskpaper>

if index(g:DOT_types, 'taskpaper') == -1
    call add(g:DOT_types, 'taskpaper')
endif

let s:DOT_TASKPAPER_REGEXP = '\m^\(.\+\):\s*$'

function! g:DOT_taskpaperDecorateHeading(buffNum, title, level)
    return {'lines':[a:title . ':', '', '', ''], 'cursorPos': [1, 0]}
endfunction


function! g:DOT_taskpaperInit(buffNum)
endfunction


function! g:DOT_taskpaperDetectHeading(buffNum, targetLine, targetLineIndex, entireLines)
    return (a:targetLine =~ s:DOT_TASKPAPER_REGEXP)
endfunction


function! g:DOT_taskpaperExtractTitle(buffNum, targetLine, targetLineIndex, entireLines)
    return substitute(a:targetLine, s:DOT_TASKPAPER_REGEXP, '\1', '')
endfunction


function! g:DOT_taskpaperExtractLevel(buffNum, targetLine, targetLineIndex, entireLines)
    return 1
endfunction


function! g:DOT_taskpaperSetHeading(buffNum, title, level, lineNum)
    call setline(a:lineNum, a:title . ':')
endfunction
"
" vim: set et ff=unix fenc=utf-8 sts=4 sw=4 ts=4 : <taskpaper>

" vim: set fenc=utf-8 ff=unix ts=4 sts=4 sw=4 et : <rest>
