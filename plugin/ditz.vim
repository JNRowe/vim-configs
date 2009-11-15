function! s:Todo()
  call s:OpenBufferFromCommand('ditz todo', function('s:IssueCallback'))
endfunction

function! s:TodoAll()
  call s:OpenBufferFromCommand('ditz todo --all', function('s:IssueCallback'))
endfunction

function! s:Grep(args)
  call s:OpenBufferFromCommand(printf('ditz grep "%s"', a:args), function('s:IssueCallback'))
endfunction

function! s:Releases()
  call s:OpenBufferFromCommand('ditz releases', function('s:ReleaseCallback'))
endfunction

function! s:OpenBufferFromCommand(cmd, callback)
  pclose
  new
  resize 10
  wincmd R
  setlocal previewwindow bufhidden=delete nobackup noswapfile nobuflisted nowrap buftype=nofile
  let b:cmd = a:cmd
  call s:Reload()
  call a:callback()
endfunction

function! s:IssueCallback()
  nmap <buffer><silent> r :call <SID>IssueCommand('add-reference')<CR>
  nmap <buffer><silent> a :call <SID>IssueCommand('assign')<CR>
  nmap <buffer><silent> c :call <SID>IssueCommand('close')<CR>
  nmap <buffer><silent> m :call <SID>IssueCommand('comment')<CR>
  nmap <buffer><silent> d :call <SID>IssueCommand('drop')<CR>
  nmap <buffer><silent> e :call <SID>IssueCommand('edit')<CR>
  nmap <buffer><silent> p :call <SID>IssueCommand('set-component')<CR>
  nmap <buffer><silent> o :call <SID>IssueCommand('show')<CR>
  nmap <buffer><silent> s :call <SID>IssueCommand('start')<CR>
  nmap <buffer><silent> t :call <SID>IssueCommand('stop')<CR>
  nmap <buffer><silent> u :call <SID>IssueCommand('unassign')<CR>
  nmap <buffer><silent> R :call <SID>Reload()<CR>
  nmap <buffer><silent> q :bd<CR>
endfunction

function! s:ReleaseCallback()
  nmap <buffer><silent> a :call <SID>ReleaseCommand('archive')<CR>
  nmap <buffer><silent> c :call <SID>ReleaseCommand('changelog')<CR>
  nmap <buffer><silent> r :call <SID>ReleaseCommand('release')<CR>
  nmap <buffer><silent> s :call <SID>ReleaseCommand('status')<CR>
  nmap <buffer><silent> t :call <SID>ReleaseCommand('todo')<CR>
  nmap <buffer><silent> f :call <SID>ReleaseCommand('todo --all')<CR>
  nmap <buffer><silent> R :call <SID>Reload()<CR>
  nmap <buffer><silent> q :bd<CR>
endfunction

function! s:IssueCommand(cmd)
  call s:DoCommandFromCurrentLine(a:cmd, '^. \(\S\+\): .*')
endfunction

function! s:ReleaseCommand(cmd)
  call s:DoCommandFromCurrentLine(a:cmd, '^\(\S\+\) .*')
endfunction

function s:DoCommandFromCurrentLine(cmd, regex)
  let line = getline('.')

  if match(line, a:regex) == -1
    return
  end

  try
    silent execute join(['!ditz', a:cmd, substitute(line, a:regex, '\1', '')])
  finally
    redraw!
  endtry

  call s:Reload()
endfunction

function s:Reload()
  let pos = getpos('.')
  setlocal modifiable
  execute '%d'
  call append(0, split(system(b:cmd), "\n"))
  setlocal nomodifiable
  call setpos('.', pos)
endfunction

command! DitzTodo call s:Todo()
command! DitzTodoAll call s:TodoAll()
command! -nargs=+ DitzGrep call s:Grep(<q-args>)
command! DitzReleases call s:Releases()
