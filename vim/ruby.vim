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
  autocmd FileType ruby,eruby,yaml,coffee,javascript setlocal iskeyword-=.
augroup END

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
