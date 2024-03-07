# cliff.nvim

Plugin that moves the cursor up/down until it almost falls off the cliff. The
principle is very simple. If the cursor is positioned at position `(row,
column)` then after calling `cliff.go_down` or `cliff.go_up` the cursor will
move to the furthest row such that every line in between either is of length
larger than `column` or every line is smaller than `column`.

## Installation

Install using lazy or something.

    { "Rentib/cliff.nvim", event = "VeryLazy" }

## Example configuration

    local cliff = require("cliff")
    local opts = { noremap = true, silent = true, expr = true }
    vim.keymap.set('n', "<c-j>", cliff.go_down, opts)
    vim.keymap.set('n', "<c-k>", cliff.go_up,   opts)
    vim.keymap.set('v', "<c-j>", cliff.go_down, opts)
    vim.keymap.set('v', "<c-k>", cliff.go_up,   opts)
    vim.keymap.set('o', "<c-j>", cliff.go_down, opts)
    vim.keymap.set('o', "<c-k>", cliff.go_up,   opts)

## Similar plugins

- [vim-edgemotion](https://github.com/haya14busa/vim-edgemotion)
