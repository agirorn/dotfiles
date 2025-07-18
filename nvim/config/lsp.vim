" To have the latest version of rust=analyser run in nvim :>
" :LspInstall rust_analyzer@nightly
" And possibly also update rust in shell :> rustup update

set completeopt=menu,menuone,noselect

lua << END
-- Install and setup Mason
require("mason").setup()

-- Ensure some LSPs are installed
require("mason-lspconfig").setup {
    -- ensure_installed = { "typescript-language-server", "eslint", "lua_ls" }
    ensure_installed = {
      "bashls",
      "eslint",
      "jsonls",
      "lua_ls",
      "omnisharp",
      "rust_analyzer",
      "tailwindcss",
      "taplo",
      "ts_ls",
      "yamlls",
    }
}
END


" LSP configuration
lua << END
-- -- local lsp_installer = require'nvim-lsp-installer'
--
-- -- # Configure NVIM LSP isntaller
-- -- # See https://github.com/williamboman/nvim-lsp-installer?tab=readme-ov-file#configuration
-- require("nvim-lsp-installer").setup {
--   automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--   ui = {
--     icons = {
--       server_installed = "✓",
--       server_pending = "➜",
--       server_uninstalled = "✗"
--     }
--   }
-- }
END

lua << END
-- Suppress nvim-lsp-installer Installation Messages
--
-- This hides error when sertan programing language are not installed on the
-- platform and is less anoying
-- To get information on the current installed moduels run :LspInstallInfo
vim.notify = function(msg, log_level, _opts)
    if msg:match("LSP") then return end
    vim.api.nvim_echo({ { msg } }, true, {})
end

-- lsp_installer.setup({
--     automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--     ui = {
--         icons = {
--             server_installed = "✓",
--             server_pending = "➜",
--             server_uninstalled = "✗"
--         }
--     }
-- })

local cmp = require'cmp'

local lspconfig = require'lspconfig'

cmp.setup({
  snippet = {
    -- REQUIRED by nvim-cmp. get rid of it once we can
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
      -- Enter immediately completes. Arrow U/Down to select.
      ['<Up>'] = cmp.mapping.select_prev_item(),
      ['<Down>'] = cmp.mapping.select_next_item(),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),

      -- Accept currently selected item. Set `select` to `false` to only confirm
      -- explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },                  -- Primary source for LSP completion
    { name = 'nvim_lsp_signature_help' },   -- LSP function signature help
    { name = 'nvim_lua' },                  -- Lua-specific completions
    { name = 'path' },                      -- Path completions
    { name = 'buffer' },                    -- Buffer completions
  }),
  experimental = {
    ghost_text = true,
  },
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  })
})

-- Setup lspconfig.
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD',       '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd',       '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K',        '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi',       '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-s>',    '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', 'P',        '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'N',        '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Get signatures (and _only_ signatures) when in argument lists.
  require "lsp_signature".on_attach({
    doc_lines = 0,
    handler_opts = {
      border = "none"
    },
  })
end

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_elm_attach = function(client)
  if client.config.flags then
      client.config.flags.allow_incremental_sync = true
  end
end

-- lspconfig.elmls.setup {
--   on_attach = custom_elm_attach
-- }

-- lspconfig.snyk_ls.setup( {
--   init_options = {
--     -- activate_snyk_open_source = false,
--   }
--   -- cmd = "snyk-ls"
-- })

lspconfig.elmls.setup {}

-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--       completion = {
--         postfix = {
--           enable = false,
--         },
--       },
--       imports = {
--           granularity = {
--               group = "module",
--           },
--           prefix = "self",
--       },
--       cargo = {
--           buildScripts = {
--               enable = true,
--           },
--       },
--       procMacro = {
--           enable = true,
--       },
--     },
--   },
--   capabilities = capabilities,
-- }

-- Enable JSON Language Server
lspconfig.jsonls.setup {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(), -- Load common JSON schemas
            validate = { enable = true }, -- Enable validation
        },
    },
}

-- Optional: Enable Treesitter for JSON
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "json" },
    highlight = { enable = true },
    indent = { enable = true },
}

lspconfig.ts_ls.setup({
    init_options = {
        preferences = {
            disableSuggestions = true,
        },
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        -- buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        -- buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        -- buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})

lspconfig.eslint.setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 500 },
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = true
    client.server_capabilities.documentFormattingProvider = false
    if client.server_capabilities.document_formatting then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          -- vim.lsp.buf.format({ async = true })
          vim.lsp.buf.format()
        end,
        group = au_lsp,
      })
    end
  end,
})

-- maybe basedpyright is better for Python
lspconfig.pyright.setup{
  on_attach = on_attach,
  filetypes = {"python"}
}

-- lspconfig.pylsp.setup{
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           ignore = {'W391'},
--           maxLineLength = 100
--         }
--       }
--     }
--   }
-- }

