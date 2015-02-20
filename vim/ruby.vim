""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUBY
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['mri', 'rubylint']

" Treat files like Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby

" Remove trailing whitespace on save for ruby files.
augroup rubywhitespace
  autocmd!
  au BufWritePre *.rb :%s/\s\+$//e
  au BufWritePre *.erb :%s/\s\+$//e
  au BufWritePre *.feature :%s/\s\+$//e
  au BufWritePre *.haml :%s/\s\+$//e
  au BufWritePre *.rake :%s/\s\+$//e
  au BufWritePre Gemfile :%s/\s\+$//e
augroup END

augroup rubyquestionmark
  autocmd!
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?
augroup END

if has("autocmd")
  autocmd FileType ruby set omnifunc=syntaxcomplete#Complete
  " autocmd FileType ruby set omnifunc=rubycomplete#Complete
  " autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  " autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

" functions
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

function! InSpecBlock()
  if match(getline("."), "^\\s") != -1
    return 1
  else
    return 0
  endif
endfunction

function! DefaultSpecDescribe(suffix)
  if InSpecBlock()
    return "RSpec.describe \"<{description}>\""
  else
    return "RSpec.describe " . SpecDescribedType()
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

function! RubySplitOneliner()
  let lineno = line(".")
  let line = getline(lineno)
  let leftBrace = stridx(line, "{")
  let rightBrace = strridx(line, "}")
  let indent = matchstr(line, "^\\s\\+")
  let open = strpart(line, len(indent), leftBrace - len(indent))
  let content = strpart(line, leftBrace + 1, rightBrace - leftBrace - 1)
  call setline(lineno, indent . RubyTrim(open) . " do")
  call append(lineno, [indent . "  " . RubyTrim(content), indent . "end"])
endfunction

function! RubyJoinOneliner()
  let pos = getpos(".")
  call cursor(pos[1] + 1, 0)
  let lineno = search("do$", "bW")
  let line = getline(lineno)
  let indent = matchstr(line, "^\\s\\+")
  let open = RubyTrim(substitute(line, "do\\s*$", "", ""))
  let contents = RubyTrim(getline(lineno + 1))
  call setline(lineno, indent . open . " { " . contents . " }")
  exec (lineno + 1) . "," . (lineno + 2) . "d"
  let pos = getpos(".")
  call cursor(pos[1] - 1, 0)
endfunction

function! RubyIsOneliner()
  return match(getline(line(".")), "^\\s\\+[a-zA-Z0-9_.]\\+\\s\\+{")
endfunction

function! RubyToggleOneliner()
  if RubyIsOneliner() == -1
    call RubyJoinOneliner()
  else
    call RubySplitOneliner()
  endif
endfunction

function! DefaultFeatureTitle()
  let filename = expand("%:t")
  let without_suffix = substitute(filename, "_spec.rb$", "", "")
  let humanized = substitute(without_suffix, "_", " ", "g")
  return humanized
endfunction

function! InitializerArgument()
  let current_line = getline(line("."))
  let assignment = substitute(current_line, "^\\s*@\\?", "", "")
  let variable = substitute(assignment, "\\s*=", "", "")
  return variable
endfunction

function! BeginClass()
  let path = expand("%:r")
  let path = substitute(path, "^" . SpecRoot() . "/", "", "")
  let name = path
  for segment in ["app", "lib", "models", "controllers", "services", "mailers"]
    let name = substitute(name, "^" . segment . "/", "", "")
  endfor
  let name = rails#camelize(name)
  let names = split(name, "::")
  let className = names[-1]
  let modules = names[0:-2]
  let opening = ""
  let closing = ""
  for module in modules
    let opening = opening . "module " . module . "\n"
    let closing = closing . "\n" . "end"
  endfor
  let classDeclaration = className
  if stridx(path, "/controllers/") > -1
    let classDeclaration = classDeclaration . " < ApplicationController"
  endif
  return classDeclaration
endfunction
