---@type ChadrcConfig
local M = {}

vim.g.ascii_banner_index = 4 -- math.random(#require("custom.utils.banner"))
vim.g.ascii_banner = require("custom.utils.banner")[vim.g.ascii_banner_index].ascii
vim.g.ascii_banner_color = require("custom.utils.banner")[vim.g.ascii_banner_index].color

require("custom")
local highlights = require("custom.highlights")

M.ui = {
    hl_override = highlights.override,
    hl_add = highlights.add,

    theme = "tokyodark",
    theme_toggle = { "tokyodark", "bearded-arc" },

    lsp_semantic_tokens = true,
    transparency = true,

    cmp = {
        border_color = "grey_fg",
    },
    statusline = {
        theme = "vscode_colored",
    },
    nvdash = {
        header = vim.g.ascii_banner,
        load_on_startup = true,
    },
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")
M.highlights = require("custom.highlights")

return M
