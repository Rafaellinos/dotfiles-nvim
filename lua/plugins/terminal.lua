return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { [[<C-\>]],     "<cmd>ToggleTerm<cr>",                          desc = "Toggle terminal" },
      { "<leader>tf",  "<cmd>ToggleTerm direction=float<cr>",          desc = "Float terminal" },
      { "<leader>th",  "<cmd>ToggleTerm direction=horizontal<cr>",     desc = "Horizontal terminal" },
      { "<leader>tv",  "<cmd>ToggleTerm direction=vertical size=60<cr>", desc = "Vertical terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = { border = "curved" },
      })

      -- Terminal-mode keymaps: Esc exits terminal mode, Ctrl+hjkl navigate windows
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          local opts = { buffer = 0 }
          vim.keymap.set("t", "<esc>",  [[<C-\><C-n>]],         opts)
          vim.keymap.set("t", "<C-h>",  [[<Cmd>wincmd h<CR>]],  opts)
          vim.keymap.set("t", "<C-j>",  [[<Cmd>wincmd j<CR>]],  opts)
          vim.keymap.set("t", "<C-k>",  [[<Cmd>wincmd k<CR>]],  opts)
          vim.keymap.set("t", "<C-l>",  [[<Cmd>wincmd l<CR>]],  opts)
        end,
      })
    end,
  },
}
