return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    main = 'nvim-treesitter.configs',
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "go", "gomod", "gowork", "gotmpl",
          "lua", "vim", "vimdoc",
          "json", "yaml", "markdown", "bash",
        },
        highlight = { enable = true },
        indent   = { enable = true },

        -- Ctrl+Space to expand selection by syntax node
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<C-space>",
            node_incremental  = "<C-space>",
            node_decremental  = "<bs>",
          },
        },

        -- af/if = around/inner function, ac/ic = around/inner class
        -- ]f/[f = jump to next/prev function
        textobjects = {
          select = {
            enable    = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            goto_next_start = { ["]f"] = "@function.outer" },
            goto_prev_start = { ["[f"] = "@function.outer" },
          },
        },
      })
    end,
  },
}
