return {
  "nvim-treesitter/nvim-treesitter",
  -- The "main" branch (new default) no longer has nvim-treesitter.configs;
  -- this config uses the classic API, which lives on "master".
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "python",
          "java",
          "html",
          "css",
          "json",
          "markdown",
          "rust",      -- Added
          "toml",      -- For Cargo.toml
        },
      
      -- Install only
      sync_install = false,
      
      -- Install necessary parsers when opening a file
      auto_install = true,
      
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      indent = {
        enable = true
      },
    })
  end,

  -- Function/Class context
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
}
