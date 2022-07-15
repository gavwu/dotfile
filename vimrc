""""""""""""""""""""""""""""""[Baisc Setting]""""""""""""""""""""""""""""""
" Comments in Vimscript start with a `"`.

" set t_u7=

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

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" set highlight search
set hlsearch

filetype plugin indent on

" yarn also copy to clipboard
set clipboard=unnamed

set exrc
set secure
""""""""""""""""""""""""""""""[Basic Setting End]""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""[Key Mapping]""""""""""""""""""""""""""""""
" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
" ...and in insert mode
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>

" edit vimrc file
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
" source vimrc file
nnoremap <Leader>sv :source $MYVIMRC<CR>
" that operates on a function name in the current line
onoremap <silent> F :<C-U>normal! 0f(hviw<CR>
" operate on current sentence content
onoremap <silent> s :<C-U>normal! 0v$h<CR>

" window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" go file mapping
augroup go_mapping
	autocmd!
	autocmd FileType go nnoremap <buffer> <Leader>b <Plug>VimspectorToggleBreakpoint
	" restart coc
	autocmd FileType go nnoremap <Leader>R :!go mod tidy<CR>:CocRestart<CR>
augroup END

" coc mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" pretty json in place
nnoremap <silent> <F8> :%!python -m json.tool<CR>

" go debugging mapping
let g:go_debug_mappings = {
     \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
     \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
     \ '(go-debug-step)': {'key': 's'},
   \}

" NERDTree key mapping
nnoremap <silent> <F2> :NERDTreeToggle<CR>

" locate current file
nnoremap <Leader>f :NERDTreeFind<CR>

" CtrlSF setting
nmap <C-F> <Plug>CtrlSFPrompt
vmap <C-F> <Plug>CtrlSFVwordPath
nnoremap <F4> :CtrlSFToggle<CR>

" search selected word in visual mode
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" open a new terminal in vim
nnoremap <Leader>t :bo term<CR>

" Uppercase in Insert Mode
inoremap <C-u> <Esc>viwUwi

" toggle tagbar
nnoremap <silent> <F3> :TagbarToggle<CR>
" copy the current filepath
nnoremap <silent> <Leader>y :let @+=expand('%') . ':' . line(".")<CR>

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 Import :call CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

""""""""""""""""""""""""""""""[Key Mapping End]""""""""""""""""""""""""""""""

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


" vim-markdown
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""""coc-nvim"""""""""""""""""""""""""

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

let g:coc_global_extensions = [
      \'coc-json',
      \'coc-prettier',
      \'coc-marketplace',
      \'coc-tsserver',
      \'coc-pyright',
\]

"""""""""""""""""""""""""coc-nvim"""""""""""""""""""""""""


" highlight color setting
hi FgCocErrorFloatBgCocFloating ctermfg=0
hi Pmenu ctermfg=0 ctermbg=7
hi link goDiagnosticWarning CursorLineNr
hi TODO ctermbg=6
hi DiffText ctermbg=grey
hi DiffChange ctermbg=grey



" CTRLSF Configuration
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

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

nmap <leader>rn <Plug>(coc-rename)
let g:mkdp_refresh_slow = 1
set ttimeoutlen=0

" ALE Configuration
let g:ale_disable_lsp = 1
let g:ale_linters = {
\  'go': ['golangci-lint'],
\}
let g:ale_go_golangci_lint_options = '--skip-dirs="vendor|bin" --skip-files "_test\.go" --exclude unused,sa1012,asmdecl,S1004,SA5008,SA1029'
" golangci-lint have to compile the package to make lint
let g:ale_go_golangci_lint_package = 1
" let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""""""""""""""""""""Vimspector Configuration""""""""""""""""""""

command! DebugContinue :call vimspector#Continue()
command! DebugNext :call vimspector#StepOver()
command! DebugStepIn :call vimspector#StepInto()
command! DebugStepOut :call vimspector#StepOut()
command! DebugPause :call vimspector#Pause()
command! DebugStop :call vimspector#Stop()
command! DebugRestart :call vimspector#Restart()
command! DebugReset :call vimspector#Reset()
command! DebugToggleBP :call vimspector#ToggleBreakpoint()
command! DebugListBP :call vimspector#ListBreakpoints()
let s:mapped = {}
function! s:OnJumpToFrame() abort
  if has_key( s:mapped, string( bufnr() ) )
    return
  endif

  nmap <silent> <buffer> n <Plug>VimspectorStepOver
  nmap <silent> <buffer> c <Plug>VimspectorContinue

  let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }

  setlocal nomodifiable

endfunction
function! s:OnDebugEnd() abort

  let original_buf = bufnr()
  let hidden = &hidden
  augroup VimspectorSwapExists
    au!
    autocmd SwapExists * let v:swapchoice='o'
  augroup END

  try
    set hidden
    for bufnr in keys( s:mapped )
      try
        execute 'buffer' bufnr
        silent! nunmap <buffer> n
        silent! nunmap <buffer> c

        let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
      endtry
    endfor
  finally
    execute 'noautocmd buffer' original_buf
    let &hidden = hidden
  endtry

  au! VimspectorSwapExists

  let s:mapped = {}
endfunction
augroup debug_mappings
	autocmd!
	autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
	autocmd User VimspectorDebugEnded ++nested call s:OnDebugEnd()
augroup END

""""""""""""""""""""Vimspector Configuration""""""""""""""""""""