lspconfig.jdtls.setup{
  cmd = {'jdtls'},
  root_dir = require('lspconfig/util').root_pattern('.git', 'mvnw', 'gradlew'),
}

lspconfig.tailwindcss.setup {}


-- " a TOML v1.0.0 toolkit
lspconfig.taplo.setup({})


-- function file_exists(name)
--    local f=io.open(name,"r")
--    if f~=nil then io.close(f) return true else return false end
-- end

-- -----------------------------------------------------------------------------
-- OmniSharp
-- -----------------------------------------------------------------------------

-- lspconfig.omnisharp.setup {
--     cmd = { "dotnet", "omnisharp" },
--     root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
--     capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }

-- -----------------------------------------------------------------------------
-- OmniSharp
-- -----------------------------------------------------------------------------
-- vim.fn.expand("~/Downloads/omnisharp/OmniSharp"),

vim.env.DOTNET_ROOT = "/usr/local/share/dotnet" -- or your actual path
vim.env.PATH = vim.env.PATH .. ':/usr/local/share/dotnet'

-- lspconfig.omnisharp.setup {}
lspconfig.omnisharp.setup {
  -- The Mason loading of omnisharp is currently broken
  cmd = {
    -- Downloda OmniSharp from https://github.com/OmniSharp/omnisharp-roslyn/releases/tag/v1.39.13
    vim.fn.expand("~/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp"),
    "--languageserver",
    "--hostPID",
   tostring(vim.fn.getpid())
  },

  -- capabilities = capabilities,
  capabilities = vim.tbl_extend('keep', cmp_nvim_lsp.default_capabilities(), {
    textDocument = {
      semanticTokens = true, -- Enable semantic highlighting
    }
  }),
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler,
  },
  -- cmd= lspconfig.omnisharp.document_config.default_config.cmd,
  -- cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
  on_attach = on_attach,
  --
  -- The configuration options can be found here
  -- https://github.com/OmniSharp/omnisharp-roslyn/wiki/Configuration-Options
  -- https://github.com/OmniSharp/omnisharp-roslyn/tree/master/src/OmniSharp.Shared/Options
  --
  enable_editorconfig_support = true,
  enable_roslyn_analyzers = true,
  enable_import_completion = true,
  settings = {
    RoslynExtensionsOptions = {
      enableAnalyzersSupport = true,
      EnableEditorConfigSupport = true,
      enableDecompilationSupport = true,
      enableImportCompletion = true,
      enableRoslynAnalyzers = true,
      enableReferenceCompletion = true,
      enableSdkResolver = true,
    },
    FormattingOptions = {
      EnableEditorConfigSupport= true,
      -- OrganizeImports= true,
      -- TabSize= 4,
      -- IndentSize= 4,
      -- UseTabs= false
    },
    DotNet = {
      EnablePackageRestore = true,
      EnableMSBuildLoadProjectsOnDemand = true,
      AnalyzeOpenDocumentsOnly = false
    },
    fileOptions = {
      excludeSearchPatterns = {
        "**/bin",
        "**/obj",
        "**/.git",
        "**/node_modules"
      }
    },
    Logging = {
      LogLevel = "Debug",
      File = os.getenv("HOME") .. "/omnisharp.log" -- Dynamically resolve $HOME
    }
  },
}



-- -----------------------------------------------------------------------------
-- OmniSharp
-- -----------------------------------------------------------------------------

