" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" code look pretty without wrap
set nowrap

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

set splitright
set splitbelow

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" set highlight search
set hlsearch

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
" use jk to exit insert mode
" inoremap jk <Esc>
" inoremap <ESC> :echoe "Use jk"<CR>

" that operates on a function name in the current line
" onoremap <silent> F :<C-U>normal! 0f(hviw<CR>

filetype plugin indent on

" window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""vim-go""""""""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_format_strings = 1

" diagnostic is disabled while g:go_gopls_enabled = 0
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_diagnostics_level = 2

" disable GoDef mapping provided by vim-go (use coc-definition instead)
let g:go_def_mapping_enabled = 0
" disable GoDoc mapping provided by vim-go (use coc-definition instead)
let g:go_doc_keywordprg_enabled = 0
" use coc.nvim for code completion instead
let g:go_code_completion_enabled = 0

" don't know what it is
let g:go_textobj_enabled = 0
let g:go_textobj_include_function_doc = 0
let g:go_textobj_include_variable = 0

" disable vim-go gopls, use coc.nvim + gopls
let g:go_gopls_enabled = 0

let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
      \ 'out':      'rightbelow 10new',
\ }
 let g:go_debug_mappings = {
     \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
     \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
     \ '(go-debug-step)': {'key': 's'},
   \}
augroup go_mapping
	autocmd!
	autocmd FileType go nnoremap <buffer> <Leader>b :GoDebugBreakpoint<CR>
	autocmd FileType go nnoremap <Leader>R :!go mod tidy<CR>:CocRestart<CR>
augroup END


" let g:go_debug_mappings = {
" 	\ '(go-debug-continue)':   {'key': '<F5>'},
" 	\ '(go-debug-print)':      {'key': '<F6>'},
" 	\ '(go-debug-breakpoint)': {'key': '<F9>'},
" 	\ '(go-debug-next)':       {'key': '<F10>'},
" 	\ '(go-debug-step)':       {'key': '<F11>'},
" 	\ '(go-debug-halt)':       {'key': '<F8>'},
" 	\ }
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <silent> <F8> :%!python -m json.tool<CR>

" vim-markdown
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""coc-nvim"""""""""""""""""""""""""
" key mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


"""""""""""""""""""""""""coc-nvim"""""""""""""""""""""""""

" NERDTree key mapping
nnoremap <F2> :NERDTreeToggle<CR>

" locate current file
nnoremap <Leader>f :NERDTreeFind<CR>

" highlight color setting
hi FgCocErrorFloatBgCocFloating ctermfg=0
hi Pmenu ctermfg=0 ctermbg=7
hi link goDiagnosticWarning CursorLineNr
hi TODO ctermbg=6
hi DiffText ctermbg=grey
hi DiffChange ctermbg=grey

" yarn also copy to clipboard
set clipboard=unnamed

" CtrlSF setting
nmap <C-F> <Plug>CtrlSFPrompt
vmap <C-F> <Plug>CtrlSFVwordPath
nnoremap <F4> :CtrlSFToggle<CR>

let g:ctrlsf_backend = 'ag'
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_auto_focus = {
	\ "at" : "start",
	\ }
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_ignore_dir = ['.git']
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_mapping = {
		\ "open"    : ["<CR>", "o"],
		\ "openb"   : "O",
		\ "split"   : "<C-S>",
		\ "vsplit"  : "<C-V>",
		\ "tab"     : "",
		\ "tabb"    : "",
		\ "popen"   : "p",
		\ "popenf"  : "P",
		\ "quit"    : "q",
		\ "next"    : "n",
		\ "prev"    : "N",
		\ "nfile"   : "f",
		\ "pfile"   : "F",
		\ "pquit"   : "q",
		\ "loclist" : "",
		\ "chgmode" : "M",
		\ "stop"    : "<C-C>",
		\ }

" toggle code fold (za, zf for visula model) perhap set a key mapping later
set foldmethod=manual

" search selected word in visual mode(perhap wanna use someday)
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" open a new terminal in vim
nnoremap <Leader>t :bo term<CR>

" Uppercase in Insert Mode
inoremap <C-u> <Esc>viwUwi

nnoremap <silent> <F3> :TagbarToggle<CR>
nnoremap <silent> <Leader>y :let @+=expand('%') . ':' . line(".")<CR>
