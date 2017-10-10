" Syntax files settings
let g:erlang_highlight_special_atoms = v:true
let g:is_posix = v:true  " Posix is a more realistic default for me
let g:nroff_is_groff = v:true  " Default to groff
let g:sh_fold_enabled = 7  " Fold as much as possible
let g:sh_no_error = v:true  " Handled by linter
let g:vimsyn_embed = 'lPr'  " lua/Python/ruby only embedded syntax
let g:xml_syntax_folding = v:true
let g:sh_minlines = 400
let g:is_bash = v:true  " Default to bash for sh syntax
let g:python_highlight_all = v:true  " Highlight everything possible for python
let g:zsh_fold_enable = v:true
let g:ft_man_folding_enable = v:true
let g:ft_man_open_mode = 'vert'
let g:rust_conceal = v:true
let g:rust_conceal_mod_path = v:true
let g:rust_conceal_pub = v:true
let g:rust_fold = 2

if !exists('g:colors_name')  " Don't reload on write
    colorscheme jnrowe
endif
