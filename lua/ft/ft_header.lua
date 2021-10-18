
local styles = {
    c = {
        start = "/*", s_end = "*/", fill = "*"
    },
    html = {
        start = "<!--", s_end = "-->", fill = "*"
    },
    js = {
        start = "//", s_end = "//", fill = "*"
    },
    text = {
        start = "%", s_end = "%", fill = "*"
    },
    ml = {
        start = "%", s_end = "%", fill = "*"
    },
    vim = {
        start = "\"", s_end = "\"", fill = "*"
    },
    el = {
        start = ";", s_end = ";", fill = "*"
    },
    lua = {
        start = "--", s_end = "-", fill = "-"
    }
}

local lang_styles = {
    c       = styles.c,
    cpp     = styles.c,
    h       = styles.c,
    hh      = styles.c,
    cc      = styles.c,
    hpp     = styles.c,

    html    = styles.html,
    htm     = styles.html,
    xml     = styles.html,


    js      = styles.js,
    tex     = styles.tex,

    ml      = styles.html,
    mli     = styles.html,
    mll     = styles.html,
    mly     = styles.html,

    vim     = styles.vim,
    el      = styles.el,
    lua     = styles.lua,
}

local ft_ascii_art = {
    "        :::      ::::::::",
    "      :+:      :+:    :+:",
    "    +:+ +:+         +:+  ",
    "  +#+  +:+       +#+     ",
    "+#+#+#+#+#+   +#+        ",
    "     #+#    #+#          ",
    "    ###   ########.fr    ",
}

local margins = 5;
local linelen = 80;

local api = vim.api

local function setline(start, fill, s_end)
    local res   = start
    local endlen = string.len(s_end)
    local stlen = string.len(start)

    for _ = stlen,linelen - endlen
    do
        res = res .. fill
    end


    return res .. s_end
end

local function ft_set_text(lines, cols, text)
    if type(text) == "string"
        then
        api.nvim_buf_set_text(0, lines, cols, lines, cols + string.len(text) , {text})
    else
        print(text)
    end
end

local function ft_logo()
    for i = 0,7
    do
        ft_set_text(i+1, 48, ft_ascii_art[i]);
    end
end

local function ft_filename()
    local file = vim.fn.expand('%:t')
    ft_set_text(3, margins, file);
end

local function trimlogin ()
	local login = vim.fn.strpart(os.getenv("USER"), 0, 9)
	if string.len(login) == 0
    then
		login = "marvin"
    end
	return "By: " .. login .. " <marvin@42.fr>"
end

local function ft_user()
    local login = trimlogin();
    ft_set_text(5, margins, login);
end

local function ft_date()
    local date = vim.fn.strftime("%Y/%m/%d %H:%M:%S")
    ft_set_text(7, margins, date);
    ft_set_text(8, margins, date);

end

local function ft_create_header(ops)
    api.nvim_buf_set_lines(0, 0, 0, false, {
        setline(ops.start .. " ", ops.fill  , " " .. ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start       , " "       , ops.s_end),
        setline(ops.start .. " ", ops.fill  , " " .. ops.s_end),
    })
    ft_logo()
    ft_filename()
    ft_user()
    ft_date()
end

local M = {}
function M.set()
    local ext   = vim.fn.expand("%:e")
    local op    = lang_styles[ext]
    ft_create_header(op)

end
return M
