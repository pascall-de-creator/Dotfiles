local options = {
    under_cursor = true,
    max_file_lines = nil,
    delay = 100,
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    filetypes_denylist = {
        "NvimTree",
        "Trouble",
        "Outline",
        "TelescopePrompt",
        "Empty",
        "dirvish",
        "fugitive",
        "alpha",
        "packer",
        "neogitstatus",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "aerial",
    },
}

return options
