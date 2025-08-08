return {
    "nvim-lualine/lualine.nvim",
    config = function()
        local configs = require("lualine")
        configs.setup({
            options = {
                theme = "seoul256",
            },
        })
    end,
}

