local present, cmp = pcall(require, "cmp")

if not present then
   return
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.opt.completeopt = "menu,menuone,noselect"
local luasnip = require("luasnip")

cmp.setup({

  snippet = {
     expand = function(args)
        require("luasnip").lsp_expand(args.body)
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

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
       behavior = cmp.ConfirmBehavior.Replace,
       select = true,
    },
  },

  sources = {
     { name = 'luasnip' },
     { name = "nvim_lsp" },
     { name = "nvim_lua" },
     { name = "buffer" },
  },
})

cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
})
