"==============================================================================
" Main
"==============================================================================
set nocompatible
let mapleader=" "
set shell=bash
set encoding=utf-8
set fileformat=unix
set noswapfile
set backspace=indent,eol,start
set viminfo=
set shortmess-=S
set clipboard+=unnamedplus

"==============================================================================
" Plugins
"==============================================================================
source ~/.config/nvim/comment.vim

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
" Plug 'maralla/completor.vim'
Plug 'rhysd/vim-clang-format'
Plug 'dart-lang/dart-vim-plugin'
Plug 'neoclide/coc.nvim'
Plug 'vim-syntastic/syntastic'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ap/vim-css-color'
call plug#end()

"==============================================================================
" Display
"==============================================================================
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
colorscheme tokyonight
set number
set foldmethod=syntax
set colorcolumn=80,81
autocmd FileType gitcommit set textwidth=72 colorcolumn=50,51,72,73
autocmd FileType gitrebase set textwidth=63 colorcolumn=63,64
autocmd BufRead *tmp/neomutt-* set textwidth=72 colorcolumn=72,73

set list
" set listchars=tab:>—,nbsp:␣,trail:.
set listchars=tab:├─,nbsp:␣,trail:.
set tabstop=8
set shiftwidth=8
set noexpandtab    " Use tabs, not spaces
set splitbelow splitright
set wildmenu
set wildmode=list:full,full
set ignorecase
set smartcase
set smartindent
filetype indent on
" filetype plugin indent on
" set noautoindent
" set linebreak

autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent foldmethod=indent
autocmd FileType mail set spell spelllang=en_us
autocmd FileType text set spell spelllang=en_us
autocmd FileType nasm,php set autoindent foldmethod=indent
autocmd FileType html,css,dart,php set ts=4 sw=4 noexpandtab
autocmd FilterWritePre * if &diff | set foldcolumn=0 | endif
" autocmd BufWritePre *.c ClangFormat

"==============================================================================
" Keymaping
"==============================================================================
noremap ; :
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <C-p> cw<C-r>0<ESC>
nnoremap <silent> <C-j> :move +1 <CR>
nnoremap <silent> <C-k> :move -2 <CR>
no <Up>        <Nop>
no <Down>      <Nop>
no <Left>      <Nop>
no <Right>     <Nop>
no <Space>     <Nop>
no <PageUp>    <Nop>
no <PageDown>  <Nop>
no <BackSpace> <Nop>
no <F1>        <Nop>
no Q           <Nop>
ino <Up>       <Nop>
ino <Down>     <Nop>
ino <PageUp>   <Nop>
ino <PageDown> <Nop>
ino <End>      <Nop>
ino <Home>     <Nop>
ino <F1>       <Nop>
vno u          <Nop>
noremap J o<esc>k
noremap K O<esc>j
noremap H 0
noremap L $
nnoremap <Leader><CR> <Esc>:vsplit
nnoremap <Leader>= :res +1<CR>
nnoremap <Leader>- :res -1<CR>
nnoremap <Leader>0 :res 34<CR>
nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l

" Move the split
nnoremap <Leader><Left>  <C-w>H
nnoremap <Leader><Down>  <C-w>J
nnoremap <Leader><Up>    <C-w>K
nnoremap <Leader><Right> <C-w>L

" Search
nnoremap <Leader>f :set hlsearch<CR>/^[a-z*].*(.*)$<CR>
nnoremap <Leader>o :set hlsearch!<CR>/\%80v.\+/<CR>
nnoremap <Leader>s :set hlsearch!<CR>
nnoremap * *zz
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap n nzz
nnoremap N Nzz

" Quit
nnoremap <Leader>q :qa!<CR>

" Fold
nnoremap <Leader>z zM
nnoremap <Leader>Z zR

" Syntastic
nnoremap <Leader>a :SyntasticCheck<CR>
nnoremap <Leader>A :SyntasticToggleMode<CR>
nnoremap <Leader>n :lnext<CR>

