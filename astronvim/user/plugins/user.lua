return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = false,
    config = function()
      require("hop").setup {
        keys = "arstneioqwfpluyzxcdhgmbjvk",
      }
    end,
  },
  "petobens/poet-v",
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup({
        compile = true,
        background = {
          dark = "wave",
          light = "lotus"
        },
      })
    end,
  }
}
