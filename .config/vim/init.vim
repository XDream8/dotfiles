let mapleader =","

" lua <<EOF
" local user_packadd_path = "faerryn/user.nvim/default/default/default/default"
" local user_install_path = vim.fn.stdpath("data").."/site/pack/user/opt/"..user_packadd_path
" if vim.fn.isdirectory(user_install_path) == 0 then
"   os.execute("git clone --quiet --depth 1 https://github.com/faerryn/user.nvim.git "..vim.fn.shellescape(user_install_path))
" end
" vim.api.vim_command("packadd "..vim.fn.fnameescape(user_packadd_path))
" EOF

source ~/.vim/plug-config/plugins.vim
source ~/.vim/general/basic.vim

" Keybindings
source ~/.vim/keys/fzf.vim
source ~/.vim/keys/goyo.vim
source ~/.vim/keys/splits.vim
source ~/.vim/keys/shell.vim

" Plugin configs
" source ~/.vim/plug-config/coc.vim
source ~/.vim/plug-config/netrw.vim
source ~/.vim/plug-config/vimwiki.vim