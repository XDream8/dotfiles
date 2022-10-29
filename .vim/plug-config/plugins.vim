
packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', { 'opt': 1}
Jetpack 'itchyny/lightline.vim', { 'event': 'BufWinEnter' }
Jetpack 'jiangmiao/auto-pairs', { 'event': 'BufWinEnter' }
" Jetpack 'Raimondi/delimitMate'
Jetpack 'tpope/vim-commentary', { 'event': 'BufWinEnter' }
" Jetpack 'junegunn/fzf.vim'
Jetpack 'airblade/vim-gitgutter', { 'event': 'InsertEnter' }
Jetpack 'vimwiki/vimwiki', { 'cmd': 'VimwikiIndex' }
"Jetpack 'dracula/vim', { 'as': 'dracula'}
Jetpack 'ghifarit53/tokyonight-vim'
Jetpack 'junegunn/goyo.vim', { 'cmd': 'Goyo' }
Jetpack 'mhinz/vim-startify'
Jetpack 'ap/vim-css-color', { 'event': 'BufWinEnter' }
Jetpack 'dhruvasagar/vim-table-mode', { 'cmd': 'TableModeToggle' }

"Jetpack 'dense-analysis/ale'
"Jetpack 'ervandew/supertab'

Jetpack 'prabirshrestha/vim-lsp', { 'for': ['python', 'c', 'cpp', 'lua', 'vim', 'sh'], 'event': 'BufRead' }
Jetpack 'mattn/vim-lsp-settings', { 'for': ['python', 'c', 'cpp', 'lua', 'vim', 'sh'], 'event': 'BufRead' }

Jetpack 'dstein64/vim-startuptime', { 'cmd': 'StartupTime' }

call jetpack#end()

for name in jetpack#names()
	if !jetpack#tap(name)
		call jetpack#sync()
		break
	endif
endfor
