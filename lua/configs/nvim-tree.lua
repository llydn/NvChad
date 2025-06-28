local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical splib"))
    vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open: Horizontal Split"))

    vim.keymap.set("n", "n", api.fs.create, opts("Create File Or Directory"))
    vim.keymap.del("n", "a", { buffer = bufnr })  -- remove default mapping for 'a'

    vim.keymap.set("n", "<C-x>", api.node.run.system, opts("Run System"))
    vim.keymap.del("n", "<C-v>", { buffer = bufnr })  -- remove default mapping for <C-v>

    vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
    vim.keymap.del("n", "<C-t>", { buffer = bufnr })  -- remove default mapping for <C-t>
end

-- return my_on_attach

require("nvim-tree").setup({
    on_attach = my_on_attach,
})
