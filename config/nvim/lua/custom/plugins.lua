---@type NvPluginSpec[]
local plugins = {
    {
        "elkowar/yuck.vim",
    },
    {
        "neovim/nvim-lspconfig",
        init = function() require("core.utils").load_mappings "lspconfig" end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts) return require("custom.configs.treesitter") end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = function(_, opts) return require("custom.configs.nvimtree") end,
    },
    {
        "lewis6991/gitsigns.nvim",
        init = function() require("core.utils").load_mappings "gitsigns" end,
        opts = function(_, opts) return require("custom.configs.gitsigns") end,
        dependencies = {
            { "sindrets/diffview.nvim", config = true }
        },
    },
    {
        "NvChad/nvterm",
        config = function() require("nvterm").setup(require("custom.configs.nvterm")) end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup(require("custom.configs.indent").config) end,
    },
    {
        "kevinhwang91/nvim-ufo",
        init = function() require("core.utils").load_mappings "ufo" end,
        event = "VimEnter",
        dependencies = { 
            { "kevinhwang91/promise-async" },
            { "luukvbaal/statuscol.nvim", opts = function(_, opts) return require("custom.configs.ufo").statuscol end },
        },
        opts = { close_fold_kinds = { "imports" }, provider_selector = function() return { "treesitter", "indent" } end},
    },
    {
        "ThePrimeagen/harpoon",
        config = function() require("harpoon").setup() end,
        init = function() require("core.utils").load_mappings "harpoon" end,
    },
    -- {
    --     "utilyre/barbecue.nvim",
    --     name = "barbecue",
    --     event = "LspAttach",
    --     dependencies = {
    --         "SmiteshP/nvim-navic",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    -- },
    {
        "weilbith/nvim-code-action-menu",
        init = function() require("core.utils").load_mappings "codeactionmenu" end,
        config = function() dofile(vim.g.base46_cache .. "git") end,
        cmd = "CodeActionMenu",
    },
    {
        "0oAstro/dim.lua",
        config = function() require("dim").setup {} end,
        requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        event = "LspAttach",
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        init = function() require("core.utils").load_mappings "lsplines" end,
        config = function() require("lsp_lines").setup() vim.diagnostic.config({ virtual_lines = { only_current_line = true } }) end,
        event = "LspAttach",
    },
    {
        "nvimdev/lspsaga.nvim",
        opts = function(_, opts) return require("custom.configs.lspsaga") end,
        event = "LspAttach",
    },
    {
        "jinzhongjia/LspUI.nvim",
        config = function() require("LspUI").setup() end,
        event = "LspAttach",
    },
    {
        "Fildo7525/pretty_hover",
        init = function() require("core.utils").load_mappings "prettyHover" end,
        config = true,
        cmd = "Pretty",
    },
    {
        "kdheepak/lazygit.nvim",
        init = function() require("core.utils").load_mappings "lazygit" end,
        cmd = "LazyGit",
    },
    {
        "razak17/tailwind-fold.nvim",
        ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
        opts = { min_chars = 50 },
    },
    {
        "kevinhwang91/nvim-fundo",
        build = function() require("fundo").install() end,
        event = "VeryLazy",
    },
    {
        "Wansmer/treesj",
        init = function() require("core.utils").load_mappings "treesj" end,
        cmd = { "TSJToggle" },
        opts = { use_default_keymaps = false },
    },
    {
        "code-biscuits/nvim-biscuits",
        opts = function(_, opts) return require("custom.configs.biscuits") end,
        event = "BufReadPost",
    },
    {
        "m-demare/hlargs.nvim",
        config = function() require("hlargs").setup { hl_priority = 200 } end,
        event = "BufWinEnter",
    },
    {
        "chikko80/error-lens.nvim",
        event = "BufRead",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },
    {
        "folke/trouble.nvim",
        init = function() require("core.utils").load_mappings "todo" end,
        cmd = { "Trouble", "TroubleToggle", "TodoTrouble" },
    },
    {
        "RRethy/vim-illuminate",
        event = { "CursorHold", "CursorHoldI" },
        dependencies = "nvim-treesitter",
        config = function() require("illuminate").configure { require("custom.configs.illuminate") } end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "debugloop/telescope-undo.nvim" },
        init = function(_, opts)
            require("telescope").load_extension "undo"
            require("core.utils").load_mappings "undo"
            require("core.utils").load_mappings "telescope"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        config = function(_, opts) table.insert(opts.sources, { name = "cmp_tabnine" }) require("cmp").setup(opts) end,
        dependencies = {
            {
                "tzachar/cmp-tabnine",
                build = "./install.ps1",
                config = function()
                    local tabnine = require "cmp_tabnine.config"
                    tabnine:setup {
                        max_lines = 1000,
                        max_num_results = 3,
                        sort = true,
                        show_prediction_strength = false,
                        run_on_every_keystroke = true,
                        snipper_placeholder = "..",
                        ignored_file_types = {},
                    }
                end,
            },
        }
    },
}

return plugins
