return {
    entry = function(ctx)
        local h = require("dragon.helper")
        local current = ctx.active.current
        if not current then
            return
        end
        
        local selections = ctx.active.selections
        local files = {}
        
        -- If there are selections, use those
        if next(selections) then
            for path, _ in pairs(selections) do
                table.insert(files, path)
            end
        else
            -- Otherwise use the current file
            table.insert(files, current.path)
        end
        
        -- Escape paths and build command
        local escaped_paths = {}
        for _, path in ipairs(files) do
            table.insert(escaped_paths, string.format("'%s'", h.escape_path(path)))
        end
        
        local cmd = string.format("dragon --and-exit %s", table.concat(escaped_paths, " "))
        os.execute(cmd)
    end,
}
