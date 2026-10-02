" Rebuild the spelling files on startup
for d in glob('~/.vim/spell/*.add', 1, 1)
    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
        exec 'mkspell! ' . fnameescape(d)
    endif
endfor


lua << END
  vim.keymap.set("n", "<C-s>", function()
    require("which-key").show({ global = true, keys = "z=" })
  end, { desc = "Spelling Suggestions (Bottom Menu)" })
END

