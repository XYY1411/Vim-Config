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
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>kA
map <F5> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -lm -Wall -Wextra -o \"%<\" && ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -lm -Wall -Wextra -o \"%<\" && ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\""
        exec "!./\"%\""
    endif
endfunc
map <F6> :call CompileRunLOCAL()<CR>
func! CompileRunLOCAL()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -lm -Wall -Wextra -DLOCAL -o \"%<\" && ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -lm -Wall -Wextra -DLOCAL -o \"%<\" && ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\""
        exec "!./\"%\""
    endif
endfunc
map <F7> :call CompileRunDEBUG()<CR>
func! CompileRunDEBUG()
    exec "w"
    if &filetype == 'c'
        exec "!gcc \"%\" -g -lm -Wall -Wextra -DDEBUG -o \"%<\" && gdb ./\"%<\""
    elseif &filetype == 'cpp'
        exec "!g++ \"%\" -g -lm -Wall -Wextra -DDEBUG -o \"%<\" && gdb ./\"%<\""
    elseif &filetype == 'sh'
        exec "!chmod u+x \"%\""
        exec "!./\"%\""
    endif
endfunc
map <C-W> :w<CR>
map <F8> :call TextReader()<CR>
func! TextReader()
    exec "w"
    exec "!kate \"%\""
endfunc
