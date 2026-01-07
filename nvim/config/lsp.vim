" To have the latest version of rust=analyser run in nvim :>
" :LspInstall rust_analyzer@nightly
" And possibly also update rust in shell :> rustup update

set completeopt=menu,menuone,noselect

lua << END
-- Install and setup Mason
require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

-- Ensure some LSPs are installed
require("mason-lspconfig").setup {
    automatic_enable = false,
    ensure_installed = {
      "bashls",
      "eslint",
      "jsonls",
      "lua_ls",
      -- "omnisharp",
      "rust_analyzer",
      "tailwindcss",
      "pyright",
      "taplo",
      "ts_ls",
      "yamlls",
      "svelte",
    }
}
END


" LSP configuration
lua << END

local lsp_signature_config = {
  bind = true,
  hint_enable = false,
  hint_prefix = "⫸  ",
  handler_opts = {
    border = "rounded"
  }
}  -- add your config here
require "lsp_signature".setup(lsp_signature_config )
require'lsp_signature'.on_attach(lsp_signature_config , bufnr)


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

local cmp = require'cmp'

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

local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local custom_elm_attach = function(client)
  if client.config.flags then
      client.config.flags.allow_incremental_sync = true
  end
end

vim.lsp.enable("elmls")

-- Enable JSON Language Server
vim.lsp.config("jsonls", {
    settings = {
        json = {
            schemas = require('schemastore').json.schemas(), -- Load common JSON schemas
            validate = { enable = true }, -- Enable validation
        },
    },
})
vim.lsp.enable("jsonls")

-- Optional: Enable Treesitter for JSON
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "json" },
    highlight = { enable = true },
    indent = { enable = true },
}

vim.lsp.config("ts_ls", {
    init_options = {
        preferences = {
            disableSuggestions = true,
            documentFormattingProvider = false,
        },
    },
})
vim.lsp.enable("ts_ls")

vim.api.nvim_create_user_command("BufKeymaps", function()
  local modes = { "n", "i", "v", "x", "s", "o", "t", "c" } -- normal, insert, etc.
  local lines = {}

  for _, mode in ipairs(modes) do
    local keymaps = vim.api.nvim_buf_get_keymap(0, mode)
    for _, map in ipairs(keymaps) do
      table.insert(lines, string.format("[%s] %s → %s", mode, map.lhs, map.rhs or ""))
    end
  end

  vim.cmd("new")  -- open new scratch buffer
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false
  vim.bo.filetype = "keymaps"
end, {})


vim.lsp.config("eslint", {
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
vim.lsp.enable("eslint")

vim.lsp.enable("pyright")

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

vim.lsp.config("jdtls", {
  cmd = {'jdtls'},
  root_dir = require('lspconfig/util').root_pattern('.git', 'mvnw', 'gradlew'),
})
vim.lsp.enable("jdtls")

vim.lsp.enable("tailwindcss")


-- " a TOML v1.0.0 toolkit
vim.lsp.enable("taplo")


require("roslyn").setup({
  config = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    on_attach = function(client, bufnr)
      print("The roslyn server is attaching!")
      require "lsp_signature".on_attach(lsp_signature_config, bufnr)
    end,
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
  }
)


-- vim.lsp.config("bazel", {
--   cmd = { "bazel" },
--   filetypes = { "bzl", "BUILD", "WORKSPACE" },
--   root_dir = lspconfig.util.root_pattern("WORKSPACE"),
-- })
-- vim.lsp.enable("bazel")

vim.lsp.enable("gopls")

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yml",
        compose= "compose.+.yml",
      },
    }
  }
})
vim.lsp.enable("yamlls")

vim.lsp.enable("svelte")

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

" -- lua << END
" -- local rt = require("rust-tools")
" -- 
" -- rt.setup({
" --   tools = {
" --     inlay_hints = {
" --       only_current_line = true,
" --     },
" --   },
" --   server = {
" --     capabilities = require("cmp_nvim_lsp").default_capabilities(),
" --     -- standalone = true,
" --     settings = {
" --       ["rust-analyzer"] = {
" --         -- enable clippy on save
" --         checkOnSave = {
" --           enable = true,
" --           command = "clippy",
" --           extraArgs = { "--all", "--", "-W", "clippy::all" },
" --         },
" --         rustfmt = {
" --           extraArgs = { "+nightly" },
" --           -- extraArgs = { "+stable" },
" --         },
" --         cargo = {
" --           loadOutDirsFromCheck = true,
" --           features = "all",
" --           allFeatures = true,
" --         },
" --         procMacro = {
" --           enable = true,
" --         },
" --       },
" --     },
" --   },
" -- })
" --
" -- END

