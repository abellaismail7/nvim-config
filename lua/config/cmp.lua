local present, cmp = pcall(require, "cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local luasnip = require("luasnip")

if not present then
   return
end

vim.opt.completeopt = {"menuone", "noselect", "noinsert"}

cmp.setup({
  preselect = cmp.PreselectMode.None,
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

   mapping = cmp.mapping.preset.insert {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Insert,
         select = true,
      },
   },

  sources = cmp.config.sources {
     { name = "nvim_lsp" },
     { name = "luasnip" },
     { name = "buffer" },
     { name = "nvim_lua" },
     { name = "path" },
  },
})

cmp.setup.cmdline('/', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = 'buffer' }
   }
})

cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   },
   {
      { name = 'cmdline' }
   })
})


cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
