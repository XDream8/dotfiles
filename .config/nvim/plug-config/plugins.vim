if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki'
" Customizations
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'preservim/vim-colors-pencil'
Plug 'junegunn/goyo.vim'
Plug 'ap/vim-css-color'
Plug 'dhruvasagar/vim-table-mode'
" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
call plug#end()
