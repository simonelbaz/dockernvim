-- Initialize core settings first
require('user.options')
require('user.plugins')
require('user.treesitter')
require('user.lsp')
require('claudecode').setup(
{
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  opts = {
    terminal_cmd = "~/.claude/local/claude", -- Point to local installation
  },
  config = true,
  keys = {
    -- Your keymaps here
  },
}
)
