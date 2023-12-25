---@type MappingsTable
local M = {}

M.general = {
    i = {
        ["<C-c>"] = { "<Esc>", "Escape :)" },
        ["<C-s>"] = { "<cmd>w!<cr>", "Force Save file" },
    },
    n = {
        ["<C-c>"] = { "<Esc>", "Escape :)" },
        [";"] = { ":", "Enter command mode", opts = { nowait = true } },
        ["<leader>so"] = { "<cmd>so<cr>", "Source file" },
        ["<C-a>"] = { "gg<S-v>G", "Select all" },

        ["<leader>w"] = { "<cmd>w<cr>", "Save file" },
        ["<C-s>"] = { "<cmd>w!<cr>", "Force save file" },
        ["<leader>q"] = { "<cmd>confirm q<cr>", "Quit"},
        ["<C-q>"] = { "<cmd>q!<cr>", "Force quit"},

        ["|"] = { "<cmd>vsplit<cr>", "Vertical split"},
        ["//"] = { "<cmd>split<cr>", "Horizontal split"},

        [">>"] = { "<S-v>>", "Indent"},
        ["<<"] = { "<S-v><", "Unindent"},

        ["<A-k>"] = { "<S-v>j<A-k>", "Move line up" },
        ["<A-j>"] = { "<S-v>k<A-j>", "Mode line down" },

        ["<C-Up>"] = { "<cmd>resize -2<cr>", "Resize split up" },
        ["<C-Down>"] = { "<cmd>resize +2<cr>", "Resize split down" },
        ["<C-Left>"] = { "<cmd>vertical resize -2<cr>", "Resize split left" },
        ["<C-Right>"] = { "<cmd>vertical resize +2<cr>", "Resize split right" },

        ["<leader>un"] = { "<cmd>set rnu!<cr>", "Toggle relative number" },
        ["<leader>ut"] = { function() vim.g.transparency = not vim.g.transparency require("base46").load_all_highlights() end, "Toogle transparency" },
        ["<leader>ur"] = { function() vim.cmd.source(vim.fn.stdpath "config" .. "/lua/custom/init.lua") end, "Reload Init" },

    },
    v = {
        ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move code up" },
        ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Mode code down" },
    },
}

M.mason = {
    plugin = false,
    n = {
        ["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" },
        ["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" },
    }
}

M.lazy = {
    plugin = false,
    n = {
        ["<leader>pi"] = { function() require("lazy").install() end, "Lazy Plugins Install" },
        ["<leader>ps"] = { function() require("lazy").home() end, "Lazy Plugins Status" },
        ["<leader>pS"] = { function() require("lazy").sync() end, "Lazy Plugins Sync" },
        ["<leader>pu"] = { function() require("lazy").check() end, "lazy Plugins Check Updates" },
        ["<leader>pU"] = { function() require("lazy").update() end, "lazy Plugins Update" },
    },
}

M.tubufline = {
    plugin = false,
    n = {
        ["<leader>bn"] = { "<cmd>enew<cr>", "New buffer" },
        ["<leader>bl"] = { function() require("nvchad.tabufline").move_buf(1) end, "Move current buffer right" },
        ["<leader>bh"] = { function() require("nvchad.tabufline").move_buf(-1) end, "Move current buffer left" },
        ["<leader>bx"] = { function() require("nvchad.tabufline").closeAllBufs() end, "Close all buffers" },
    },
}

M.harpoon = {
    plugin = true,
    n = {
        ["<leader>ha"] = { function() require("harpoon.mark"):append() end, "Add file to harpoonn" },
        ["<leader>hi"] = { function() require("harpoon.ui"):toggle_quick_menu(require("harpoon.mark"):list()) end, "Harpoon menu" },
        ["<leader>h1"] = { function() require("harpoon.ui"):nav_file(1) end, "Harpoon slot 1" },
        ["<leader>h2"] = { function() require("harpoon.ui"):nav_file(2) end, "Harpoon slot 2" },
        ["<leader>h3"] = { function() require("harpoon.ui"):nav_file(3) end, "Harpoon slot 3" },
        ["<leader>h4"] = { function() require("harpoon.ui"):nav_file(4) end, "Harpoon slot 4" },
    }
}

