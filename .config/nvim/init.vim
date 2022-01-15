let mapleader =","

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

source ~/.config/nvim/plug-config/plugins.vim
source ~/.config/nvim/general/basic.vim

" Keybindings
source ~/.config/nvim/keys/fzf.vim
source ~/.config/nvim/keys/goyo.vim
source ~/.config/nvim/keys/splits.vim
source ~/.config/nvim/keys/shell.vim

" Plugin configs
source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/netrw.vim
source ~/.config/nvim/plug-config/vimwiki.vim
