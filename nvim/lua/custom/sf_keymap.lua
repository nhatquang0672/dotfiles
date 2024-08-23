local M = {}

M.set_default_hotkeys = function()
  local nmap = function(keys, func, desc)
    if desc then
      desc = desc .. ' [Sf]'
    end
    vim.keymap.set('n', keys, func, { buffer = true, desc = desc })
  end

  local Sf = require 'sf'

  -- Common hotkeys for all files;
  nmap('<leader>fss', Sf.set_target_org, 'set target_org current workspace')
  nmap('<leader>fsS', Sf.set_global_target_org, 'set global target_org')
  nmap('<leader>fsf', Sf.fetch_org_list, 'fetch orgs info')
  nmap('<leader>fml', Sf.list_md_to_retrieve, 'metadata listing')
  nmap('<leader>fmtl', Sf.list_md_type_to_retrieve, 'metadata-type listing')
  nmap('<leader>f<leader>f', Sf.toggle_term, 'terminal toggle')
  nmap('<C-c>', Sf.cancel, 'cancel running command')
  nmap('<leader>fs-', Sf.go_to_sf_root, 'cd into root')
  nmap('<leader>fct', Sf.create_ctags, 'create ctag file in project root')
  nmap('<leader>fft', Sf.create_and_list_ctags, 'fzf list updated ctags')
  nmap('<leader>fso', Sf.org_open, 'open target_org')

  -- Hotkeys for metadata files only;
  if vim.tbl_contains(vim.g.sf.hotkeys_in_filetypes, vim.bo.filetype) then
    nmap('<leader>fsO', Sf.org_open_current_file, 'open file in target_org')
    nmap('<leader>fsd', Sf.diff_in_target_org, 'diff in target_org')
    nmap('<leader>fsD', Sf.diff_in_org, 'diff in org...')
    nmap('<leader>fma', Sf.retrieve_apex_under_cursor, 'apex under cursor retrieve')
    nmap('<leader>fsp', Sf.save_and_push, 'push current file')
    nmap('<leader>fsr', Sf.retrieve, 'retrieve current file')

    vim.keymap.set('x', '<leader>fsq', Sf.run_highlighted_soql, { buffer = true, desc = 'SOQL run highlighted text' })

    nmap('<leader>fta', Sf.run_all_tests_in_this_file, 'test all in this file')
    nmap('<leader>ftA', Sf.run_all_tests_in_this_file_with_coverage, 'test all with coverage info')
    nmap('<leader>ftt', Sf.run_current_test, 'test this under cursor')
    nmap('<leader>ftT', Sf.run_current_test_with_coverage, 'test this under cursor with coverage info')
    nmap('<leader>fto', Sf.open_test_select, 'open test select buf')
    nmap('\\s', Sf.toggle_sign, 'toggle signs for code coverage')
    nmap('<leader>ftr', Sf.repeat_last_tests, 'repeat last test')
    nmap('<leader>fcc', Sf.copy_apex_name, 'copy apex name')
    nmap('<leader>fcc', Sf.copy_apex_name, 'copy apex name')
    nmap('[v', Sf.uncovered_jump_backward, 'jump to previous uncovered sign icon line')
    nmap(']v', Sf.uncovered_jump_forward, 'jump to next uncovered sign icon line')
  end
end

return M
