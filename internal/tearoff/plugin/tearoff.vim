"-------------------------------------%<-------------------------------------
" this puts a the string "--------%<---------" above and below the visually
" selected block of lines. the length of the 'tearoff' string depends on the
" maximum string length in the selected range. this is an aesthetically more
" pleasing alternative instead of hardcoding a length.
"-------------------------------------%<-------------------------------------
function! <SID>Snip() range
	if get(g:, "tearoff_git_scissors")
		let l:tearoff_markers = {
			\ "start": "8<",
			\ "end": ">8",
		\ }
	else
		let l:tearoff_markers = {
			\ "start": "%<",
			\ "end": "%<",
		\ }
	endif

	let i = a:firstline
	let maxlen = -2
	" find out the maximum virtual length of each line.
	while i <= a:lastline
		exe i
		let length = virtcol('$')
		let maxlen = (length > maxlen ? length : maxlen)
		let i = i + 1
	endwhile
	let maxlen = (maxlen > &tw && &tw != 0 ? &tw : maxlen)
	let half = maxlen/2
	exe a:lastline
	" put a string below
	exe "norm! o\<esc>".(half - 1)."a-\<esc>A". l:tearoff_markers.end ."\<esc>".(half - 1)."a-"
	" and above. its necessary to put the string below the block of lines
	" first because that way the first line number doesnt change...
	exe a:firstline
	exe "norm! O\<esc>".(half - 1)."a-\<esc>A". l:tearoff_markers.start ."\<esc>".(half - 1)."a-"
endfunction

com! -nargs=0 -range Snip :<line1>,<line2>call <SID>Snip()
