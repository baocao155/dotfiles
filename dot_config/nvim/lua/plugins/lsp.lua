return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        lemminx = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "off", -- or "strict", "standard", "recommended", "off"
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
              },
            },
          },
        },
      },
    },
  },
}
