local default_opts = {
  -- close buffer instead of bdelete
  close_filetypes = {
    'help',
    'lspinfo',
    'lazy',
    'startuptime',
  },
  -- ignore close buffer if it's the only window
  -- recommend filetype: 'alpha' (google/alpha-nvim)
  default_window_filetype = nil,
  -- execute command to open default window
  -- recommend command: 'Alpha' (goolord/alpha-nvim)
  default_window_command = nil,
}

local M = {}

M.close_buffer = function(opts)
  opts = opts or {}

  local filetype = vim.bo.filetype
  local cmd = ''

  if filetype == opts.default_window_filetype then
    -- no action
    cmd = ':'
  elseif vim.fn.index(opts.close_filetypes, filetype) >= 0 then
    cmd = 'close'
  elseif vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), 'buflisted(v:val)')[2] ~= nil then
    cmd = 'bd'
  else
    -- command to last buffer
    cmd = opts.default_window_command or 'bd'
  end

  vim.api.nvim_command(cmd)
end

M.setup = function(opts)
  vim.api.nvim_create_user_command('CloseBuffer', function()
    M.close_buffer(vim.tbl_deep_extend('force', default_opts, opts or {}))
  end, {
    force = true,
  })
end

return M
