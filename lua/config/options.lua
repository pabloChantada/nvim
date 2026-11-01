-- Clipboard

vim.opt.clipboard = "unnamedplus"

local uname = vim.loop.os_uname().sysname
local is_wayland = os.getenv("WAYLAND_DISPLAY") ~= nil

if vim.fn.has("wsl") == 1 then
  -- WSL: use the Windows clipboard (WSLg sets WAYLAND_DISPLAY,
  -- but wl-clipboard doesn't sync well with Windows)
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
elseif uname == "Linux" then
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

