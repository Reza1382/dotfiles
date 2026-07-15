return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          mason = false,
          cmd = { "/usr/local/bin/pyright-langserver", "--stdio" },

          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = false,
                autoSearchPaths = true,
                autoImportCompletions = false
              },
            },
          },
        },

        ruff = {
          mason = false,
          cmd = { "/home/reza/python_env/bin/ruff", "server" },
        },

        codebook = {
          mason = false,
          cmd = { "/home/reza/.local/bin/codebook-lsp" },
        },
      },
    },
  },
}
