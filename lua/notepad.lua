local M = {}

--[[
-- Later ideas:
--      - save scratch pad
--      - title it
--      - maybe put commands on the screen
--      - setup function for custom sizes/rebinds
--      - 
--]]

Notepad_win_id = nil
Notepad_buf_handle = nil
Window_is_open = false

M.example = function()
   print("executing example")
end

M.toggle_notepad = function()
    if Window_is_open then
        vim.api.nvim_win_hide(Notepad_win_id)
        Window_is_open = false
        return
    end

    if Notepad_buf_handle == nil then
        Notepad_buf_handle = vim.api.nvim_create_buf(false, true)
    end

    local width = 80
    local height = 20
    local config = {
        relative="win",
        width=width,
        height=height,
        row=math.floor((vim.o.lines - height) / 2),
        col=math.floor((vim.o.columns - width) / 2),
        border="single",
    }
    Notepad_win_id = vim.api.nvim_open_win(Notepad_buf_handle, true, config)
    Window_is_open = true
end

return M
