local g = vim.g

-- local fn = vim.fn
-- local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

g.dashboard_disable_at_vimenter = 0
g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_preview_command = 'cat'
g.dashboard_preview_pipeline = 'lolcat'
g.dashboard_preview_file = "/home/bella/.config/nvim/logo"
g.dashboard_preview_file_height = 12
g.dashboard_preview_file_width = 60

g.dashboard_custom_section = {
   a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
   b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
   c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
   d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
   e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
   f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
}


g.dashboard_custom_footer = {
   "   ",
   -- "NvChad Loaded " .. plugins_count .. " plugins",
   "All editors suck -- But neovim just sucks less.",
}
