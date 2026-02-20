-- lua/configs/lspconfig.lua

-- 1) Load NvChad default LSP behavior (keymaps, borders, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require("nvchad.configs.lspconfig")

-- 2) Small helper: apply NvChad defaults + your overrides, then enable server
local function setup(server, opts)
    vim.lsp.config[server] = vim.tbl_deep_extend("force", {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }, opts or {})

    vim.lsp.enable(server)
end

-- 3) Servers with “default” behavior
for _, server in ipairs({
    "html",
    "cssls",
}) do
    setup(server)
end

-- 4) Python: Pyright (type checker / language intelligence)
setup("pyright", {
    filetypes = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic", -- change to "strict" if you want
            },
        },
    },
})

-- 5) Python: Ruff LSP (linting, import sorting, code actions)
setup("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "ruff.toml",
        ".ruff.toml",
        ".git",
    },
    on_attach = function(client, bufnr)
        nvlsp.on_attach(client, bufnr)

        -- we usually let black/conform format instead
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
