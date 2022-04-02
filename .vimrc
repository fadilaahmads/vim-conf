" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Add color scheme
colorscheme PaperColor

" Set background color
set background=dark

" Enable auto indentation
set autoindent

" Automatically wrap text that extends beyond the screen length.
set wrap

" VIMSCRIPT -------------------------------------------------------------- {{{

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

" }}}


" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
 set statusline=

set statusline+=%{StatuslineGit()}

" Status line left side.
 set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
 set statusline+=%=

" Status line right side.
 set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
 set laststatus=2

" }}}
