lua << EOF
  -- A pretty list for showing diagnostics, references, telescope results,
  -- quickfix and location lists to help you solve all the trouble your code is
  -- causing.
  -- https://github.com/folke/trouble.nvim
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" nmap <silent> <F3> :TroubleToggle<CR>
