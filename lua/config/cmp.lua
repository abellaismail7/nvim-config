local present, cmp = pcall(require, "cmp")

if not present then
   return
end

vim.opt.completeopt = {"menu", "menuone", "noselect"}
local luasnip = require("luasnip")

cmp.setup({

  snippet = {
     expand = function(args)
        luasnip.lsp_expand(args.body)
     end,
  },

  formatting = {
     format = function(entry, vim_item)
        -- load lspkind icons
        vim_item.kind = string.format(
           "%s %s",
           require("config.lspkind_icons").icons[vim_item.kind],
           vim_item.kind
        )

        vim_item.menu = ({
           nvim_lsp = "[LSP]",
           nvim_lua = "[Lua]",
           buffer = "[BUF]",
        })[entry.source.name]

        return vim_item
     end,
  },

  mapping = {
     ["<C-e>"] = cmp.mapping(function ()
        luasnip.expand()
     end,{"i", "s"}),
     ["<C-y>"] = cmp.mapping(function ()
        luasnip.expand_or_jump()
     end,{"i", "s"}),
     ["<C-Space>"] = cmp.mapping.complete(),
     ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
     },
  },

  sources = {
     { name = 'luasnip' },
     { name = "nvim_lsp" },
     { name = "nvim_lua" },
     { name = "buffer", keyword_length = 4 },
  },
})

cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
})
