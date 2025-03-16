-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({
	paths = vim.fn.stdpath("config") .. "/snippets",
})

luasnip.config.setup({})

local function priority_comparator(entry1, entry2)
	-- Note that this is not efficient, as each call to `get_source_config` performs a search
	-- through the source configs in linear time
	local diff = entry1.source:get_source_config().priority - entry2.source:get_source_config().priority
	if diff > 0 then
		return true
	elseif diff < 0 then
		return false
	end
	return nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete({}),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({
						select = true,
					})
				end
			else
				fallback()
			end
		end),

		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			elseif cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			elseif cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp", priority = 4 },
		{ name = "luasnip", trigger_characters = { "~" }, priority = 3 },
		{ name = "path", priority = 2 },
		{ name = "buffer", priority = 1 },
	},
	sorting = {
		comparators = {
			priority_comparator,
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
		},
		priority_weight = 1,
	},
})

cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion", priority = 1 },
		{ name = "luasnip", priority = 2 },
		{ name = "buffer", priority = 2 },
	},
})
--
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   }),
--   matching = { disallow_symbol_nonprefix_matching = false }
-- })
