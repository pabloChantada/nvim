-- ~/config/
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
require("config.options")
require("config.keymaps")
require("config.lazy")
require("config.set")
require("config.options")

