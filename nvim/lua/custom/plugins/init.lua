-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {}, -- your configuration
  },
  {
    'AckslD/swenv.nvim',
    config = function()
      require('swenv').setup {
        -- attempt to auto create and set a venv from dependencies
        auto_create_venv = true,
        -- name of venv directory to create if using pip
        auto_create_venv_dir = '.venv',
      }
    end,
  },
  -- {
  --   'HallerPatrick/py_lsp.nvim',
  --   -- Support for versioning
  --   -- tag = "v0.0.1"
  --
  --   opts = {
  --     host_python = '/Users/quangtran/works/medis/projects/medis_doc_synth/.venv/bin/python',
  --     default_venv_name = '.venv', -- For local venv
  --   }, -- your configuration
  -- },
  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {}, -- your configuration
  },
}
