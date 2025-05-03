local config = require("nvim-treesitter.configs")
require('lualine').setup()
require("bufferline").setup {}
require("toggleterm").setup {}
require("notify")

-- The setup config table shows all available config options with their default values:
require("presence").setup({
	-- General options
	auto_update = true,              -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
	neovim_image_text = "I use neovim btw", -- Text displayed when hovered over the Neovim image
	main_image = "file",             -- Main image display (either "neovim" or "file")
	enable_line_number = false,      -- Displays the current line number instead of the current project
	blacklist = {},                  -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	buttons = true,                  -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
	file_assets = {},                -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time = true,                -- Show the timer

	-- Rich Presence text options
	editing_text = "Coding in %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	file_explorer_text = "Scrolling %s",   -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	plugin_manager_text = "Messing something up", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	reading_text = "Reading %s",           -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	workspace_text = "Coding in %s",       -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})


-- virtual line
vim.diagnostic.config({
	virtual_text = {
		prefix = '●', -- or '■', '▎', '▶' or ''
		spacing = 4, -- space between text and diagnostic
	},
	signs = true, -- show signs in the gutter
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})



-- treesitter
config.setup({
	ensure_installed = { "lua", "javascript" },
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

local function setup_lsp_diags()
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			virtual_text = false,
			signs = true,
			update_in_insert = false,
			underline = true,
		}
	)
end



vim.opt.termguicolors = true
vim.opt.number = true
