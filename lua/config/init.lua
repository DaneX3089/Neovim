local config = require("nvim-treesitter.configs")
require('lualine').setup()
require("bufferline").setup{}
require("toggleterm").setup{}
require('overseer').setup()
require("notify")




-- treesitter
config.setup({
	ensure_installed = {"lua", "javascript"},
	highlight = { enable = true },
	indent = { enable = true },
})


-- cursorline
require('nvim-cursorline').setup {
  cursorline = {
    enable = true,
    timeout = 1000,
    number = false,
  },
  cursorword = {
    enable = true,
    min_length = 3,
    hl = { underline = true },
  }
}


vim.opt.termguicolors = true
vim.opt.number = true
