local vim = vim
local Plug = vim.fn['plug#']

vim.wo.number = true

vim.call('plug#begin')

Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.5' })

vim.call('plug#end')
