return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    local jdtls_dir = vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls')
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    local workspace_dir = vim.fn.expand('~/.local/share/nvim/jdtls-workspace/') .. project_name

    local config = {
      name = 'jdtls',
      cmd = {
        '/opt/homebrew/opt/openjdk@21/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', vim.fn.glob(jdtls_dir .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
        '-configuration', jdtls_dir .. '/config_mac',
        '-data', workspace_dir,
      },

      root_dir = vim.fs.root(0, { 'gradlew', 'mvnw', '.git', 'pom.xml', 'build.gradle' }),

      settings = {
        java = {
          configuration = {
            runtimes = {
              { name = 'JavaSE-21', path = '/opt/homebrew/opt/openjdk@21/' },
            },
          },
        },
      },

      init_options = { bundles = {} },
    }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'java',
      callback = function()
        require('jdtls').start_or_attach(config)
      end,
    })
  end,
}
