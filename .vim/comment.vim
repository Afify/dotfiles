" Commment one line (Controle /)
autocmd FileType *      nnoremap <buffer> <C-_> <Home>i# <esc>
autocmd FileType vim    nnoremap <buffer> <C-_> <Home>i" <esc>
autocmd FileType nasm   nnoremap <buffer> <C-_> <Home>i; <esc>
autocmd FileType c,cpp  nnoremap <buffer> <C-_> <Home>i// <esc>
autocmd FileType c      nnoremap <buffer> <Leader>/ ^i/* <End> */<esc>
autocmd FileType css    nnoremap <buffer> <C-_> <Home>i/* <End> */<esc>
autocmd FileType html   nnoremap <buffer> <C-_> <Home>i<!-- <End> --><esc>

" Uncomment one line (Shift /)
autocmd FileType *      nnoremap <buffer> ? :s/^# /<CR>
autocmd FileType vim    nnoremap <buffer> ? :s/^" /<CR>
autocmd FileType nasm   nnoremap <buffer> ? :s/^; /<CR>
autocmd FileType c,cpp  nnoremap <buffer> ? :s/^\/\/ /<CR>
autocmd FileType c      nnoremap <buffer> <Leader>? :s/^/* /<CR>:s/ */$/<CR>
autocmd FileType css    nnoremap <buffer> ? :s/^/* /<CR>:s/ */$/<CR>
autocmd FileType html   nnoremap <buffer> ? :s/^<!-- /<CR>:s/ -->$/<CR>

" Commment selected lines (Controle /)
autocmd FileType *      vnoremap <buffer> <C-_> <Home><C-v>I# <esc><esc>
autocmd FileType vim    vnoremap <buffer> <C-_> <Home><C-v>I" <esc><esc>
autocmd FileType nasm   vnoremap <buffer> <C-_> <Home><C-v>I; <esc><esc>
autocmd FileType c,cpp  vnoremap <buffer> <C-_> <Home><C-v>I// <esc><esc>

" Uncomment selected lines (Shift /)
autocmd FileType *      vnoremap <buffer> ? :s/^# /<CR>
autocmd FileType vim    vnoremap <buffer> ? :s/^" /<CR>
autocmd FileType nasm   vnoremap <buffer> ? :s/^; /<CR>
autocmd FileType c,cpp  vnoremap <buffer> ? :s/^\/\/ /<CR>
