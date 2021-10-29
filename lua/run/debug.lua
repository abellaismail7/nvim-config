local M = {}
function M.run()
  local command = vim.fn.input("Command: ", "", "file")
  vim.cmd(string.format([[
    packadd termdebug
    TermdebugCommand %s
    Program
    resize 10
  ]],command))
end

function M.resize()
  vim.cmd [[ Program ]]
  vim.api.nvim_win_set_height(0, 10)
  vim.cmd [[ Asm ]]
  vim.api.nvim_win_set_height(0, 10)
end


return M
