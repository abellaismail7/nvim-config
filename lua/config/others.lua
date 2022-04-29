local M = {}

-- blankline
function M.blankline()
   require("indent_blankline").setup {
      indentLine_enabled = 1,
      char = "┆",
      filetype_exclude = {
         "help",
         "terminal",
         "alpha",
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

return M
