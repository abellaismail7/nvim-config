local ls = require("luasnip")
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

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

local MallocSnip = {
      i(1, "int *"),
      t(" "),
      i(2, "varname"),
      d(3,function (args, _, _)
         return sn(nil, { t( " = malloc(sizeof(" .. args[1][1] .. ") * ("), })
      end,{1}),
      i(4, "i + 1"),
      d(5,function (args, _, _)
         return sn(nil, {
            t({
               ") );",
               "if (" .. args[1][1] .. " == NULL))",
            }),
      })
      end,{2}),
      t({" {", "\treturn "}),
      i(6);
      t({";", "}","free();"})
}
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
   },

   c = {
      s(
         {
            trig = "mal",
            name = "mal",
            dscr = "malloc boilerplate"
         },
         MallocSnip
      )
   }
}

ls.config.set_config {
   history = true,
   updateevents = "TextChanged,TextChangedI",
}
require("luasnip/loaders/from_vscode").load()
