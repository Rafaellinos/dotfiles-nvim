return {
  -- GUI for installing LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  -- Auto-installs servers; bridges mason paths into vim.lsp
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      -- Apply cmp capabilities to every server
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- gopls settings (cmd/filetypes/root_markers come from mason-lspconfig)
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses    = { unusedparams = true },
            staticcheck = true,
            gofumpt     = true,
          },
        },
      })

      -- lua_ls settings (for editing this neovim config itself)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime     = { version = "LuaJIT" },
            workspace   = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed    = { "gopls", "lua_ls" },
        automatic_installation = true,
      })

      vim.lsp.enable({ "gopls", "lua_ls" })

      -- Keymaps set once per buffer when an LSP attaches
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gd",         vim.lsp.buf.definition,    "Go to definition")
          map("gD",         vim.lsp.buf.declaration,   "Go to declaration")
          map("gr",         vim.lsp.buf.references,    "References")
          map("gi",         vim.lsp.buf.implementation,"Go to implementation")
          map("K",          vim.lsp.buf.hover,         "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename,        "Rename")
          map("<leader>ca", vim.lsp.buf.code_action,   "Code action")
          map("<leader>d",  vim.diagnostic.open_float, "Open diagnostic")
          map("[d",         vim.diagnostic.goto_prev,  "Prev diagnostic")
          map("]d",         vim.diagnostic.goto_next,  "Next diagnostic")
        end,
      })
    end,
  },
}
