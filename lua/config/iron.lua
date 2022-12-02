local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = "vertical botright 50 split",
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = ",sm",
    visual_send = ",sv",
    send_file 	= ",sf",
    send_line 	= ",sl",
    send_mark 	= ",sm",
    mark_motion = ",mc",
    mark_visual = ",mc",
    remove_mark = ",md",
    cr 			= ",s<cr>",
    interrupt 	= ",s<space>",
    exit 		= ",sq",
    clear 		= ",sc",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
require("keymaps").iron()
