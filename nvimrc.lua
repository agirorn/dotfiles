-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function nmap(lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    map("n", lhs, rhs, options)
end

-- Stop searching by pressing the <leader> key and then M
-- The same thing is configured in a vimscript with the key maping:
-- <leader> <Sapce>
nmap("<leader>M", ":nohlsearch<CR>", { silent = true })
-- map("n", "<leader>M", ":nohlsearch<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>M", ":nohlsearch<CR>", { silent = true, noremap = true })
