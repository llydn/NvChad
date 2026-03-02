-- ~/.config/nvim/lua/configs/gitsigns.lua
local M = {}

function M.opts(_, opts)
    opts = opts or {}

    -- preserve existing on_attach if any
    local prev_on_attach = opts.on_attach

    opts.on_attach = function(bufnr)
        if prev_on_attach then
            prev_on_attach(bufnr)
        end

        local gs = package.loaded.gitsigns
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- 🔹 Navigation
        map("n", "]g", gs.next_hunk, "Next Git Hunk")
        map("n", "[g", gs.prev_hunk, "Prev Git Hunk")

        -- 🔹 Hunk preview
        map("n", "<leader>gp", gs.preview_hunk, "Preview Git Hunk")

        -- 🔹 Stage
        map("n", "<leader>gs", gs.stage_hunk, "Stage Git Hunk")
        map("v", "<leader>gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage Selected Hunk")

        -- 🔹 Unstage
        map("n", "<leader>gu", gs.undo_stage_hunk, "Unstage Git Hunk")
        map("v", "<leader>gu", function()
            gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Unstage Selected Hunk")

        -- 🔹 Reset
        map("n", "<leader>gr", gs.reset_hunk, "Reset Git Hunk")
        map("v", "<leader>gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset Selected Hunk")

        -- 🔹 Diff
        map("n", "<leader>gd", gs.diffthis, "Git Diff This File")
    end

    return opts
end

return M
