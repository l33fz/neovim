local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end -- import nvim-treesitter plugin safely

-- configure treesitter
treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "json",
    "java",
    "yaml",
    "html",
    "css",
    "markdown",
    "bash",
    "lua",
    "vim",
    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
})
