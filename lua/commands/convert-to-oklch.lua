-- Add this to your Neovim config (init.lua or a plugin file)

-- Color conversion functions
local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	if #hex == 3 then
		hex = hex:gsub("(.)", "%1%1")
	end
	local r = tonumber(hex:sub(1, 2), 16) / 255
	local g = tonumber(hex:sub(3, 4), 16) / 255
	local b = tonumber(hex:sub(5, 6), 16) / 255
	return r, g, b
end

local function rgb_to_xyz(r, g, b)
	-- sRGB to linear RGB
	local function gamma_expand(c)
		return c <= 0.04045 and c / 12.92 or math.pow((c + 0.055) / 1.055, 2.4)
	end

	r, g, b = gamma_expand(r), gamma_expand(g), gamma_expand(b)

	-- Linear RGB to XYZ (D65)
	local x = r * 0.4124564 + g * 0.3575761 + b * 0.1804375
	local y = r * 0.2126729 + g * 0.7151522 + b * 0.0721750
	local z = r * 0.0193339 + g * 0.1191920 + b * 0.9503041

	return x, y, z
end

local function xyz_to_oklch(x, y, z)
	-- XYZ to OKLab
	local l = math.pow(0.8189330101 * x + 0.3618667424 * y - 0.1288597137 * z, 1 / 3)
	local m = math.pow(0.0329845436 * x + 0.9293118715 * y + 0.0361456387 * z, 1 / 3)
	local s = math.pow(0.0482003018 * x + 0.2643662691 * y + 0.6338517070 * z, 1 / 3)

	local L = 0.2104542553 * l + 0.7936177850 * m - 0.0040720468 * s
	local a = 1.9779984951 * l - 2.4285922050 * m + 0.4505937099 * s
	local b = 0.0259040371 * l + 0.7827717662 * m - 0.8086757660 * s

	-- OKLab to OKLCH
	local lightness = L
	local chroma = math.sqrt(a * a + b * b)
	local hue = math.atan2(b, a) * 180 / math.pi
	if hue < 0 then
		hue = hue + 360
	end

	return lightness, chroma, hue
end

local function convert_color_to_oklch(color)
	-- Remove whitespace
	color = color:gsub("%s+", "")

	-- Try to match hex color
	local hex = color:match("#?([0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]?[0-9a-fA-F]?[0-9a-fA-F]?)")
	if hex then
		local r, g, b = hex_to_rgb("#" .. hex)
		local x, y, z = rgb_to_xyz(r, g, b)
		local l, c, h = xyz_to_oklch(x, y, z)
		return string.format("oklch(%.3f %.3f %.1f)", l, c, h)
	end

	-- Try to match rgb/rgba
	local r, g, b = color:match("rgba?%((%d+),%s*(%d+),%s*(%d+)")
	if r and g and b then
		r, g, b = tonumber(r) / 255, tonumber(g) / 255, tonumber(b) / 255
		local x, y, z = rgb_to_xyz(r, g, b)
		local l, c, h = xyz_to_oklch(x, y, z)
		return string.format("oklch(%.3f %.3f %.1f)", l, c, h)
	end

	-- Try to match hsl/hsla
	local h, s, l = color:match("hsla?%((%d+),%s*(%d+)%%,%s*(%d+)%%")
	if h and s and l then
		h, s, l = tonumber(h), tonumber(s) / 100, tonumber(l) / 100

		-- HSL to RGB conversion
		local function hsl_to_rgb(h, s, l)
			h = h / 360
			local function hue_to_rgb(p, q, t)
				if t < 0 then
					t = t + 1
				end
				if t > 1 then
					t = t - 1
				end
				if t < 1 / 6 then
					return p + (q - p) * 6 * t
				end
				if t < 1 / 2 then
					return q
				end
				if t < 2 / 3 then
					return p + (q - p) * (2 / 3 - t) * 6
				end
				return p
			end

			if s == 0 then
				return l, l, l
			else
				local q = l < 0.5 and l * (1 + s) or l + s - l * s
				local p = 2 * l - q
				local r = hue_to_rgb(p, q, h + 1 / 3)
				local g = hue_to_rgb(p, q, h)
				local b = hue_to_rgb(p, q, h - 1 / 3)
				return r, g, b
			end
		end

		local r, g, b = hsl_to_rgb(h, s, l)
		local x, y, z = rgb_to_xyz(r, g, b)
		local l, c, h = xyz_to_oklch(x, y, z)
		return string.format("oklch(%.3f %.3f %.1f)", l, c, h)
	end

	return nil
end

-- Create the command
vim.api.nvim_create_user_command("ConvertToOklch", function()
	-- Get visual selection
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	if start_pos[2] == 0 or end_pos[2] == 0 then
		vim.notify("No visual selection found", vim.log.levels.WARN)
		return
	end

	local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
	if #lines == 0 then
		vim.notify("No text selected", vim.log.levels.WARN)
		return
	end

	local selected_text
	if #lines == 1 then
		-- Single line selection
		selected_text = lines[1]:sub(start_pos[3], end_pos[3])
	else
		-- Multi-line selection (take first line for simplicity)
		selected_text = lines[1]:sub(start_pos[3])
	end

	local oklch_color = convert_color_to_oklch(selected_text)

	if oklch_color then
		-- Replace the selection with OKLCH color
		if #lines == 1 then
			local line = lines[1]
			local new_line = line:sub(1, start_pos[3] - 1) .. oklch_color .. line:sub(end_pos[3] + 1)
			vim.api.nvim_buf_set_lines(0, start_pos[2] - 1, start_pos[2], false, { new_line })
		else
			vim.api.nvim_buf_set_text(
				0,
				start_pos[2] - 1,
				start_pos[3] - 1,
				end_pos[2] - 1,
				end_pos[3],
				{ oklch_color }
			)
		end
		vim.notify("Converted to: " .. oklch_color, vim.log.levels.INFO)
	else
		vim.notify("Could not parse color: " .. selected_text, vim.log.levels.ERROR)
	end
end, {
	range = true,
	desc = "Convert selected color to OKLCH format",
})

-- Optional: Create a keymap for easier access
vim.keymap.set("v", "<leader>co", ":ConvertToOklch<CR>", {
	desc = "Convert selected color to OKLCH",
	silent = true,
})
