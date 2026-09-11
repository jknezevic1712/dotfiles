return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },

    opts = function()
      local opts = {
        formatters_by_ft = {
          lua = { 'stylua' },

          javascript = { 'biome-check', 'prettier', 'prettierd' },
          javascriptreact = { 'biome-check', 'prettier', 'prettierd' },
          typescript = { 'biome-check', 'prettier', 'prettierd' },
          typescriptreact = { 'biome-check', 'prettier', 'prettierd' },
          json = { 'biome-check', 'prettier', 'prettierd' },
          jsonc = { 'biome-check', 'prettier', 'prettierd' },
          css = { 'biome-check', 'prettier', 'prettierd' },

          astro = { 'prettier', 'prettierd' },
          graphql = { 'prettier', 'prettierd' },
          html = { 'prettier', 'prettierd' },
          less = { 'prettier', 'prettierd' },
          scss = { 'prettier', 'prettierd' },
          vue = { 'prettier', 'prettierd' },
          yaml = { 'prettier', 'prettierd' },
        },

        formatters = {
          ['biome-check'] = {
            command = 'biome',
            args = {
              'check',
              '--write',
              '$FILENAME',
            },
            stdin = false,
          },
        },
      }

      opts.format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        local filetype = vim.bo[bufnr].filetype

        local has_biome = vim.fn.filereadable(vim.fn.getcwd() .. '/biome.json')
            == 1
          or vim.fn.filereadable(vim.fn.getcwd() .. '/biome.jsonc') == 1

        local biome_supported = {
          javascript = true,
          javascriptreact = true,
          typescript = true,
          typescriptreact = true,
          json = true,
          jsonc = true,
          css = true,
        }

        local prettier_only = {
          graphql = true,
          handlebars = true,
          html = true,
          less = true,
          scss = true,
          vue = true,
          yaml = true,
        }

        if has_biome and biome_supported[filetype] then
          return {
            formatters = { 'biome-check' },
            timeout_ms = 2000,
            lsp_format = 'never',
          }
        end

        if biome_supported[filetype] or prettier_only[filetype] then
          return {
            formatters = { 'prettier', 'prettierd' },
            timeout_ms = 2000,
          }
        end

        return { lsp_format = 'fallback' }
      end

      return opts
    end,
  },
}
