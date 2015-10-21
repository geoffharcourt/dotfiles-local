" http://robots.thoughtbot.com/post/57444559280/running-specs-from-vim
" http://robots.thoughtbot.com/post/58056673303/use-rspec-vim-with-tmux-and-dispatch
let g:rspec_command = "Dispatch rspec {spec}"

function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
endfunction

function! DefaultSpecDescribe(suffix)
  if InSpecBlock()
    return "RSpec.describe \"<{description}>\""
  else
    return "RSpec.describe " . SpecDescribedType()
  endif
endfunction

function! InSpecBlock()
  if match(getline("."), "^\\s") != -1
    return 1
  else
    return 0
  endif
endfunction

function! SpecDescribedType()
  let curline = line(".")
  let curcol  = col(".")
  let line = search("describe", "bW")
  call cursor(curline, curcol)
  if line > 0
    let line = getline(line)
    return substitute(matchstr(line, "describe [^, ]*"), "^describe ", "", "")
  else
    let spec_name = substitute(expand("%:r"), "_spec$", "", "")
    let spec_name = substitute(spec_name, "^" . SpecRoot() . "/", "", "")
    for path in ["spec", "lib", "models", "controllers", "services", "mailers", "helpers"]
      let spec_name = substitute(spec_name, "^" . path . "/", "", "")
    endfor
    if stridx(spec_name, "views") == -1
      return rails#camelize(spec_name)
    else
      let spec_name = substitute(spec_name, "^views/\\(.*\.html\\)\..*$", "\"\\1\"", "")
      return spec_name
    endif
  endif
endfunction

function! SpecSubject()
  return rails#underscore(SpecDescribed())
endfunction

function! SpecRoot()
  if strlen(RailsRoot()) > 0
    return RailsRoot()
  else
    return getcwd()
  endif
endfunction

function! SpecDescribed()
  let curline = line(".")
  let curcol  = col(".")
  let line = search("describe", "bW")
  if line > 0
    let line = getline(line)
    let subject = substitute(matchstr(line, "describe [^, ]*"), "^describe ", "", "")
    call cursor(curline, curcol)
    return subject
  else
    return 'subject'
  endif
endfunction

function! IterVar()
  let line = getline('.')
  let col = col('.')
  let collection = line[0 : col]
  " remove .each/.map
  let collection = substitute(collection,"\\.[^.]*$","","")
  " remove lead up
  let collection = substitute(collection, "^.*\\W", "", "")
  " singularize
  return rails#singularize(collection)
endfunction

function! RubyTrim(string)
  return substitute(a:string, "^\\s\\+\\|\\s\\+$", "", "g")
endfunction

function! DefaultFeatureTitle()
  let filename = expand("%:t")
  let without_suffix = substitute(filename, "_spec.rb$", "", "")
  let humanized = substitute(without_suffix, "_", " ", "g")
  return humanized
endfunction
