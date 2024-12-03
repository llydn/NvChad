local options = {
    ensure_installed = {
        "bash",
        "lua",
        "python",
        "printf",
        "vim",
        "luadoc",
        "vimdoc",
        "json",
        "yaml",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = {"copilot.lua"}

    },
    indent = {
        enable = true,
    },
}

return options
