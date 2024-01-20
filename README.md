# close_buffer.nvim
* setting close window process instead of buffer delete (bd) and last buffer opening integration.

## Installation
* lazy.nvim
```vim
  {
    'senkentarou/close_buffer.nvim',
    event = 'BufRead',
    dependencies = {
      'goolord/alpha-nvim', -- optional, but recommended
    },
    opts = {
      close_filetypes = {
        'help',
        'lspinfo',
        'lazy',
        'startuptime',
      },
      default_window_filetype = 'alpha',
      default_window_command = 'Alpha',
    },
  },
```