" Format file 
autocmd FileType c        nnoremap <Leader>x :ClangFormat<CR>
autocmd FileType php,html nnoremap <Leader>x :call TrimWhiteSpace()<CR>:set ts=4<CR>:%retab!<CR>:set ts=4<CR><ESC>1GVG=<CR>
autocmd FileType dart     nnoremap <Leader>x :DartFmt<CR>:set ts=2<CR>:%retab!<CR>:set ts=4<CR>

nnoremap <Leader>r :set rightleft<CR>
nnoremap <Leader>R :set norightleft<CR>

" Git
nnoremap <Leader>g :GitGutterSignsToggle<CR>
nmap <Enter> <Plug>(GitGutterPreviewHunk)
nmap <Leader>1 <Plug>(GitGutterPrevHunk)
nmap <Leader>2 <Plug>(GitGutterNextHunk)

" surround word
nnoremap <Leader>; i"<ESC>lea"<ESC>l
nnoremap <Leader>' i"<ESC>A"<ESC>l
nnoremap <Leader>[ i[<ESC>lea]<ESC>l
nnoremap <Leader>] i{<ESC>lea}<ESC>l

noremap Q @q
noremap <Leader>v @e

" hex
nnoremap <Leader>h :%!xxd<CR>
nnoremap <Leader>H :%!xxd -r<CR>

" flutter
" nnoremap <leader>ff :FlutterEmulatorsLaunch Pixel_3a_API_30_x86<cr>:FlutterRun --enable-software-rendering<cr>
nnoremap <leader>fe :CocCommand flutter.emulators<cr><cr>
nnoremap <leader>ff :CocCommand flutter.run<cr>
nnoremap <leader>fd :CocCommand flutter.dev.openDevLog<cr>
nnoremap <leader>fq :CocCommand flutter.dev.quit<cr>
nnoremap <leader>fr :CocCommand flutter.dev.hotRestart<cr>

"==============================================================================
" Status Line
"==============================================================================
" set statusline=%m%F%=%y\ %l/%L\ %3v\ U+%04B
" set laststatus=2
" hi StatusLine guibg=Gray16 guifg=White
set laststatus=2
set statusline=\ %F%#StatusLine_g#\ %m%#StatusLine_r#\ %r%*%=
set statusline+=%y\ %{&encoding}\ %{&fileformat}\ %c

" Warnings
set statusline+=%#Error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%{StatuslineTrailingSpaceWarning()}
set statusline+=%*

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

function! StatuslineTrailingSpaceWarning()
	if !exists("b:statusline_trailing_space_warning")
		let result = search('\s\+$', 'nw') != 0
		if result
			let b:statusline_trailing_space_warning = ' [TS]'
		else
			let b:statusline_trailing_space_warning = ''
		endif
	endif
	return b:statusline_trailing_space_warning
endfunction

function! StatuslineTabWarning()
	if !exists("b:statusline_tab_warning")
		let b:statusline_tab_warning = ''
		if !&modifiable
			return b:statusline_tab_warning
		endif
		let tabs = search('^\t', 'nw') != 0
		"find spaces that arent used as alignment in the first indent column
		let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
		if tabs && spaces
			let b:statusline_tab_warning =  ' [MI]'
		elseif (spaces && !&et) || (tabs && &et)
			let b:statusline_tab_warning = '[&et]'
		endif
	endif
	return b:statusline_tab_warning
endfunction

"==============================================================================
" Linting
"==============================================================================
let g:syntastic_python_checkers = ["pylint"]
let g:syntastic_sh_checkers     = ["shellcheck"]
let g:syntastic_nasm_checkers   = ["nasm"]
let g:syntastic_nasm_nasm_args   = "-f elf64 -w+all -DLinux -DVERSION=\\\"VERSION\\\""
let g:syntastic_c_checkers      = ["splint"]
let g:syntastic_c_splint_args   = "-checks +posixlib +matchanyintegral +enumint -nullpass -nullret ./util.c -DVERSION=\\\"VERSION\\\""

