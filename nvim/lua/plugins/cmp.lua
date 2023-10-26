return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
              cmp.confirm({ select = true })
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            -- elseif luasnip.expand_or_jumpable() then
            --   luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end

            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            -- if cmp.visible() then
            --   local entry = cmp.get_selected_entry()
            --   if not entry then
            --     cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            --   else
            --     cmp.confirm()
            --   end
            -- else
            --   fallback()
            -- end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
