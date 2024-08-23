-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'xixiaofinland/sf.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'ibhagwan/fzf-lua', -- no need if you don't use listing metadata feature
  },
  config = function()
    -- require('sf').setup { enable_hotkeys = true } -- Important to call setup() to initialize the plugin!
    require('sf').setup()
    local Sf = require 'sf'
    local function set_keymaps()
      local nmap = function(keys, func, desc)
        if desc then
          desc = desc .. ' [Sf]'
        end
        vim.keymap.set('n', keys, func, { desc = desc })
      end

      -- vim.keymap.set('n', '<leader>es', Sf.set_target_org, { desc = 'olala' })
      nmap('<leader>qs', Sf.set_target_org, 'set target_org')
      -- Apply keymaps if filetype is in hotkeys_in_filetypes
      if vim.tbl_contains(vim.g.sf.hotkeys_in_filetypes, vim.bo.filetype) then
        nmap('<leader>qd', Sf.diff_in_target_org, 'diff in target_org')
      end
    end
    -- Set keymaps after buffer is read and filetype is set
    vim.api.nvim_create_autocmd('BufWinEnter', {
      callback = set_keymaps,
    })
  end,
}
