" Vim indent file
" Language:	BS

if exists('b:did_indent')
    finish
endif
let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal indentexpr=BsIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=],0=),0=*

let b:undo_indent = "setlocal autoindent< indentexpr< indentkeys< lisp<"

if exists('*BsIndent')
    finish
endif

function! BsIndent(lnum)
    let l:prevlnum = prevnonblank(a:lnum-1)
    if l:prevlnum == 0
        return 0
    endif

    let l:prevl = substitute(getline(l:prevlnum), '//.*$', '', '')
    let l:thisl = substitute(getline(a:lnum), '//.*$', '', '')
    let l:previ = indent(l:prevlnum)

    let l:ind = l:previ

    if l:prevl =~ '[({\[]\s*$'
        let l:ind += shiftwidth()
    endif

    if l:thisl =~ '^\s*[)}\]]'
        let l:ind -= shiftwidth()
    endif

    if l:prevl =~ '^\s*/\*'
        let l:ind += 1
    endif

    if l:prevl =~ '^\s*\*/'
        let l:ind -= 1
    endif

    return l:ind
endfunction
