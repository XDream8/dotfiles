if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme edge`.
" let g:edge_style = 'aura'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1

" let g:lightline = {'colorscheme' : 'edge'}

let g:pencil_gutter_color = 1

colorscheme dracula
set background=dark
"Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set title
set smartcase
set encoding=utf-8
" set number relativenumber
set number!
" edits
set wrap
set wrapscan
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
set cursorline
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

" Don't use Ex mode, use Q for formatting
map Q gq
" Save as root
cmap w!! w !doas tee > /dev/null %

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost bm-files,bm-dirs !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
" Recompile dwmblocks on config edit.
	autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif