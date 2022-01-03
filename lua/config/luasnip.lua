local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local showDotHProtection = function(args, state, fmt)
   local filename = vim.fn.expand("%:t"):upper():gsub("%.", "_")

   return sn(nil, {
      t({
         "#ifndef " .. filename,
         "# define " .. filename,
         "",
         "#endif"
      })
   })
end
   
ls.snippets = {
   cpp = {
      s(
         {
            trig = "fthead",
            name = "fthead",
            dscr = "Norm v3 .h protection template"
         },
         {
            d(1, showDotHProtection, {}),
         } 
      )
   }
}
ls.config.set_config {
   history = true,
   updateevents = "TextChanged,TextChangedI",
}
require("luasnip/loaders/from_vscode").load()
