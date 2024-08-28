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
    -- local function set_keymaps()
    local nmap = function(keys, func, desc)
      if desc then
        desc = desc .. ' [Sf]'
      end
      vim.keymap.set('n', keys, func, { desc = desc })
    end

    -- vim.keymap.set('n', '<leader>es', Sf.set_target_org, { desc = 'olala' })
    nmap('<leader>ls', Sf.set_target_org, 'set target_org')
    nmap('<leader>lo', Sf.org_open, 'open target_org')
    nmap('<leader>lsS', Sf.set_global_target_org, 'set global target_org')
    nmap('<leader>lsf', Sf.fetch_org_list, 'fetch orgs info')
    nmap('<leader>lmtl', Sf.list_md_type_to_retrieve, 'metadata-type listing')
    nmap('<leader>l<leader>l', Sf.toggle_term, 'terminal toggle')

    nmap('<leader>ld', Sf.diff_in_target_org, 'diff in target_org')
    nmap('<leader>lp', Sf.save_and_push, 'push current file')
    nmap('<leader>lr', Sf.retrieve, 'retrieve current file')
    nmap('<leader>lma', Sf.retrieve_apex_under_cursor, 'apex under cursor retrieve')
    nmap('<leader>lta', Sf.run_all_tests_in_this_file, 'test all in this file')
    nmap('<leader>ltA', Sf.run_all_tests_in_this_file_with_coverage, 'test all with coverage info')
    nmap('<leader>ltt', Sf.run_current_test, 'test this under cursor')
    nmap('<leader>ltT', Sf.run_current_test_with_coverage, 'test this under cursor with coverage info')

    -- Apply keymaps if filetype is in hotkeys_in_filetypes
    -- if vim.tbl_contains(vim.g.sf.hotkeys_in_filetypes, vim.bo.filetype) then
    --   nmap('<leader>ld', Sf.diff_in_target_org, 'diff in target_org')
    -- end
    -- end
    -- set_keymaps()
    -- Set keymaps after buffer is read and filetype is set
    -- vim.api.nvim_create_autocmd('BufWinEnter', {
    --   callback = set_keymaps,
    -- })
  end,
}
