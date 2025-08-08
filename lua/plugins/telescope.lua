local telescope = {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>T', ':Telescope<CR>', { desc = 'Telescope' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=true<CR>', { desc = 'Telescope find hidden files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fht', builtin.help_tags, { desc = 'Telescope help tags' })

        local telescope = require("telescope")
        telescope.setup {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            }
        }
        telescope.load_extension("ui-select")
    end
}

local telescope_ui_select = {
    'nvim-telescope/telescope-ui-select.nvim'
}

return {
    telescope, telescope_ui_select
}
