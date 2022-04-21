set background=dark
colorscheme dracula
"Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set smartcase
set encoding=utf-8
set number relativenumber
set number!
" use normal cliphoard not crazy primary bullshit
set clipboard=unnamedplus
" Tab Settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
" Autocompletion
set wildmode=longest,list,full
" Fix splitting
set splitbelow splitright
" Cursor line
" set cursorline
" set cursorcolumn
" mouse scrolling
set mouse=a
set go=a
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set nowritebackup
set noswapfile     "no swap files
set history=100		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set noautoindent    " fuck auto-indent
set formatoptions-=cro " no auto-comment
" word wrap stuff
set wrap
set wrapscan
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
" case insensitive (and smart) search
set ignorecase
set smartcase
set nohlsearch
" redraw less
set lazyredraw
set updatetime=300
set timeoutlen=500

" Don't use Ex mode, use Q for formatting
map Q gq
" Save as root
cnoremap w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want:
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
map <leader>v :VimwikiIndex
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

" Run source whenever init.vim is updated
autocmd BufWritePost $MYVIMRC source %

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
