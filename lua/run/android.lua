local M = {}
function M.run()
  local exist = vim.fn.filereadable(vim.fn.expand("gradlew"))
  if exist then
    vim.cmd("belowright 60vs | term %:p:h/gradlew assembleDebug && %:p:h/gradlew installDebug && ")
  else
    print"the working directory isn't an android project"
  end

end


return M
