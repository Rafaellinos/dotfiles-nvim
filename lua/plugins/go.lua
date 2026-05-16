return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = { "go", "gomod" },
    config = function()
      require("go").setup({
        gofmt       = "gofumpt",
        lsp_cfg     = false,  -- gopls is already configured in lsp.lua
        lsp_on_attach = false,
        dap_debug   = true,
      })

      -- goimports (fmt + organize imports) on every save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern  = "*.go",
        group    = vim.api.nvim_create_augroup("GoFormat", {}),
        callback = function() require("go.format").goimports() end,
      })

      local map = vim.keymap.set
      map("n", "<leader>gt",  "<cmd>GoTest<cr>",     { desc = "Go: run tests" })
      map("n", "<leader>gT",  "<cmd>GoTestFunc<cr>", { desc = "Go: test current func" })
      map("n", "<leader>gr",  "<cmd>GoRun<cr>",      { desc = "Go: run" })
      map("n", "<leader>gb",  "<cmd>GoBuild<cr>",    { desc = "Go: build" })
      map("n", "<leader>gi",  "<cmd>GoImport<cr>",   { desc = "Go: add import" })
      map("n", "<leader>gc",  "<cmd>GoCoverage<cr>", { desc = "Go: coverage" })
      map("n", "<leader>ge",  "<cmd>GoIfErr<cr>",    { desc = "Go: if err snippet" })
    end,
  },
}
