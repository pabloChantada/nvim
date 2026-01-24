-- Clipboard
vim.opt.clipboard = "unnamedplus"

local uname = vim.loop.os_uname().sysname
local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil

if uname == "Linux" then
  if is_wayland then
    -- Wayland (Ubuntu default)
    vim.g.clipboard = {
      name = "wl-clipboard",
      copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
      },
      paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline",
      },
      cache_enabled = 0,
    }
  else
    -- X11
    vim.g.clipboard = {
      name = "xclip",
      copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection primary",
      },
      paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection primary -o",
      },
      cache_enabled = 0,
    }
  end
end

