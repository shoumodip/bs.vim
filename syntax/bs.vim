" Vim syntax file
" Language: BS

if exists("b:current_syntax")
    finish
endif

setlocal suffixesadd=.bs
setlocal commentstring=//%s
setlocal formatoptions+=cro/

syntax clear
syntax match bsConstant "\<0x[0-9a-fA-F]\+\>"
syntax match bsConstant "\<[0-9]\+\(\.[0-9]\+\)\?\>"

syntax match bsField "\.\s*\a\w*\>"hs=s+1
syntax match bsSpread "\.\."
syntax match bsShebang "\%1l^#!/.*"
syntax match bsFunction "\<\a\w*\s*("he=e-1
syntax match bsFunction "\.\s*\a\w*\s*("hs=s+1,he=e-1

syntax match bsComment "//.*"
syntax region bsNComment contains=bsNComment start="/\*" end="\*/" fold

syntax keyword bsKeyword len panic assert import typeof delete if then else match in is for while break continue pub fn var return
syntax keyword bsConstant nil true false this super is_main_module

syntax match bsType "\<\a\w*\>" contained
syntax keyword bsKeyword class skipwhite skipempty nextgroup=bsType

syntax match bsEscapeInvalid '\\.' contained
syntax match bsEscape /\\e\|\\n\|\\r\|\\t\|\\0\|\\"\|\\'\|\\\\\|\\{/ contained
syntax region bsBraces contains=TOP matchgroup=NONE start='{' end='}'
syntax region bsString contains=bsEscapeInvalid,bsEscape,bsInterpolation start='"' skip='\\\\\|\\"' end='"'
syntax region bsString contains=bsEscapeInvalid,bsEscape,bsInterpolation start="'" skip="\\\\\|\\'" end="'"
syntax region bsInterpolation contained contains=TOP matchgroup=bsEscape start='{' end='}'

highlight! link bsType Type
highlight! link bsField Identifier
highlight! link bsEscape SpecialChar
highlight! link bsString TSString
highlight! link bsKeyword Keyword
highlight! link bsShebang PreProc
highlight! link bsComment Comment
highlight! link bsNComment Comment
highlight! link bsConstant Number
highlight! link bsFunction Function
highlight! link bsEscapeInvalid Error

let b:current_syntax = "bs"
