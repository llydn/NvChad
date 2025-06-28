require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>c", require("osc52").copy_operator, { expr = true })
map("n", "<leader>cc", "<leader>c_", { remap = true })
map("v", "<leader>c", require("osc52").copy_visual)

map("i", "<C-E>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
    silent = true,
})
map("i", "<C-p>", "<Esc>:Copilot panel<CR>", { noremap = true, silent = true })

-- map("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<CR>"]], { expr = true, silent = true })

-- map("n", "K", ":call ShowDocumentation()<CR>", { noremap = true, silent = true })
-- map("n", "K", "vim.lsp.show_document()<CR>", { noremap = true, silent = true })

-- local function CheckBackSpace()
--     local col = vim.fn.col(".") - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
-- end
-- local function Accept()
--     if vim.fn.pumvisible() == 1 then
--         return vim.fn["coc#pum#next"](1)
--     else
--
--         if vim.fn.exists("b:_copilot.suggestions") == 1 then
--             return vim.fn["copilot#Accept"]("<CR>")
--         else
--             if CheckBackSpace() then
--                 return "<Tab>"
--             else
--                 return vim.fn["coc#refresh"]()
--             end
--         end
--     end
-- end
-- map(
--     "i",
--     "<Tab>",
--     Accept(),
--     { expr = true, silent = true, replace_keycodes = false }
-- )
-- map("i", "<S-Tab>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], { expr = true, silent = true })
-- map("n", "<space>a", ":<C-u>CocList diagnostics<CR>", { noremap = true, silent = true, nowait = true })
-- map("n", "<space>f", ":<C-u>call CocAction('format')<CR>", { noremap = true, silent = true, nowait = true })
-- map("n", "gd", "<Plug>(coc-definition)", { silent = true })

-- mute highlight search shortcut
map("n", "<C-l>", ":<C-u>nohlsearch<CR><C-l>", { noremap = true, silent = true, desc = "No highlight search" })

-- remap %% to complete curpath
map("c", "%%", [[getcmdtype() == ':' ? expand('%:h') .. '/' : '%%']], { expr = true, noremap = true })

-- remap telescope git commit 
map("n", "<leader>gc", "<leader>cm", { noremap = true, desc = "Telescope git commits" })
vim.keymap.del("n", "<leader>cm")

-- remap lsp hover from to '<leader>K'
map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
vim.keymap.set('n', '<leader>k', '<Nop>', { noremap = true, silent = true })

-- remap lsp go to type definition
map("n", "gy", vim.lsp.buf.type_definition, { desc = "LSP go to type definition" })
-- remap lsp go to implementation
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP go to implementation" })
-- remap lsp show documentation
map("n", "gr", vim.lsp.buf.references, { desc = "LSP go to references" })
-- map open most recent closed buffer
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })
