local user = require("user")
user.setup({ parallel = true })
local use = user.use

-- user.nvim can manage itself!
use "faerryn/user.nvim"

use "itchyny/lightline.vim"
-- use "jiangmiao/auto-pairs"
use "tpope/vim-commentary"
use "junegunn/fzf.vim"
use "airblade/vim-gitgutter"
use "vimwiki/vimwiki"
-- Customizations
use {
	"dracula/vim",
	config = function() vim.api.nvim_command("colorscheme dracula") end,
}
use "junegunn/goyo.vim"
use "mhinz/vim-startify"
use "ap/vim-css-color"
use "dhruvasagar/vim-table-mode"
-- Completion
-- use 'ervandew/supertab'
use {
	"neoclide/coc.nvim",
	branch = 'release'
}

-- use "sheerun/vim-polyglot"
use "SirVer/ultisnips"
use "honza/vim-snippets"

-- since we are using parallel, we *must* call user.flush()
user.flush()

-- require("user").update()
