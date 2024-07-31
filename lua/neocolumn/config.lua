local M = {}

local hex = function(n)
  return string.format("#%06x", n)
end

local bg = function(n)
  local color = vim.api.nvim_get_hl_by_name(n, true)
  return hex(color.background)
end

M.defaults = {
    colors = {
        normal = "#7d7d7d",
        error = "#db4b4b",
        error_near = "#3ba792",
        error_far = "#5c9287",
        warn = "#e0af68",
        warn_near = "#bf9e6e",
        warn_far = "#9e8e76",
        info = "#0db9d7",
        info_near = "#32a6ba",
        info_far = "#58919c",
        hint = "#1abc9c",
        hint_near = "#1abc9c",
        hint_far = "#32a6ba",
        bg = bg('Normal'),
        cursor_bg = bg('CursorLine')
    },
    exclude_filetypes = {
        "help",
        "man"
    },
    diagnostics = true,
    min_diagnostic_severity = vim.diagnostic.severity.HINT,
    max_line_length = 100,
    character = "│",
    max_distance = 0
}

function M.set(opts)
    M.opts = vim.tbl_deep_extend("force", M.defaults, opts)
end

return M
