vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.signcolumn = 'yes'

vim.pack.add({
	{src = "https://github.com/bjarneo/pixel.nvim"},
	{src = "https://github.com/xiyaowong/transparent.nvim"},
	{src = "https://github.com/neovim/nvim-lspconfig"},
	{src = "https://github.com/nvim-telescope/telescope.nvim"},
	{src = "https://github.com/nvim-lua/plenary.nvim"},
	{src = "https://github.com/nvim-treesitter/nvim-treesitter"},
	{src = "https://github.com/mason-org/mason.nvim"},
	{src = "https://github.com/mason-org/mason-lspconfig.nvim"},
	{src = "https://github.com/Saghen/blink.cmp"},
	{src = "https://github.com/zbirenbuam/copilot.lua"},
	{src = "https://github.com/fang2hou/blink-copilot"},
})

vim.cmd("colorscheme pixel")
require('transparent').setup({})

require("mason").setup({})
require("mason-lspconfig").setup({})

require("blink.cmp").setup({fuzzy = { implementation = "lua"},sources = {default = { 'copilot', 'lsp', 'buffer', 'snippets', 'path' }, providers = {copilot = {name = "copilot",module = "blink-copilot",score_offset = 100,async = true,opts = {max_completions = 3,}}}}})

require("copilot").setup({})

vim.keymap.set('n', '<leader>e', ':Explore<CR>')
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Telescope help tags' })
