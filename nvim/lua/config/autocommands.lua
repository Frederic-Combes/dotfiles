-- Define an autocommand group for python-specific autocommands
local au_group_python = vim.api.nvim_create_augroup("AuGroupPython", { clear = true })

--- Update Pyright's configuration with the given Python path
--- @param client table The LSP client
--- @param python string The path to the python executable
local function update_pyright_config(client, python)
  local current_settings = client.settings or client.config.settings or {}
  local current_python = (current_settings.python or {}).pythonPath

  if current_python == python then
    return
  end

  local settings = vim.tbl_deep_extend("force", current_settings, {
    python = { pythonPath = python },
  })

  if client.settings then
    client.settings = settings
  else
    client.config.settings = settings
  end

  -- Notify the LSP about the configuration change
  client.notify("workspace/didChangeConfiguration", { settings = settings })
  vim.notify("Python: using environment " .. python, vim.log.levels.INFO, { title = "Python" })
end

--- Find the project root and look for a .venv directory
--- @return string|nil path to the python executable if found
local function find_venv_python()
  local root = vim.fs.root(0, { "pyproject.toml", ".git", "setup.py", "requirements.txt", "uv.lock" })

  if not root then
    return nil
  end

  local names = { ".venv", "venv", ".env", "env" }

  for _, name in ipairs(names) do
    local python = root .. "/" .. name .. "/bin/python"

    if vim.fn.executable(python) == 1 then
      return python
    end
  end

  return nil
end


-- Autocommand: Updates the LSP with the correct python executable when opening a python
-- file.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  group = au_group_python,
  callback = function()
    local python = find_venv_python()

    if not python then
      return
    end

    -- Check if pyright is already attached to the current buffer
    local clients = vim.lsp.get_clients({ name = "pyright", bufnr = 0 })

    if #clients > 0 then
      for _, client in ipairs(clients) do
        update_pyright_config(client, python)
      end

      return
    end

    -- If pyright is not yet attached, set up a one-time autocommand for LspAttach
    -- NOTE: from usage, this is the most common case!
    vim.api.nvim_create_autocmd("LspAttach", {
      group = au_group_python,
      buffer = 0,
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "pyright" then
          update_pyright_config(client, python)
          -- Detach the autocommand after it ran
          return true
        end
      end,
    })
  end,
})
