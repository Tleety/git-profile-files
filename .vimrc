" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


"" Indentation options
set autoindent	      " New lines inherit the indentation of previous lines
set tabstop=8	      " Make a tab equal 8 spaces
set softtabstop=2     " How far the cursor moves when pressing tab
set noexpandtab	      " 


"" User Interface Options
set ruler	      " Always show cursor position
set cursorline	      " Highlight the line currently under the cursor
set number	      " Show line numbers on the sidebar
set relativenumber    " Show line number on the current line and relative numbers on all other
set visualbell	      " Use visual bell (no beeping)


"" Search Options
set hlsearch	      " Enable search highlighting
set ignorecase	      " Ignore case when searching
set smartcase	      " Automatically switch search to case sensitive when search query contains an uppercase letter
set incsearch	      " Incremental search that shows partial matches


au BufNewFile,BufRead Jenkinsfile setf groovy
