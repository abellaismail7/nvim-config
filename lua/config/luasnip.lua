local ls = require("luasnip")
local htmlsnips = require("snip.html")
local cppsnips = require("snip.cpp")
local csnips = require("snip.c")


ls.snippets = {
   cpp = cppsnips,

   c = csnips,
   html = htmlsnips
}

ls.config.set_config {
   history = true,
   updateevents = "TextChanged,TextChangedI",
}
require("luasnip/loaders/from_vscode").load()
