require('miniharp').setup({ show_on_autoload = true })

-- ~/.config/nvim-new/lua/keymaps.lua
keymap("n", "<leader>m", '<cmd>lua require("miniharp").toggle_file()<CR>')
keymap("n", "<leader>l", '<cmd>lua require("miniharp").show_list()<CR>')
keymap("n", "<C-n>", require("miniharp").next)
keymap("n", "<C-p>", require("miniharp").prev)

