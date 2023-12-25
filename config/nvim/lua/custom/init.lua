local opt = vim.opt
local g = vim.g
local o = vim.o
local cmd = vim.cmd

opt.fileencoding = "utf-8"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

opt.copyindent = true
opt.cursorline = true

opt.nu = true
opt.relativenumber = true

opt.wrap = false
opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true

opt.scrolloff = 10
opt.virtualedit = "block"
opt.history = 100
opt.writebackup = false

opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"

opt.fillchars = {
    fold = " ",
    foldopen = "",
    foldsep = " ",
    foldclose = "",
    stl = " ",
    eob = " ",
}

g.highlighturl_enabled = true
g.autoformat_enabled = true
g.codelens_enabled = true
g.lsp_handlers_enabled = true
g.autopairs_enabled = true
g.icons_enabled = true

g.code_action_menu_show_details = true
g.code_action_menu_show_diff = true
g.code_action_menu_show_action_kind = true

o.undofile = true
o.foldcolumn = "auto"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldnestmax = 0
o.foldenable = true
o.foldmethod = "indent"


vim.api.nvim_create_autocmd({"BufEnter", "BufNew"}, {
    callback = function()
        vim.cmd [[highlight FoldColumn guibg=nocombine]]

        vim.g.ascii_banner_color = math.random(#require("custom.utils.banner"))
        vim.g.ascii_banner = require("custom.utils.banner")[vim.g.ascii_banner_color].ascii
        vim.g.ascii_banner_color = require("custom.utils.banner")[vim.g.ascii_banner_color].color
    end,
})
