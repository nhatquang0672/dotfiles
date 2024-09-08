return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      {
        'renerocksai/calendar-vim',
        init = function()
          vim.g.calendar_no_mappings = 1
        end,
      },
    },
    config = function()
      require('telekasten').setup {
        home = vim.fn.expand '$HOME/works/self/projects/zettelkasten',
        dailies = vim.fn.expand '$HOME/works/self/projects/zettelkasten/dailies',
        templates = vim.fn.expand '$HOME/works/self/projects/zettelkasten/templates',
        template_new_note = vim.fn.expand '$HOME/works/self/projects/zettelkasten/templates/basenote.md', -- template for new notes
        template_new_daily = vim.fn.expand '$HOME/works/self/projects/zettelkasten/templates/daily.md', -- template for new daily notes
        new_note_filename = 'uuid-title',
        filename_space_subst = '-',
      }
      -- Define a local variable for telekasten
      local telekasten = require 'telekasten'

      -- Normal mode key mappings
      vim.keymap.set('n', '<leader>zf', telekasten.find_notes, { desc = 'Find notes' })
      vim.keymap.set('n', '<leader>zd', telekasten.find_daily_notes, { desc = 'Find daily notes' })
      vim.keymap.set('n', '<leader>zg', telekasten.search_notes, { desc = 'Search notes' })
      vim.keymap.set('n', '<leader>zz', telekasten.follow_link, { desc = 'Follow link' })
      vim.keymap.set('n', '<leader>zT', telekasten.goto_today, { desc = 'Go to today' })
      vim.keymap.set('n', '<leader>zW', telekasten.goto_thisweek, { desc = 'Go to this week' })
      vim.keymap.set('n', '<leader>zw', telekasten.find_weekly_notes, { desc = 'Find weekly notes' })
      vim.keymap.set('n', '<leader>zn', telekasten.new_note, { desc = 'New note' })
      vim.keymap.set('n', '<leader>zN', telekasten.new_templated_note, { desc = 'New templated note' })
      vim.keymap.set('n', '<leader>zy', telekasten.yank_notelink, { desc = 'Yank note link' })
      vim.keymap.set('n', '<leader>zc', telekasten.show_calendar, { desc = 'Show calendar' })
      vim.keymap.set('n', '<leader>zC', ':CalendarT<CR>', { desc = 'Open calendar' })
      vim.keymap.set('n', '<leader>zi', telekasten.paste_img_and_link, { desc = 'Paste image and link' })
      vim.keymap.set('n', '<leader>zt', telekasten.toggle_todo, { desc = 'Toggle todo' })
      vim.keymap.set('v', '<leader>zt', function()
        telekasten.toggle_todo { v = true }
      end, { desc = 'Toggle todo (visual)' })
      vim.keymap.set('n', '<leader>zb', telekasten.show_backlinks, { desc = 'Show backlinks' })
      vim.keymap.set('n', '<leader>zF', telekasten.find_friends, { desc = 'Find friends' })
      vim.keymap.set('n', '<leader>zI', function()
        telekasten.insert_img_link { i = true }
      end, { desc = 'Insert image link' })
      vim.keymap.set('n', '<leader>zp', telekasten.preview_img, { desc = 'Preview image' })
      vim.keymap.set('n', '<leader>zm', telekasten.browse_media, { desc = 'Browse media' })
      vim.keymap.set('n', '<leader>#', telekasten.show_tags, { desc = 'Show tags' })

      -- Insert mode key mappings
      -- vim.keymap.set('i', '<leader>[', function()
      --   telekasten.insert_link { i = true }
      -- end, { desc = 'Insert link' })
      -- vim.keymap.set('i', '<leader>zt', function()
      --   telekasten.toggle_todo { i = true }
      -- end, { desc = 'Toggle todo in insert mode' })
      -- vim.keymap.set('i', '<leader>#', function()
      --   telekasten.show_tags { i = true }
      -- end, { desc = 'Show tags in insert mode' })

      -- Highlight settings
      --
      -- Colors suitable for gruvbox color scheme
      -- vim.api.nvim_set_hl(0, 'tklink', { ctermfg = 72, fg = '#689d6a', bold = true, underline = true })
      -- vim.api.nvim_set_hl(0, 'tkBrackets', { ctermfg = 'gray', fg = 'gray' })
      --
      -- -- Real yellow
      -- vim.api.nvim_set_hl(0, 'tkHighlight', { ctermbg = 'yellow', ctermfg = 'darkred', bold = true, bg = 'yellow', fg = 'darkred' })
      --
      -- -- Link colors to existing groups
      -- vim.api.nvim_set_hl(0, 'CalNavi', { link = 'CalRuler' })
      -- vim.api.nvim_set_hl(0, 'tkTagSep', { ctermfg = 'gray', fg = 'gray' })
      -- vim.api.nvim_set_hl(0, 'tkTag', { ctermfg = 175, fg = '#d3869B' })
      --
      -- vim.api.nvim_set_hl(0, 'tklink', { ctermfg = 72, guifg = '#689d6a', cterm = 'bold,underline', gui = 'bold,underline' })
      -- vim.api.nvim_set_hl(0, 'tkBrackets', { ctermfg = 'gray', guifg = 'gray' })
      -- vim.api.nvim_set_hl(0, 'tkHighlight', { ctermbg = 'yellow', ctermfg = 'darkred', cterm = 'bold', guibg = 'yellow', guifg = 'darkred', gui = 'bold' })
      -- vim.api.nvim_set_hl(0, 'tkTagSep', { ctermfg = 'gray', guifg = 'gray' })
      -- vim.api.nvim_set_hl(0, 'tkTag', { ctermfg = 175, guifg = '#d3869B' })
      --
      -- -- Calendar highlight link
      -- vim.api.nvim_set_hl(0, 'CalNavi', { link = 'CalRuler' })
    end,
  },
}
