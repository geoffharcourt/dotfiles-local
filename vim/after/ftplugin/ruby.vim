" shamlessly stolen from Joe Ferris at thoughtbot

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
    for path in ["spec", "lib", "models", "controllers"]
      let spec_name = substitute(spec_name, "^" . path . "/", "", "")
    endfor
    return rails#camelize(spec_name)
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
    return "describe"
  else
    return "describe " . SpecDescribedType() . a:suffix
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
  for segment in ["app", "lib", "models", "controllers"]
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
  return opening . "class " . classDeclaration . "\n<{}>\nend" . closing
endfunction

" nmap <buffer> <Bar> :call RubyToggleOneliner()<CR>

" general ruby snippets
Snippet each each do |``IterVar()``|<CR><{}><CR>end
Snippet map map do |``IterVar()``|<CR><{}><CR>end
Snippet eachl each { |``IterVar()``| <{}> }
Snippet mapl map { |``IterVar()``| <{}> }
" Snippet @ @<{attribute}> = <{attribute}><{}>
Snippet = = ``InitializerArgument()``<{}>
Snippet class ``BeginClass()``

" active record associations
Snippet bt belongs_to :<{}>
Snippet ho has_one :<{}>
Snippet hm has_many :<{}>
Snippet habtm has_and_belongs_to_many :<{}>
Snippet hmt has_many :<{association}>, :through => <{}>

" active record validations
Snippet vpo validates_presence_of :<{}>
Snippet vuo validates_uniqueness_of :<{}>

" activemodel validations
Snippet vpo validates :<{}>, presence: true

" shoulda validation matchers
Snippet shvpo it { should validate_presence_of(:<{}>) }
Snippet shal should_allow_values_for :<{attribute}>, <{}>
Snippet should_ensure_length_at_least should_ensure_length_at_least :<{attribute}>, <{length}><CR><{}>
Snippet should_ensure_length_in_range  should_ensure_length_in_range :<{attribute}>, <{range}><CR><{}>
Snippet should_ensure_length_is should_ensure_length_is :<{attribute}>, <{length}><CR><{}>
Snippet should_ensure_value_in_range should_ensure_value_in_range :<{attribute}>, <{range}><CR><{}>
Snippet shnal should_not_allow_values_for :<{attribute}>, <{}>
Snippet shalnum should_only_allow_numeric_values_for :<{}>
Snippet shprot should_protect_attributes :<{}>
Snippet shreqacc should_require_acceptance_of :<{}>
Snippet shreq should_require_attributes :<{}>
Snippet shvuo it { should validate_uniqueness_of(:<{}>) }

" Factory girl
Snippet c create(:<{}>)
Snippet b build(:<{}>)
Snippet bs build_stubbed(:<{}>)

" shoulda association macros
Snippet shbt it { should belong_to(:<{}>) }
Snippet shhabtm should_have_and_belong_to_many :<{association}><CR><{}>
Snippet shhm it { should have_many(:<{}>) }
Snippet shho should_have_one :<{association}><CR><{}>

" shoulda controller macros
Snippet shass should assign_to(:<{var}>).with(<{}>)
Snippet shnfl should_not_set_the_flash<{}>
Snippet shred should redirect_to(<{}>_url)
Snippet shrend should render_template(:<{}>)
Snippet shlay should_render_without_layout :<{}>
Snippet shres should respond_with(:<{}>)
Snippet shroute should route(:<{method}>, "<{path}>").to(:action => :<{}>)
Snippet shfl should set_the_flash.to(/<{}>/i)

" rspec
Snippet desc ``DefaultSpecDescribe(",")`` '<{description}>' do<CR><{}><CR>end
Snippet descn ``DefaultSpecDescribe("")`` do<CR><{}><CR>end
Snippet bef before do<CR><{}><CR>end
Snippet let let(:<{actor}>) { <{}> }
Snippet let! let!(:<{actor}>) { <{}> }
Snippet sub subject { <{}> }
Snippet it it '<{description}>' do<CR><{}><CR>end
Snippet expeq expect(<{subject}>).to eq(<{}>)
Snippet exprec expect(<{subject}>).to have_received(:<{}>)
Snippet expbe expect(<{subject}>).to be_<{}>
Snippet cont context "<{description}>" do<CR><{}><CR>end
Snippet rsh require 'spec_helper'<CR><CR><{}>

" capybara
Snippet feat feature '``DefaultFeatureTitle()``' do<CR><{}><CR>end
Snippet scen scenario '<{}>' do<CR><{}><CR>end

" controller responses
Snippet renda render :action => '<{}>'
Snippet rendn render :nothing => true<{}>
Snippet rendf render :file => '<{}>'
Snippet rendt render :template => '<{}>'
Snippet rendl render :layout => '<{}>'
Snippet red redirect_to <{}>_url
Snippet fl flash[:<{key}>] = "<{}>"

" Cucumber step definitions
Snippet Given Given /^<{}>$/ do<CR>end
Snippet When When /^<{}>$/ do<CR>end
Snippet Then Then /^<{}>$/ do<CR>end
iabbr "( "([^"]+)"

" Search shortcuts
nmap m/ /^\s*\(def \\| def self\.\)

" private
Snippet pr private<CR><CR>
Snippet r attr_reader :<{}>

" Start a new method in a Ruby class
" <Leader>nm
" nmap <Leader>nm gg/^\s\+\(private\\|protected\)\\|^end<Enter>O

" Surround a variable in a string with inspect
nmap <buffer> yiv ysiw}i#<Esc>f}i.inspect<Esc>

" nmap <buffer> yh lF:xEpf=dW
