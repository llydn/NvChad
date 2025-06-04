local null_ls = require("none-ls")

local opts = {
    sources = {
        null_ls.builtins.diagnostics.mypy.with({
            extra_args = function()
                local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX") or "/usr"
                return { "--python-executable", virtual .. "/bin/python3" }
            end,
        }),
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.ruff,
    },
}

return opts