-- local pid = vim.fn.getpid()
-- local omnisharp_bin = vim.fn.expand("$HOME/dotfiles/bin/omnisharp-osx-x64-net6.0/OmniSharp")
-- --
-- -- To print out the current confifg of omnisharp
-- -- :lua for _, client in pairs(vim.lsp.get_active_clients()) do if client.name == "omnisharp" then print(vim.inspect(client.config.settings)) end end
-- --
-- -- to prin tout the lsp omnisharp
-- -- lua for _, client in pairs(vim.lsp.get_active_clients()) do if client.name == "omnisharp" then print(vim.inspect(client.config)) end end
-- --
--
-- -- Function to inspect LSP omnisharp settings
-- function ShowOmniSharpSettings()
--     for _, client in pairs(vim.lsp.get_active_clients()) do
--         if client.name == "omnisharp" then
--             print(vim.inspect(client.config.settings))
--             return
--         end
--     end
--     print("No active LSP client found with name: " .. client_name)
-- end
--
-- -- More info on thei can be found here
-- -- https://aaronbos.dev/posts/csharp-dotnet-neovim
-- lspconfig.omnisharp.setup{
--     -- capabilities = capabilities,
--     capabilities = vim.tbl_extend('keep', cmp_nvim_lsp.default_capabilities(), {
--       textDocument = {
--         semanticTokens = true, -- Enable semantic highlighting
--       }
--     }),
--     handlers = {
--       ["textDocument/definition"] = require('omnisharp_extended').handler,
--     },
--     cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
--     on_attach = on_attach,
--     --
--     -- The configuration options can be found here
--     -- https://github.com/OmniSharp/omnisharp-roslyn/wiki/Configuration-Options
--     -- https://github.com/OmniSharp/omnisharp-roslyn/tree/master/src/OmniSharp.Shared/Options
--     --
--     settings = {
--       RoslynExtensionsOptions = {
--         enableAnalyzersSupport = true,
--         enableEditorConfigSupport = true,
--         enableDecompilationSupport = true,
--         enableImportCompletion = true,
--         enableReferenceCompletion = true
--       },
--       FormattingOptions = {
--         enableEditorConfigSupport= true,
--         -- OrganizeImports= true,
--         -- TabSize= 4,
--         -- IndentSize= 4,
--         -- UseTabs= false
--       },
--       DotNet = {
--         EnablePackageRestore = true,
--         EnableMSBuildLoadProjectsOnDemand = true,
--         AnalyzeOpenDocumentsOnly = false
--       },
--       fileOptions = {
--         excludeSearchPatterns = {
--           "**/bin",
--           "**/obj",
--           "**/.git",
--           "**/node_modules"
--         }
--       },
--       Logging = {
--         LogLevel = "Debug",
--         File = os.getenv("HOME") .. "/omnisharp.log" -- Dynamically resolve $HOME
--       }
--   },
--
-- }
--
-- vim.cmd [[
--   augroup lsp_document_highlight
--     autocmd! * <buffer>
--     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--   augroup END
-- ]]
--
-- vim.cmd [[
--   hi! link LspReferenceText Visual
--   hi! link LspReferenceRead Visual
--   hi! link LspReferenceWrite Visual
-- ]]

-- -----------------------------------------------------------------------------
-- END :: OmniSharp
-- -----------------------------------------------------------------------------

-- -- " If neoformat continues to use all the CPU we can remove it and do it ourself
-- -- " Install dotnet tool install -g csharpier
-- " vim.api.nvim_create_autocmd("BufWritePre", {
-- "     pattern = "*.cs",
-- "     command = "silent! !csharpier --write %",
-- " })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)


-- lspconfig.bazel.setup{
--   cmd = { "bazel" },
--   filetypes = { "bzl", "BUILD", "WORKSPACE" },
--   root_dir = lspconfig.util.root_pattern("WORKSPACE"),
-- }

lspconfig.gopls.setup {
  on_attach = on_attach,
}

lspconfig.yamlls.setup {
  on_attach = on_attach,
       settings = {
            yaml = {
              schemas = {
                kubernetes = "*.yml",
                compose= "compose.+.yml",
              },
            }
        }
}

END


" Show line diagnostics automatically in hover window
" see: https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-line-diagnostics-automatically-in-hover-window
" Ru press <space>+e
" lua << END
" vim.o.updatetime = 500
" vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
" END

lua << END
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",  -- Or "if_many"
  },
  float = {
    source = "always",  -- Or "if_many"
  },
})
END

lua << END
local rt = require("rust-tools")

rt.setup({
  tools = {
    inlay_hints = {
      only_current_line = true,
    },
  },
  server = {
    on_attach = function(_, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      --Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      local opts = { noremap=true, silent=true }

      buf_set_keymap('n', 'gD',       '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd',       '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K',        '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi',       '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-s>',    '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      buf_set_keymap('n', 'gr',       '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
      buf_set_keymap('n', 'P',        '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', 'N',        '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
      buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>M", rt.expand_macro.expand_macro)
    end,

    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- standalone = true,
    settings = {
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          enable = true,
          command = "clippy",
          extraArgs = { "--all", "--", "-W", "clippy::all" },
        },
        rustfmt = {
          extraArgs = { "+nightly" },
          -- extraArgs = { "+stable" },
        },
        cargo = {
          loadOutDirsFromCheck = true,
          features = "all",
          allFeatures = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
})

END

lua << END
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}
END


" Highlight line number instead of having icons in sign column
lua << END
vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]
END

"# Auto fix javascript and Typescript files
autocmd BufWritePre *.ts silent! execute 'call EslintFixAll()'
autocmd BufWritePre *.js silent! execute 'call EslintFixAll()'

"# Run the available code actions under the cursor
nnoremap <silent> F <cmd>lua vim.lsp.buf.code_action()<CR>

"# Shows a pop-up windows with the current error under the cursor.
" autocmd CursorHold * lua vim.diagnostic.open_float()

"# format using Black
lua << END
local group = vim.api.nvim_create_augroup("Black", { clear = true })
vim.api.nvim_create_autocmd("bufWritePost", {
	pattern = "*.py",
	command = "silent !black %",
	group = group,
})

-- "Auto format any file that has format support in the LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })
    for _, client in ipairs(clients) do
      if client.supports_method("textDocument/formatting") then
        vim.lsp.buf.format({ async = false })
        break
      end
    end
  end,
})
END

