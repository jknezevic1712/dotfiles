local function expanded_hover()
  local hover = require 'ts_expand_hover'
  local lsp = require 'ts_expand_hover.lsp'
  local original_request = lsp.request

  -- Change only the initial request to depth 1.
  lsp.request = function(opts)
    lsp.request = original_request
    opts.verbosity = 1
    opts.state.verbosity = 1
    return original_request(opts)
  end

  local ok, err = pcall(hover.hover)
  lsp.request = original_request

  if not ok then
    vim.notify(tostring(err), vim.log.levels.ERROR)
  end
end

return {
  {
    'nemanjamalesija/ts-expand-hover.nvim',
    ft = { 'typescript', 'typescriptreact' },
    opts = {
      keymaps = { hover = false },
    },
    config = function(_, opts)
      require('ts_expand_hover').setup(opts)

      local function map_hover(buf)
        vim.schedule(function()
          if not vim.api.nvim_buf_is_valid(buf) then
            return
          end

          local ft = vim.bo[buf].filetype
          if ft ~= 'typescript' and ft ~= 'typescriptreact' then
            return
          end

          vim.keymap.set('n', 'K', expanded_hover, {
            buffer = buf,
            desc = 'TypeScript hover (depth 1)',
          })
        end)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup(
          'ExpandedTypeScriptHover',
          { clear = true }
        ),
        callback = function(event)
          map_hover(event.buf)
        end,
      })

      -- Also handle the file that triggered plugin loading.
      map_hover(vim.api.nvim_get_current_buf())
    end,
  },
}
