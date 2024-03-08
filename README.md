# cliff.nvim

Plugin that moves the cursor up/down until it almost falls off the cliff. The
principle is very simple. If the cursor is positioned at position `(row,
column)`, then after calling `cliff.go_down` or `cliff.go_up` the cursor will
move to the furthest row such that every line in between either is of length
greater than `column` or every line is shorter than `column`.

### Installation

You can install it through your package manager of choice:

<details open>
  <summary><b><a href="https://github.com/folke/lazy.nvim">lazy.nvim</a></b></summary>
  </br>

```lua
{
    "Rentib/cliff.nvim",
    keys = {
        { '<c-j>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_down() end },
        { '<c-k>', mode = { 'n', 'v', 'o' }, function() require("cliff").go_up()   end },
    },
},
```
</details>

<details closed>
  <summary><b><a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a></b></summary>
  </br>

```lua
use {
    "Rentib/cliff.nvim",
    config = function()
            local cliff = require("cliff")
            local opts = { noremap = true, silent = true }
            vim.keymap.set('n', "<c-j>", function() cliff.go_down() end, opts)
            vim.keymap.set('n', "<c-k>", function() cliff.go_up()   end, opts)
            vim.keymap.set('v', "<c-j>", function() cliff.go_down() end, opts)
            vim.keymap.set('v', "<c-k>", function() cliff.go_up()   end, opts)
            vim.keymap.set('x', "<c-j>", function() cliff.go_down() end, opts)
            vim.keymap.set('x', "<c-k>", function() cliff.go_up()   end, opts)
    end
},
```

</details>

### Demo
![demo](./.github/images/demo.gif)

### Similar plugins

- [vim-edgemotion](https://github.com/haya14busa/vim-edgemotion)
