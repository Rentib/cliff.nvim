local lineLength = function(lnum)
    local tab_hex_code = 9

    -- TODO: tabsize might be different than shiftwidth
    local expandtab = vim.api.nvim_buf_get_option(0, "expandtab")
    local tabsize   = vim.api.nvim_buf_get_option(0, "shiftwidth")
    local line      = vim.fn.getline(lnum)
    local length    = #line

    if expandtab then
        return length
    end

    -- count tabs used as indentation
    for i = 1, #line do
        if line:byte(i) ~= tab_hex_code then
            break
        end
        length = length + tabsize - 1
    end

    return length
end

local move = function(key)
    -- NOTE: use norm command because nvim_win_set_cursor doesnt support virtual edit

    local row, col = vim.fn.line('.'), vim.fn.virtcol('.')

    local first_lnum = vim.fn.line('0')
    local last_lnum = vim.fn.line('$')

    local diff = key == 'k' and -1 or 1
    local lnum = row + diff
    local cnt = -1

    while lnum >= first_lnum and lnum <= last_lnum + 1 do
        cnt = cnt + 1
        if lineLength(lnum) < col then break end
        lnum = lnum + diff
    end

    if cnt ~= 0 then
        vim.cmd("norm " .. cnt .. key)
        return
    end

    while lnum >= first_lnum and lnum <= last_lnum + 1 do
        cnt = cnt + 1
        if lineLength(lnum) >= col then break end
        lnum = lnum + diff
    end

    vim.cmd("norm " .. cnt .. key)
end

local M = {}

function M.go_up() move('k') end

function M.go_down() move('j') end

function M.setup() end -- lazy might scream otherwise

return M
