local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
    -- catppuccin theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
    },

    -- LSP
    "neovim/nvim-lspconfig",
    --
    -- Syntax Highlighting
    "nvim-treesitter/nvim-treesitter",

    -- LSP package manager
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },

    -- Autocompletion
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "1.*",
    },

    -- Custom Formatters
    "stevearc/conform.nvim",

    -- Finding files
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            "junegunn/fzf",
            "nvim-telescope/telescope-ui-select.nvim",
        }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
    },

    -- Seamless navigation between vim and tmux
    "christoomey/vim-tmux-navigator",

    -- Helm files
    "towolf/vim-helm",

    -- Git Blame
    "f-person/git-blame.nvim",

    -- Undotree
    "mbbill/undotree",

    -- Colorful window separation
    "nvim-zh/colorful-winsep.nvim",

    -- lualine
    "nvim-lualine/lualine.nvim",

    -- File Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    },

    -- Fugitive
    "tpope/vim-fugitive",

    -- Which Key
    "folke/which-key.nvim",

    -- Duck
    "tamton-aquib/duck.nvim",

    -- LLM
    "David-Kunz/gen.nvim",

    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Arrow
    "otavioschwanck/arrow.nvim",

    -- Code block commenting
    "tpope/vim-commentary",

    -- Surround selection
    {
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            })
        end
    },

    -- Cursor Trail
    {
        "sphamba/smear-cursor.nvim",
        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears will blend better on all backgrounds.
            legacy_computing_symbols_support = false,

            -- Smear cursor in insert mode.
            -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
            smear_insert_mode = true,

            -- cursor_color = "#ff8800",
            stiffness = 0.3,
            trailing_stiffness = 0.1,
            trailing_exponent = 10,
            never_draw_over_target = true,
            -- hide_target_hack = true,
            gamma = 1,
        },
    },

    -- Smooth scroll
    {
        "karb94/neoscroll.nvim",
        opts = {
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            duration_multiplier = 1.0,   -- Global duration multiplier
            easing = 'linear',           -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            ignored_events = {           -- Events ignored while scrolling
                'WinScrolled', 'CursorMoved'
            },
        },
    }

}

require("lazy").setup(plugins, {})
