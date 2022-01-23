call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
" Customizations
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/goyo.vim'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'dhruvasagar/vim-table-mode'
" Completion
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
call plug#end()
