return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup { suggestion = { enabled = false }, panel = { enabled = false } }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    fix_pairs = true,
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
        strategies = {
          chat = {
            adapter = 'copilot',
          },
          inline = {
            adapter = 'copilot',
          },
        },
      }
      local cc = require 'codecompanion'
      -- local function set_keymaps()
      local nmap = function(keys, func, desc)
        if desc then
          desc = desc .. ' [Codecompanion]'
        end
        vim.keymap.set('n', keys, func, { desc = desc })
      end

      nmap('<leader>pc', cc.chat, 'chat to llm')
      nmap('<leader>pa', cc.actions, 'codecompanion actions')
    end,
  },
}
