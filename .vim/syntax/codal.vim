" Vim syntax file
" Language:    Codal 3
" Filenames:   *.codal
" Maintainer:  Adam Matousek <adam.matousek@codasip.com>
" Last Change: 2024 Dec 17

" quit when a syntax file was already loaded
if exists("b:current_syntax")
	finish
endif

syn case match

" Enclosing delimiters
syn region codalEncl transparent matchgroup=codalParEncl start="(" end=")" contains=ALLBUT,codalParErr,codalNumberTemplateIn,@codalNumberInner
syn region codalEncl transparent matchgroup=codalBrackEncl start="\[" end="\]" contains=ALLBUT,codalBrackErr,codalNumberTemplateIn,@codalNumberInner
syn region codalEncl transparent matchgroup=codalBraceEncl start="{" end="}" contains=ALLBUT,codalBraceErr,codalNumberTemplateIn,@codalNumberInner
syn region codalEncl transparent matchgroup=codalTemplEncl start="<{" end="}>" contains=ALLBUT,codalTemplErr,codalNumberTemplateIn,@codalNumberInner

syn region codalNumberTemplateIn transparent matchgroup=codalNumberTemplate start="<{" end="}>" contains=ALLBUT,codalTemplErr,codalNumberTemplateIn,@codalNumberInner contained

" Keywords
syn keyword codalPragma pragma

syn keyword codalKeyword module interface fifo register_file register sram address_space subtarget input output parameter
syn keyword codalKeyword pipeline role loader pc arch rtl
syn keyword codalKeyword always automatic pure initialize public export
syn keyword codalKeyword memory connect extra_reg dataport
syn keyword codalKeyword element set emulation peephole assembly binary start semantics instructions pattern
syn keyword codalKeyword replace mapping alias attribute open STRINGIZE forward slots slot bit clockgate decoder
syn keyword codalType extend extern parallel

syn keyword codalAnsiLabel default case
syn keyword codalAnsiStatement if switch else continue break return generate for do stage while __attribute__

" Types
syn match codalType /\<\(simd[1-9]\d*\)\?u\?int[1-9]\d*\>/
syn match codalType /\<\(simd[1-9]\d*\)\?u\?int[1-9]\d*\>/
syn match codalType /\<\(simd\|u\?int\|float\)\ze\s*<{/ nextgroup=codalNumberTemplateIn
syn match codalType /\<\(simd[1-9]\d*\)\?float\(16\|32\|64\)\>/
syn match codalType /\<\(de\)\?bundle\d*\>/
syn keyword codalType void bool struct enum typename bundle_state_t
syn keyword codalType const dont_touch typedef inline static

" Constants
syn keyword codalConstant true false

" Operators
syn keyword codalOperator sizeof bitsizeof clog2

" Numbers (from c.vim)
syn case ignore
syn match codalNumbers display transparent "\<\d\|\.\d" contains=codalNumber,codalFloat,codalOctalError,codalOctal
syn match codalNumber display contained "\%([1-9]\%(\d\|_\)*\|0\)\%(l*\%(ul*\)\?\)\>"
"hex number
syn match codalNumber display contained "0x_*\%(\x\|?\)\%(\x\|?\|_\)*\%(l*\%(ul*\)\?\)\%(\w\|?\|_\)\@!"
" flag an octal number with wrong digits
syn match codalOctalError display contained "0_*\%(\d\|?\)\%(\d\|?\|_\)*\%(l*\%(ul*\)\?\)\%(\w\|?\|_\)\@!"
syn match codalOctal display contained "0_*\%(\o\|?\)\%(\o\|?\|_\)*\%(l*\%(ul*\)\?\)\%(\w\|?\|_\)\@!" contains=codalOctalZero
" Flag the first zero of an octal number as something special
syn match codalOctalZero display contained "\<0"
"floating point number, with dot, optional exponent
syn match codalFloat display contained "\d\+\.\d*\%(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match codalFloat display contained "\.\d\+\%(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match codalFloat display contained "\d\+e[-+]\=\d\+[fl]\=\>"
syn case match

syn cluster codalNumberInner contains=codalNumber,codalOctal,codalOctalZero,codalFloat,codalOctalError

" Include
syn match codalInclude "^\s*\zs\(%:\|#\)\s*include\>"

" Comments
syn region codalComment start="//" skip="\\$" end="$" keepend contains=codalComment,codalTodo
syn region codalComment start="/\*" end="\*/" contains=codalComment,codalTodo

" Preprocessor
syn region codalPreProc start="^\s*\zs\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$"
syn region codalDefine  start="^\s*\zs\(%:\|#\)\s*\(define\|undef\|if\|ifdef\|ifndef\|else\|endif\)\>" skip="\\$" end="$"

" Macroprocessor
syn match codalMacroprocessorGarbage "^.\+\ze\$\$\s*include\>" contains=codalPreProc
syn match codalPreProc "\$\$\s*\%(include\|if\|elif\|else\|endif\|for\|endfor\|macro\|endmacro\|let\|define\|undef\)\>"
syn match codalMacroprocessorGarbage "\%(\$\$\s*macro\>.*\)\@<=/\*\%([^*]\|\*/\@!\)*$" contains=codalPreProc

" Builtins
syn match codalBuiltin /\<codasip_\w\+\>/

" Errors
syn match codalParErr     ")"
syn match codalBrackErr   "]"
syn match codalBraceErr   "}"
syn match codalTemplErr   "}>"

" Todo
syn keyword codalTodo TODO FIXME todo fixme Todo Fixme xxx XXX

" Strings
syn region codalString start=+"+ skip=+\\\\\|\\"+ end=+"+

" Synchronization
syn sync minlines=50
syn sync maxlines=500

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link codalParErr Error
hi def link codalBraceErr Error
hi def link codalBrackErr Error
hi def link codalTemplErr Error
hi def link codalMacroprocessorGarbage Error

hi def link codalComment Comment

hi def link codalTodo Todo

hi def link codalKeyword Keyword
hi def link codalPragma PreProc
hi def link codalAnsiStatement Statement
hi def link codalAnsiLabel Label
hi def link codalOperator Operator

hi def link codalType Type
hi def link codalString String

hi def link codalBuiltin Identifier

hi def link codalInclude Include
hi def link codalPreProc PreProc
hi def link codalDefine Macro

hi def link codalConstant Constant
hi def link codalNumber Number
hi def link codalOctal Number
hi def link codalOctalZero PreProc
hi def link codalOctalError Error
hi def link codalFloat Float

hi def link codalNumberTemplate Type

let b:current_syntax = "codal"

