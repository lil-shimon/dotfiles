require("yanky").setup()
local keymap = vim.keymap.set

keymap({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
keymap({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")

require("telescope").load_extension("yank_history")