M.ufo = {
    plugin = true,
    n = {
        ["zf"] = { function() require("ufo").closeFoldsWith() end, "Fold more" },
        ["zo"] = { function() require("ufo").openFoldsExceptKinds() end, "Fold less" },
        ["zF"] = { function() require("ufo").closeAllFolds() end, "Close all folds" },
        ["zO"] = { function() require("ufo").openAllFolds() end, "Open all folds" },
        ["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, "Peek fold" },
    }
}

M.lspconfig = {
    plugin = true,
    n = {
        ["K"] = { function() vim.lsp.buf.hover() end, "LSP hover" },
        ["<leader>ld"] = { function() vim.lsp.buf.definition() end, "LSP definition" },
        ["<leader>lD"] = { function() vim.lsp.buf.declaration() end, "LSP declaration" },
        ["<leader>li"] = { function() vim.lsp.buf.implementation() end, "LSP implementation" },
        ["<leader>ls"] = { function() vim.lsp.buf.signature_help() end, "LSP signature help" },
        ["<leader>lt"] = { function() vim.lsp.buf.type_definition() end, "LSP definition type" },
        ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
        ["<leader>lr"] = { function() vim.lsp.buf.references() end, "LSP references" },
        ["<leader>la"] = { function() vim.lsp.buf.add_workspace_folder() end, "LSP add workspace folder" },
        ["<leader>lr"] = { function() vim.lsp.buf.remove_workspace_folder() end, "LSP remove workspace folder" },
        ["<leader>lr"] = { function() require("nvchad.renamer").open() end, "LSP rename" },
        ["<leader>ll"] = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "LSP list workspace folders" },

        ["<leader>df"] = { function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic" },
        ["<leader>d["] = { function() vim.diagnostic.goto_prev { float = { border = "rounded" } } end, "Diagnostics Goto prev" },
        ["<leader>d]"] = { function() vim.diagnostic.goto_next { float = { border = "rounded" } } end, "Diagnostics Goto next" },
        ["<leader>dl"] = { function() vim.diagnostic.setloclist() end, "Diagnostic setloclist" },
    },
    v = {
        ["<leader>la"] = { function() vim.lsp.buf.code_action() end, "LSP code action" },
    },
}

M.gitsigns = {
    plugin = true,
    n = {
        ["<leader>g]"] = { function() require("gitsigns").next_hunk() end, "Next git hunk" },
        ["<leader>g["] = { function() require("gitsigns").prev_hunk() end, "Previous git hunk" },
        ["<leader>gl"] = { function() require("gitsigns").blame_line() end, "View git blame" },
        ["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview git hunk" },
        ["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, "Reset git hunk" },
        ["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, "Reset git buffer" },
        ["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, "Stage git hunk" },
        ["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, "Stage git buffer" },
        ["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, "Unstage git hunk" },
        ["<leader>gd"] = { function() require("gitsigns").diffthis() end, "View git diff" },
        ["<leader>gD"] = { function() require("gitsigns").toggle_deleted() end, "Toggle git deleted hunk" },
    }
}

M.telescope = {
    plugin = true,
    n = {
        ["<leader>f<cr>"] = { "<cmd>Telescope resume", "Resume previous search" },
        ["<leader>fz"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Find in current buffer" },
        ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Find highlight" },
        ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Find help" },
        ["<leader>fc"] = { "<cmd>Telescope grep_string", "Find for word under cursor" },
        ["<leader>fC"] = { "<cmd>Telescope commands", "Find commands" },
        ["<leader>fk"] = { "<cmd>Telescope keymaps", "Find keymaps" },
        ["<leader>fM"] = { "<cmd>Telescope man_pages", "Find man" },
        ["<leader>fr"] = { "<cmd>Telescope registers", "Find registers" },
        ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Watch git branches" },
        ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Watch git commits" },
        ["<leader>gt"] = { "<cmd>Telescope git_status<cr>", "Watch git status" },
        ["<leader>fm"] = { "<cmd>Telescope marks<cr>", "Find bookmarks" },
        ["<leader>fW"] = { function() require("telescope.builtin").live_grep { additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end } end, "Find words in all files" },
    }
}

M.undo = {
    plugin = true,
    n = {
        ["<leader>fu"] = { "<CMD>Telescope undo<CR>", "Find undo" },
    },
}

M.todo = {
    plugin = true,
    n = {
        ["<leader>t"] = { "<CMD>TroubleToggle<CR>", "Toggle diagnostics" },
        ["<leader>td"] = { "<CMD>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<CR>", "Todo/Fix/Fixme" },
    },
}

M.treesj = {
    plugin = true,
    n = {
        ["<leader>tt"] = { "<CMD>TSJToggle<CR>", "Toggle Treesitter Join/Split" },
    },
}

M.prettyHover = {
    plugin = true,
    n = { ["<leader>k"] = { function() require("pretty_hover").hover() end, "Pretty Hover" } },
}

M.codeactionmenu = {
    plugin = true,
    n = {
        ["<leader>j"] = { "<cmd>CodeActionMenu<cr>", "Show code action menu" },
    }
}

M.lazygit = {
    plugin = true,
    n = {
        ["<leader>gg"] = { "<cmd>LazyGit<cr>", "Lazy git" },
    }
}

M.lsplines = {
    plugin = true,
    n = {
        ["<leader>l<cr>"] = { function() require("lsp_lines").toogle() end, "Toogle lsp lines" },
    }
}

M.zzz = {
    plugin = false,
    n = {
        ["<leader>b"] = { "", "New buffer" },
        ["<leader>D"]= { "", "" },
        ["<leader>ma"] = { "", "Telescope bookmarks" },
        ["<leader>rn"] = {"", "LSP rename"},
        ["<leader>n"] = {"", ""},
        ["<leader>cm"] = {"", ""},
        ["<leader>ca"] = {"", "LSP code action"},
        ["<leader>ra"] = {"", ""},
        ["<leader>rh"] = {"", ""},
        ["<leader>wa"] = {"", ""},
        ["<leader>wl"] = {"", ""},
        ["<leader>wr"] = {"", ""},
        ["<leader>pt"] = {"", ""},
        ["<leader>ph"] = {"", ""},
        ["<leader>lf"] = {"", ""},
        ["<leader>td"] = {"", "Toogle deleted git hunk"},
    },
}

return M
