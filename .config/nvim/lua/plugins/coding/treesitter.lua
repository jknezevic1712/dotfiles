return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      vim.filetype.add {
        pattern = {
          ['config'] = 'dosini',
          ['.*%.component%.html'] = 'htmlangular',
        },
      }

      vim.treesitter.language.register('angular', 'htmlangular')

      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'angular',
          'astro',
          'bash',
          'c',
          'css',
          'diff',
          'dockerfile',
          'editorconfig',
          'gitignore',
          'go',
          'gomod',
          'gosum',
          'gowork',
          'html',
          'javascript',
          'json',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'python',
          'sql',
          'tsx',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
        },

        sync_install = false,
        auto_install = false,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
        },

        -- Folding remains managed by your nvim-ufo configuration.
      }
    end,
  },
}
