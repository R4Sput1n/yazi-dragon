local M = {}

function M.escape_path(path)
    -- Escape special characters in path
    return path:gsub("'", "'\\''")
end

return M
