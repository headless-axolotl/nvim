
local function fconfig()
    local kanagawa = require("kanagawa")
    -- Default options:
    kanagawa.setup({
        compile = false,              -- enable compiling the colorscheme
        undercurl = false,            -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,         -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = false,      -- define vim.g.terminal_color_{0,17}
        colors = {                   -- add/modify theme and palette colors
            palette = {},
            theme = {
                wave = {},
                lotus = {},
                dragon = {},
                all = {}
            },
        },
        overrides = function(colors) -- add/modify highlights
            return {
                DiagnosticSignInfo = { bg = "#181616", },
                FloatBorder = { bg = "#181616", },
            }
        end,
        -- dragon, wave, lotus
        theme = "dragon",            -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
            dark = "dragon",           -- try "dragon" !
            light = "lotus"
        },
        integrations = {
            noice = true
        },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
end

return {
    "rebelot/kanagawa.nvim",
    config = fconfig,
}
