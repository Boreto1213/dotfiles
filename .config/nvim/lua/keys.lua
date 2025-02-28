local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Split
map("n", "<leader>%", ":vsp <cr>")
map("n", "<leader>\"", ":sp <cr>")

-- Copy to clipboard
map("v", "<C-c>", ':" < ">w !pbcopy<cr>')
map("n", "<C-v>", ":r !pbpaste<cr>")

-- Yank file path to clipboard
map("n", "<leader>cfp", '<Cmd>let @+ = expand(" % ")<CR>')

-- Telescope
map("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>fs", '<cmd>lua require("telescope.builtin").git_status()<cr>')

-- Git Blame
map("n", "<Leader>bt", "<cmd>GitBlameToggle<cr>")
map("n", "<Leader>bo", "<cmd>GitBlameOpenCommitURL<cr>")

-- Trouble
map("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle<cr>")

-- LSP: OnAttach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function()
        -- enable inlay hints (0.10)
        vim.lsp.inlay_hint.enable()

        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end
        -- Jump to the definition
        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

        -- Jump to declaration
        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

        -- Lists all the implementations for the symbol under the cursor
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

        -- Jumps to the definition of the type symbol
        bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

        -- Lists all the references
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

        -- Displays a function"s signature information
        bufmap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

        -- Renames all references to the symbol under the cursor
        bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

        -- Selects a code action available at the current cursor position
        bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
        bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
    end
})

-- Undotree Toggle
map("n", "<leader>u", ":UndotreeToggle<cr>")

-- Move visual selection up and down
map("v", "J", ':m ">+1<cr>gv=gv')
map("v", "K", ':m "<-2<cr>gv=gv')

-- Improved J (cursor stays in place instead of end of line)
map("n", "J", "mzJ`z")

-- Improved Up and Down (cursor stays in the middle)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Improved search (cursor stays in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Preserve yank after paste
map("x", "<leader>p", '"_dP')

-- Yank to clip
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Awesome prime keymap to replace current selected word
map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- NeoTree
map("n", "<Leader>n", "<cmd>Neotree reveal focus<cr>")
map("n", "\\", "<cmd>Neotree reveal toggle<cr>")

-- Git
map("n", "<Leader>gos", "<cmd>Git<cr>")
map("n", "<Leader>gov", "<cmd>Gvdiffsplit<cr>")

-- Disable q recording
map("n", "q", "<Nop>")

-- Resize panels
map("n", "<F9>", "<Cmd>vertical resize -5<CR>")  -- decrease width
map("n", "<F10>", "<Cmd>resize -5<CR>")          -- decrease height
map("n", "<F11>", "<Cmd>resize +5<CR>")          -- increase width
map("n", "<F12>", "<Cmd>vertical resize +5<CR>") -- increase width

-- Duck
map("n", "<leader>dd", '<Cmd>lua require("duck").hatch()<CR>')
map("n", "<leader>dk", '<Cmd>lua require("duck").cook()<CR>')

-- Notes
map("n", "<leader>mdp", '<Cmd>MarkdownPreview<CR>')
map("n", "<leader>mds", '<Cmd>MarkdownPreviewStop<CR>')

-- LLM
map("n", "<leader>ql", '<Cmd>lua require("gen").select_model()<CR>')
map("n", "<leader>qq", ':Gen Chat<CR>')
map("v", "<leader>qe", ':Gen Explain_Code<CR>')
map("v", "<leader>qi", ':Gen Improve_Code<CR>')
