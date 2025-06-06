local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    -- vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent,        opts("Up"))
    -- vim.keymap.set("n", "?",     api.tree.toggle_help,                  opts("Help"))
    vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical splib"))
    vim.keymap.set("n", "i", api.node.open.horizontal, opts("Open: Horizontal Split"))

    vim.keymap.set("n", "<C-x>", api.node.run.system, opts("Run System"))
end

-- return my_on_attach

require("nvim-tree").setup({
    on_attach = my_on_attach,
})
