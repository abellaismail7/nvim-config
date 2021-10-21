local M = {}

-- blankline
function M.blankline()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      char = "┆",
      filetype_exclude = {
         "help",
         "terminal",
         "dashboard",
         "packer",
         "lspinfo",
         "TelescopePrompt",
         "TelescopeResults",
      },
      buftype_exclude = {"terminal"},
      show_trailing_blankline_indent = false,
      show_first_indent_level = false,
   }
end

-- Luasnip
function M.luasnip()
   require("luasnip").config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
   }
   require("luasnip/loaders/from_vscode").load()

end

return M
