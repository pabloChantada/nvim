-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- O.S
local uname = vim.loop.os_uname().sysname

if uname == "Linux" then
    vim.g.clipboard = {
      name = 'wl-clipboard',
      copy = {
        ['+'] = 'wl-copy',
        ['*'] = 'wl-copy',
      },
      paste = {
        ['+'] = 'wl-paste',
        ['*'] = 'wl-paste',
      },
      cache_enabled = 0,
    }
else
    -- For macOS and Windows use default clipboard
    vim.g.clipboard = nil
end
