local ls = require("luasnip")
local cppsnips = require("snip.cpp")
local csnips = require("snip.c")


ls.snippets = {
   cpp = cppsnips,
   c = csnips,
}

ls.config.set_config {
   history = true,
   updateevents = "TextChanged,TextChangedI",
}

vim.keymap.set({"i", "s"}, "<C-e>", function ()
   ls.jump(-1)
end, {})
vim.keymap.set({"i", "s"}, "<C-y>", function ()
   ls.jump(1)
end, {})

require("luasnip/loaders/from_vscode").load()
