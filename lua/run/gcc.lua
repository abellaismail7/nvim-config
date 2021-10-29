local M = {}
function M.run(flags)
  vim.cmd("! gcc " .. flags .. " % -o /tmp/42_onlxmpaw_exe && /tmp/42_onlxmpaw_exe")
end


return M
