-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- O.S
local uname = vim.loop.os_uname().sysname

if uname == "Linux" then
    vim.g.clipboard = {
      name = 'xclip',
      copy = {
        ['+'] = 'xclip -selection clipboard',
        ['*'] = 'xclip -selection primary',
      },
      paste = {
        ['+'] = 'xclip -selection clipboard -o',
        ['*'] = 'xclip -selection primary -o',
      },
      cache_enabled = 0,
    }
else
    -- For macOS and Windows use default clipboard
    vim.g.clipboard = nil
end
