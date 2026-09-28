return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',

    config = function()
      local treesitter = require 'nvim-treesitter'

      vim.filetype.add {
        pattern = {
          ['config'] = 'dosini',
          ['.*%.component%.html'] = 'htmlangular',
        },
      }

      vim.treesitter.language.register('angular', 'htmlangular')

      local parsers = {
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
      }

      treesitter.setup()

      treesitter.install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
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
          'markdown',
          'python',
          'sql',
          'typescript',
          'typescriptreact',
          'vim',
          'vimdoc',
          'yaml',
          'htmlangular',
        },

        callback = function()
          -- Tree-sitter highlighting
          vim.treesitter.start()

          -- Tree-sitter indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
