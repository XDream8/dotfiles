let mapleader =","

lua <<EOF
local user_packadd_path = "faerryn/user.nvim/default/default/default/default"
local user_install_path = vim.fn.stdpath("data").."/site/pack/user/opt/"..user_packadd_path
if vim.fn.isdirectory(user_install_path) == 0 then
  os.execute("git clone --quiet --depth 1 https://github.com/faerryn/user.nvim.git "..vim.fn.shellescape(user_install_path))
end
vim.api.nvim_command("packadd "..vim.fn.fnameescape(user_packadd_path))
EOF

source ~/.config/nvim/plug-config/plugins.lua
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
