local move = function(key)
    local cursor = vim.api.nvim_win_get_cursor(0)
    local row, col = cursor[1], cursor[2]

    local first_lnum = vim.fn.line('0')
    local last_lnum = vim.fn.line('$')

    local diff = key == 'k' and -1 or 1
    local lnum = row + diff
    local cnt = -1

    while lnum >= first_lnum and lnum <= last_lnum + 1 do
        cnt = cnt + 1
        if #vim.fn.getline(lnum) < col then
            break
        end
        lnum = lnum + diff
    end

    if cnt ~= 0 then
        return cnt .. key
    end

    cnt = 0
    while lnum >= first_lnum and lnum <= last_lnum + 1 do
        cnt = cnt + 1
        if #vim.fn.getline(lnum) > col then
            break
        end
        lnum = lnum + diff
    end

    return cnt .. key
end

local M = {}

function M.go_up() return move('k') end

function M.go_down() return move('j') end

return M
