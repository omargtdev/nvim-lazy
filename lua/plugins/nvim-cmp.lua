return {

  {
    -- Disable default tab
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function(_, opts)
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

      -- opts.enabled = function()
      --   -- disable completion in comments
      --   local context = require("cmp.config.context")
      --   -- keep command mode completion enabled when cursor is in a comment
      --   if vim.api.nvim_get_mode().mode == "c" then
      --     return true
      --   else
      --     return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
      --   end
      -- end

      opts.mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-f>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
            return
          end
          fallback()
        end),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
            return
          end
          fallback()
        end),
      })

      opts.sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      }
    end,
  },
}