lua << END
vim.lsp.config("lua_ls", {
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
})
vim.lsp.enable("lua_ls")
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

-- This does not seem to be needed any longer
--  -- "Auto format any file that has format support in the LSP
--  vim.api.nvim_create_autocmd("BufWritePre", {
--    callback = function()
--      local clients = vim.lsp.get_active_clients({ bufnr = 0 })
--      for _, client in ipairs(clients) do
--        if client.supports_method("textDocument/formatting") then
--          vim.lsp.buf.format({ async = false })
--          break
--        end
--      end
--    end,
--  })

local builtin = require('telescope.builtin')
-- vim.keymap.set('n', 'gD', builtin.lsp_document_symbols, { desc = '[G]oto [D]eclaration' })
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration' })

local lsp_signature = require('lsp_signature');


vim.keymap.set('n', '<F5>', vim.diagnostic.setqflist, { desc =     '[G]oto [D]efinition' })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc =     '[G]oto [D]efinition' })
vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = '[G]oto [I]mplementation' })
vim.keymap.set('n', 'gC', builtin.lsp_incoming_calls, { desc = '[G]oto incoming [T]alls' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc =      '[G]oto [R]eferences' })
vim.keymap.set('n', '<space>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
vim.keymap.set('n', '<space>ds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })


vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = '[D]ocument [S]ymbols' })
vim.keymap.set('n', '<space>s', lsp_signature.toggle_float_win, { desc = '[D]ocument [S]ymbols' })
-- vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, { desc = '[S]ignature_[H]elp' })
-- vim.keymap.set('n', '<C-s>', builtin.signature_help, { desc = '[S]ignature_[H]elp' })

-- Define a named function
local function show_signature_help()
  vim.lsp.buf.signature_help({ border = "rounded" })
end
vim.keymap.set('n', 'gs', show_signature_help, { desc = '[S]ignature_[H]elp' })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = '[G]oto [T]ype [D]efinition' })
vim.keymap.set('n', 'E', vim.diagnostic.goto_next, { desc = '[G]oto [N]ext Error' })

local function show_hover()
  vim.lsp.buf.hover({ border= "rounded" })
end
vim.keymap.set('n', 'K', show_hover)

-- code_action re mapped to F
-- vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, { desc = '[G]oto [T]ype [D]efinition' })

local function float_dialog_format(diag)
  local msg = ("%s [%s]"):format(diag.message, diag.code)
  if diag.code_action then
    msg = msg .. ("\n Code Actions:\n %s"):format(diag.code_action)
  end
  local ri = diag.user_data
    and diag.user_data.lsp
    and diag.user_data.lsp.relatedInformation

  if ri and #ri > 0 then
    msg = msg .. "\n\nRelated Information:\n"
    for _, r in ipairs(ri) do
      local uri = r.location and r.location.uri or ""
      local path = vim.uri_to_fname(uri)
      local lnum = (r.location and r.location.range and r.location.range.start.line or 0) + 1
      msg = msg .. "\n- - - - - - - - - - - - - -\n"
      msg = msg .. ("Source: %s:%d\n \n%s\n"):format(path, lnum, r.message or "")
    end
  end

  return msg
end


local diagnostics_on = {
  virtual_text = true,
  virtual_lines = { current_line = f },
  severity_sort = true,
  update_in_insert = false,
  underline = false,
  float = true
}

local diagnostics_off = {
  float = {
    source = "always",
    focusable = true,
    format = float_dialog_format,
  },
  jump = {
    float = false,
    wrap = true
  },
  severity_sort = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  virtual_lines = false,
  virtual_text = {
    source = "if_many"
  }
}


local diagnostics_enabled = false
vim.diagnostic.config(diagnostics_off)

function _G.toggle_diagnostics()
  diagnostics_enabled = not diagnostics_enabled
  if diagnostics_enabled then

    vim.diagnostic.config(diagnostics_on)
    -- vim.diagnostic.enable()
    print("Diagnostics enabled")
  else
    vim.diagnostic.config(diagnostics_off)
    -- vim.diagnostic.disable()
    print("Diagnostics disabled")
  end
end

-- Map to a key (example: <leader>d)
vim.keymap.set('n', '<F3>', toggle_diagnostics, { noremap = true, silent = true, desc = '[T]ioggle [D]iagnostics' })

END
