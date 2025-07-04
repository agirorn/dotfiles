lua << END
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "dockerfile",
    "elm",
    "go",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "proto",
    "python",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype.
    -- (for example if you want to disable highlighting for the `tex` filetype,
    -- you need to include `latex` in this list as this is the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust", "javascript" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = fase,
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  },
}

-- Make ```shell looke like ```bash in markdown files
vim.treesitter.language.register("bash", "shell")

vim.api.nvim_create_autocmd({ "ColorScheme","BufReadPost", "BufEnter", "VimEnter","WinEnter", "BufWinEnter" }, {
  pattern = "*.rs",
  callback = function()
    -- vim.api.nvim_set_hl(0, "@lsp.type.namespace.rust", { link = "Macro" })
    vim.api.nvim_set_hl(0, "@lsp.type.macro.rust", { link = "Macro" })
    -- vim.api.nvim_set_hl(0, "@lsp.typemod.namespace.library.rust", { link = "Macro" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.namespace.macro.rust", { link = "Macro" })
    -- vim.api.nvim_set_hl(0, "@lsp.typemod.namespace.procMacro.rust", { link = "Macro" })
  end,
})

END
