"" Switch between test and production code
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e! ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file  = expand("%")
  let new_file      = current_file

  let is_erb        = match(current_file, '\<views\>') != -1
  let is_controller = match(current_file, '\<controllers\>') != -1
  let is_model      = match(current_file, '\<models\>') != -1
  let is_view       = match(current_file, '\<views\>') != -1
  let is_helper     = match(current_file, '\<helpers\>') != -1
  let is_mailer     = match(current_file, '\<mailers\>') != -1
  let in_rspec      = match(current_file, '^spec/') != -1
  let in_fspec      = match(current_file, '^fspec/') != -1
  let in_spec       = in_rspec || in_fspec
  let in_fast_spec  = match(current_file, '^fast_spec/') != -1
  let going_to_spec = !(in_spec || in_fast_spec)
  let in_app        = is_controller || is_model || is_view || is_helper || is_mailer
  let in_lib        = match(current_file, '\<lib\>') != -1

  if going_to_spec
    let new_file = substitute(new_file, '^lib/', '', '')
    let new_file = substitute(new_file, '^app/', '', '')

    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = substitute(new_file, '\.erb$', '.erb_spec.rb', '')

    let fast_spec_file = 'fspec/' . new_file
    let spec_file = 'spec/' . new_file

    if filereadable(spec_file)
      let new_file = spec_file
    else
      if isdirectory("fspec")
        let new_file = fast_spec_file
      else
        let new_file = spec_file
      end
    end
  else
    if is_erb
      let new_file = substitute(new_file, '\.erb_spec\.rb$', '.erb', '')
    else
      let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    end

    let new_file = substitute(new_file, '^fspec/', '', '')
    let new_file = substitute(new_file, '^spec/', '', '')

    if in_app
      let new_file = 'app/' . new_file
    else
      let new_file = 'lib/' . new_file
    end
  endif

  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

"" Running rspec tests
map <leader>t :call RunTestFile()<cr>
map <leader>F :call RunDocumentFormatedTest()<cr>
map <leader>T :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>
map <leader>c :w\|:!script/features<cr>
map <leader>w :w\|:!script/features --profile wip<cr>

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunDocumentFormatedTest()
  call RunTestFile(" -f d")
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear

  let is_fast_spec  = ( match(a:filename, '^fast_spec/') != -1 || match(a:filename, '^fspec/') != -1 ) && filereadable(".fspec")

  if match(a:filename, '_test.rb$') != -1
      exec ":!ruby -Itest " . a:filename
  elseif match(a:filename, '\.feature$') != -1
      exec ":!script/features " . a:filename
  else
    if filereadable("script/test")
      exec ":!script/test " . a:filename
    elseif is_fast_spec
      exec ":!rspec --color -O .fspec " . a:filename
    elseif filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction


