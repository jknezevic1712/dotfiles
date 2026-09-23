-- Completion via blink.cmp — a single fast (Rust core) plugin that replaces
-- nvim-cmp + its source plugins + LuaSnip. `version = '*'` pulls a prebuilt
-- binary, so no local Rust toolchain is required.
return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '*',
    dependencies = { 'folke/lazydev.nvim' },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',

        ['<C-Space>'] = { 'show' },
        ['<Up>'] = { 'select_prev' },
        ['<Down>'] = { 'select_next' },
        ['<C-p>'] = { 'select_prev' },
        ['<C-n>'] = { 'select_next' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },

        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
        },
      },

      snippets = {
        preset = 'default',
      },

      fuzzy = {
        implementation = 'prefer_rust_with_warning',
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
