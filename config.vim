set number
set textwidth=80
set wrap
set linebreak
set wrapmargin=2
set ruler
set showmode
set showcmd
set laststatus=2
set showmatch
set matchtime=5
syntax on
set mouse=a
set nocompatible
set expandtab
set backspace=2
set tabstop=4
set shiftwidth=4
set softtabstop=4
set cindent
set autoindent
set smartindent
set autoread
set encoding=utf-8
set fileencodings=utf-8,gb18030,gbk
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
let TextReader = "kate"
let Python = "python3"
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -lm -Wall -Wextra -fsanitize=bounds-strict,undefined -o \"%<\" && ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -lm -Wall -Wextra -fsanitize=bounds-strict,undefined -o \"%<\" && ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\" && sh ./\"%\""
    elseif &filetype == 'python'
        exec "!chmod u+x \"%\" &&" g:Python "-u ./\"%\""
    endif
endfunc
map <F6> :call CompileRunLOCAL()<CR>
func! CompileRunLOCAL()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -lm -Wall -Wextra -DLOCAL -fsanitize=bounds-strict,undefined -o \"%<\" && ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -lm -Wall -Wextra -DLOCAL -fsanitize=bounds-strict,undefined -o \"%<\" && ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\" && sh ./\"%\""
    elseif &filetype == 'python'
        exec "!chmod u+x \"%\" &&" g:Python "-u ./\"%\""
    endif
endfunc
map <F7> :call CompileRunDEBUG()<CR>
func! CompileRunDEBUG()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -g -lm -Wall -Wextra -DDEBUG -fsanitize=bounds-strict,undefined -o \"%<\" && gdb ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -g -lm -Wall -Wextra -DDEBUG -fsanitize=bounds-strict,undefined -o \"%<\" && gdb ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\" && sh -nxv ./\"%\""
    elseif &filetype == 'python'
        exec "!chmod u+x \"%\" &&" g:Python "-u -m pdb ./\"%\""
    endif
endfunc
map <C-W> :w<CR>
map <F8> :call TextReader()<CR>
func! TextReader()
    exec "w"
    exec "!" g:TextReader "\"%\" > /dev/null"
endfunc
func! Call(cmd)
    exec "!" a:cmd
endfunc
