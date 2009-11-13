" Vim syntax file
" Language:	Quickfix window
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Jan 15
" Modified by mg with extra rules

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn match	qfFileName	"^[^|]*" nextgroup=qfSeparator
syn match	qfSeparator	"|" nextgroup=qfLineNr,qfAnotherSeparator contained
syn match	qfLineNr	"[^|]*" contained contains=qfError
syn match	qfError		"error" contained

syn match	qfAnotherSeparator	"|" nextgroup=diffAdded,diffRemoved contained
syn match       diffRemoved     "     -.*" contained
syn match       diffAdded       "     +.*" contained


" The default highlighting.
hi def link qfFileName	Directory
hi def link qfLineNr	LineNr
hi def link qfError	Error

hi def link diffRemoved		Special
hi def link diffAdded		Identifier


let b:current_syntax = "qf"
