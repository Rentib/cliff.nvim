# cliff.nvim

Plugin that moves the cursor up/down until it almost falls off the cliff.
Idk I can't write READMEs.

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
