local M = {}

vim.g.rainbow = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowPurple",
    "RainbowCyan",
    "RainbowTeal",
}
---@type Base46HLGroupsList
M.override = {
    Comment = { italic = true },
    NvDashAscii = { bg = "black", fg = vim.g.ascii_banner_color },
    NvDashButtons = { bg = "black" },
    FoldColumn = { bg = "black" },
}

---@type HLTable
M.add = {
    NvimTreeOpenedFolderName = { fg = "green", bold = true },

    -- Rainbow indent
    RainbowRed = { fg = "red" },
    RainbowYellow = { fg = "yellow" },
    RainbowBlue = { fg = "blue" },
    RainbowOrange = { fg = "orange" },
    RainbowGreen = { fg = "green" },
    RainbowPurple = { fg = "purple" },
    RainbowCyan = { fg = "cyan" },
    RainbowTeal = { fg = "teal" },
}

return M