set statusline+=%#statusline_r#
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_wq              = 0
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_enable_highlighting      = 0 "underline word
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_jump                = 0

" Symbols icon
let g:syntastic_error_symbol         = ''
let g:syntastic_warning_symbol       = ''
let g:syntastic_style_error_symbol   = ''
let g:syntastic_style_warning_symbol = '!'

"==============================================================================
" clang format
"==============================================================================
let g:clang_format#detect_style_file = 1

"==============================================================================
" git
"==============================================================================
let g:gitgutter_grep=''
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0

"==============================================================================
" Folding
"==============================================================================
set nofen
set foldnestmax=1
set foldmethod=syntax
set fillchars=""

"==============================================================================
" File type highlight
"==============================================================================
setf cfg
augroup filetypedetect
	autocmd BufNewFile,BufRead *.h     set filetype=c
	autocmd BufNewFile,BufRead *.csv   set filetype=csv
	autocmd BufNewFile,BufRead *.gpg   set filetype=gpg
	autocmd BufNewFile,BufRead *.log   set filetype=log
	autocmd BufNewFile,BufRead LICENSE set filetype=text
	autocmd BufNewFile,BufRead README  set filetype=markdown
	autocmd BufNewFile,BufRead *.s,*S,*.asm,*.macro set filetype=nasm
augroup END

"==============================================================================
" Auto Completor
"==============================================================================
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" let g:completor_auto_trigger = 1
" let g:completor_clang_binary = '/usr/bin/clang'
" let g:completor_nasm_omni_trigger = '/bin/nasm'
" let g:completor_complete_options = 'menuone,noselect,preview'
" let g:lsc_auto_map = v:true
"
" set dictionary+="~/.vim/dict/text.dict"
" au FileType * execute 'setlocal dict+=~/.vim/dict/'.&filetype.'.dict'
"
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <C-f> <C-X><C-K>

"==============================================================================
" Remove characters function
"==============================================================================
function TrimWhiteSpace()
	%s/\s\+$//e
	''
endfunction

function! Clean_file()
	" Save cursor line
	let save_pos = getpos(".")
	" Remove spaces from begin & end of line
	" Remove spaces after tab
	" Remove tab\n
	" Remove file last line if empty
	" Remove more than 2 empty lines
	" Remove empty comment lines
	" TODO remove 2 spaces between words
	%s/^ \+//e |
	\%s/^ \+\t/\t/e |
	\%s/ \+$//e |
	\%s/^\/\/$//e |
	\%s/\t\+\n//e |
	\%s/\t \+/\t/e |
	\%s/\($\n\)\+\%$//e |
	\%s/^\n\{1,\}//e
	" Return to saved cursor
	call setpos(".", save_pos)
	normal !k
endfunction

"==============================================================================
" File Templates
"==============================================================================
let g:filename      = expand("%:r")
let g:filename_ext  = expand("%:e")
let g:upperfilename = toupper(filename)

autocmd BufNewFile *.sh normal!ggi#!/bin/sh
autocmd BufNewFile *.py normal!ggi#!/usr/bin/env python3
autocmd BufNewFile *.s  exe "normal!ggiBITS 64section .rodatasection .datasection .bsssection .textglobal _start_start:" | normal!o
autocmd BufNewFile *.h  exe "normal!ggi/* See LICENSE file for copyright and "
	\"license details. */#ifndef ".g:upperfilename."_H#define "
	\.g:upperfilename."_H\#endif /* ".g:upperfilename."_H */" | normal!kk
autocmd BufNewFile *.c  exe "normal!ggi/* See LICENSE file for copyright and license"
	\"details. */#include <stdio.h>/* macros *//* typedef *//*"
	\"function declarations *//*"
	\"global variables *//* function implementations */intmain(int argc,"
	\" char *argv[]){return 0;}" | normal!kk
