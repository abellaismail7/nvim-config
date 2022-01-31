local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local d = ls.dynamic_node
local sn = ls.snippet_node
--local i = ls.insert_node

local showDotHProtection = function(_, _, _)
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
return {
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
