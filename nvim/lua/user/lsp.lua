vim.cmd[[set completeopt+=menuone,noselect,popup]]

vim.lsp.config['java_ls'] = {
  -- Command and arguments to start the server.
  cmd = { '/home/linagora/jdtls/bin/jdtls' },
  -- Filetypes to automatically attach to.
  filetypes = { 'java' },
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  -- SEL
  -- root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
--   settings = {
--     java = {
--     }
--   }
    on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
}

vim.lsp.enable('java_ls')
vim.lsp.inline_completion.enable()
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)
