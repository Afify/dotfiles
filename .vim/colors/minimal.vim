" minimal theme

hi clear
if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'minimal'
set background=dark
set number
set cursorline
set foldmethod=syntax
set colorcolumn=80,81
hi clear SignColumn

autocmd FileType gitcommit     set  textwidth=72 colorcolumn=50,51,72,73
autocmd FileType gitrebase     set  textwidth=63 colorcolumn=63,64
autocmd BufRead *tmp/neomutt-* set  textwidth=72 colorcolumn=72,73

hi Type                  ctermfg=29   ctermbg=0    cterm=none
hi StorageClass          ctermfg=29   ctermbg=0    cterm=bold
hi Statement             ctermfg=29   ctermbg=0    cterm=none

hi ColorColumn           ctermfg=none ctermbg=234  cterm=none
hi Comment               ctermfg=239  ctermbg=0    cterm=none
hi Conceal               ctermfg=246  ctermbg=0    cterm=none
hi Constant              ctermfg=246  ctermbg=0    cterm=none
hi CursorLine            ctermfg=none ctermbg=232  cterm=none
hi CursorLineNr          ctermfg=166  ctermbg=232  cterm=none
hi DiffAdd               ctermfg=246  ctermbg=22   cterm=none
hi DiffChange            ctermfg=0    ctermbg=94   cterm=none
hi DiffDelete            ctermfg=0    ctermbg=52   cterm=none
hi DiffText              ctermfg=246  ctermbg=24   cterm=none
hi EndOfBuffer           ctermfg=0    ctermbg=0    cterm=none
hi FoldColumn            ctermfg=246  ctermbg=0    cterm=none
hi Folded                ctermfg=239  ctermbg=232  cterm=none
hi GitGutterAdd          ctermfg=2    ctermbg=232  cterm=none
hi GitGutterChange       ctermfg=166  ctermbg=232  cterm=none
hi GitGutterChangeDelete ctermfg=166  ctermbg=232  cterm=none
hi GitGutterDelete       ctermfg=9    ctermbg=232  cterm=none
hi Identifier            ctermfg=246  ctermbg=0    cterm=none
hi LineNr                ctermfg=236  ctermbg=232  cterm=none
hi MatchParen            ctermfg=2    ctermbg=233  cterm=bold
hi NonText               ctermfg=235  ctermbg=0    cterm=none
hi Normal                ctermfg=246  ctermbg=0    cterm=none
hi Pmenu                 ctermfg=254  ctermbg=236  cterm=none
hi PmenuSbar             ctermfg=236  ctermbg=236  cterm=none
hi PmenuSel              ctermfg=254  ctermbg=26   cterm=none
hi PmenuThumb            ctermfg=237  ctermbg=237  cterm=none
hi PreProc               ctermfg=246  ctermbg=0    cterm=none
hi Search                ctermfg=255  ctermbg=130  cterm=bold
hi SignColumn            ctermfg=242  ctermbg=232  cterm=none
hi Special               ctermfg=246  ctermbg=0    cterm=none
hi SpecialKey            ctermfg=1    ctermbg=20   cterm=none
hi StatusLine            ctermfg=246  ctermbg=232  cterm=none
hi StatusLineNC          ctermfg=245  ctermbg=232  cterm=none
hi StatusLine_g          ctermfg=106  ctermbg=232  cterm=none
hi StatusLine_o          ctermfg=166  ctermbg=232  cterm=none
hi StatusLine_r          ctermfg=124  ctermbg=232  cterm=none
hi String                ctermfg=106  ctermbg=0    cterm=none
hi SyntasticErrorLine    ctermfg=124  ctermbg=0    cterm=none
hi SyntasticErrorLineNr  ctermfg=0    ctermbg=124  cterm=none
hi SyntasticErrorSign    ctermfg=124  ctermbg=232  cterm=none
hi SyntasticWarningSign  ctermfg=226  ctermbg=232  cterm=none
hi Todo                  ctermfg=9    ctermbg=0    cterm=none
hi VertSplit             ctermfg=0    ctermbg=0    cterm=none
hi Visual                ctermfg=246  ctermbg=237  cterm=none

hi cString               ctermfg=246  ctermbg=0    cterm=none
hi diffAdded             ctermfg=100  ctermbg=0    cterm=none
hi diffChanged           ctermfg=246  ctermbg=0    cterm=none
hi diffFile              ctermfg=166  ctermbg=0    cterm=none
hi diffLine              ctermfg=24   ctermbg=0    cterm=none
hi diffNewFile           ctermfg=172  ctermbg=0    cterm=none
hi diffRemoved           ctermfg=88   ctermbg=0    cterm=none
hi makeCommands          ctermfg=242  ctermbg=0    cterm=none
hi makeIdent             ctermfg=24   ctermbg=0    cterm=none
hi makeTarget            ctermfg=130  ctermbg=0    cterm=bold
hi pythonBuiltinFunc     ctermfg=130  ctermbg=0    cterm=none
hi pythonFunction        ctermfg=130  ctermbg=0    cterm=none

" custom
hi Sred                  ctermfg=124  ctermbg=232  cterm=none
hi Sgreen                ctermfg=106  ctermbg=232  cterm=none
hi Sorange               ctermfg=166  ctermbg=232  cterm=none
hi n_red                 ctermfg=124  ctermbg=0    cterm=none
hi f_blue                ctermfg=24   ctermbg=0    cterm=none
hi n_purple              ctermfg=90   ctermbg=0    cterm=none
hi T_header              ctermfg=130  ctermbg=0    cterm=underline
hi tabchar               ctermfg=234  ctermbg=0    cterm=none

hi def link nroffEscRegArg   n_purple
hi def link nroffEscape      Sred
hi def link nroffIdent       Sgreen
hi def link nroffReqLeader   Type
hi def link nroffReqName     Type
hi def link nroffRequest     Sred
hi def link nroffSpace       Sred
hi def link nroffSpecialChar Sred

hi yellow                ctermfg=11   ctermbg=0    cterm=none
hi blue                  ctermfg=27   ctermbg=0    cterm=none
hi magenta               ctermfg=5    ctermbg=0    cterm=none
hi green                 ctermfg=2    ctermbg=0    cterm=none
hi cyan                  ctermfg=14   ctermbg=0    cterm=underline


hi Error NONE
2match tabchar /\t/
if &diff | hi CursorLine ctermbg=none | endif

" hi Boolean             ctermfg=246  ctermbg=0    cterm=none
" hi Character           ctermfg=246  ctermbg=0    cterm=none
" hi Conditional         ctermfg=246  ctermbg=0    cterm=none
" hi Cursor              ctermfg=235  ctermbg=254  cterm=none
" hi CursorColumn        ctermfg=none ctermbg=236  cterm=none
" hi Define              ctermfg=246  ctermbg=0    cterm=none
" hi Delimiter           ctermfg=145  ctermbg=none cterm=none
" hi Directory           ctermfg=81   ctermbg=none cterm=none
" hi Error               ctermfg=235  ctermbg=210  cterm=none
" hi ErrorMsg            ctermfg=210  ctermbg=none cterm=none
" hi Exception           ctermfg=246  ctermbg=0    cterm=none
" hi Float               ctermfg=246  ctermbg=0    cterm=none
" hi Function            ctermfg=246  ctermbg=none cterm=bold
" hi FunctionDef         ctermfg=4    ctermbg=none cterm=none
" hi Ignore              ctermfg=59   ctermbg=none cterm=none
" hi Include             ctermfg=246  ctermbg=0    cterm=none
" hi IncSearch           ctermfg=2    ctermbg=0    cterm=none
" hi Keyword             ctermfg=246  ctermbg=0    cterm=none
" hi Label               ctermfg=246  ctermbg=0    cterm=none
" hi Macro               ctermfg=246  ctermbg=0    cterm=none
" hi ModeMsg             ctermfg=246  ctermbg=0    cterm=none
" hi MoreMsg             ctermfg=2    ctermbg=0    cterm=none
" hi None                ctermfg=254  ctermbg=none cterm=none
" hi Number              ctermfg=246  ctermbg=0    cterm=none
" hi Operator            ctermfg=145  ctermbg=none cterm=none
" hi PreCondit           ctermfg=246  ctermbg=0    cterm=none
" hi Question            ctermfg=211  ctermbg=none cterm=none
" hi QuickFixLine        ctermfg=254  ctermbg=26   cterm=none
" hi Repeat              ctermfg=246  ctermbg=0    cterm=none
" hi SpecialComment      ctermfg=145  ctermbg=none cterm=none
" hi SpellBad            ctermfg=none ctermbg=none cterm=undercurl
" hi SpellCap            ctermfg=none ctermbg=none cterm=undercurl
" hi SpellLocal          ctermfg=none ctermbg=none cterm=undercurl
" hi SpellRare           ctermfg=none ctermbg=none cterm=undercurl
" hi Structure           ctermfg=246  ctermbg=0    cterm=none
" hi Title               ctermfg=254  ctermbg=none cterm=bold
" hi Underlined          ctermfg=246  ctermbg=0    cterm=none
" hi WarningMsg          ctermfg=210  ctermbg=none cterm=none
" hi WildMenu            ctermfg=2    ctermbg=16   cterm=none

" hi makeBString         ctermfg=24   ctermbg=0    cterm=none
" hi makeCmdNextLine     ctermfg=24   ctermbg=0    cterm=none
" hi makeCommandError    ctermfg=24   ctermbg=0    cterm=none
" hi makeComment         ctermfg=24   ctermbg=0    cterm=none
" hi makeConfig          ctermfg=24   ctermbg=0    cterm=none
" hi makeDString         ctermfg=24   ctermbg=0    cterm=none
" hi makeDefine          ctermfg=24   ctermbg=0    cterm=none
" hi makeError           ctermfg=24   ctermbg=0    cterm=none
" hi makeEscapedChar     ctermfg=24   ctermbg=0    cterm=none
" hi makeExport          ctermfg=24   ctermbg=0    cterm=none
" hi makeImplicit        ctermfg=24   ctermbg=0    cterm=none
" hi makeInclude         ctermfg=24   ctermbg=0    cterm=none
" hi makeNextLine        ctermfg=24   ctermbg=0    cterm=none
" hi makeOverride        ctermfg=24   ctermbg=0    cterm=none
" hi makePreCondit       ctermfg=24   ctermbg=0    cterm=none
" hi makeSString         ctermfg=24   ctermbg=0    cterm=none
" hi makeSpecTarget      ctermfg=24   ctermbg=0    cterm=none
" hi makeSpecial         ctermfg=24   ctermbg=0    cterm=none
" hi makeStatement       ctermfg=2   ctermbg=0    cterm=none
" hi makeTodo            ctermfg=24   ctermbg=0    cterm=none

" hi pythonBuiltin ctermfg=130  ctermbg=0    cterm=none
" hi pythonBuiltinObj ctermfg=130  ctermbg=0    cterm=none
" hi pythonDecorator ctermfg=130  ctermbg=0    cterm=none
" hi pythonInclude GruvboxBlue
" hi pythonImport GruvboxBlue
" hi pythonRun GruvboxBlue
" hi pythonCoding GruvboxBlue
" hi pythonOperator GruvboxRed
" hi pythonException GruvboxRed
" hi pythonExceptions GruvboxPurple
" hi pythonBoolean GruvboxPurple
" hi pythonDot GruvboxFg3
" hi pythonConditional GruvboxRed
" hi pythonRepeat GruvboxRed
" hi pythonDottedName GruvboxGreenBold

" hi User1 guifg=#ffdad8  guibg=#880c0e
" hi User2 guifg=#000000  guibg=#F4905C
" hi User3 guifg=#292b00  guibg=#f4f597
" hi User4 guifg=#112605  guibg=#aefe7B
" hi User5 guifg=#051d00  guibg=#7dcc7d
" hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
" hi User8 guifg=#ffffff  guibg=#5b7fbb
" hi User9 guifg=#ffffff  guibg=#810085
" hi User0 guifg=#ffffff  guibg=#094afe


" b_red     =167  n_red    =124  f_red      =88
" b_green   =142  n_green  =106  f_green    =100
" b_yellow  =214  n_yellow =172  f_yellow   =136
" b_blue    =109  n_blue   =66   f_blue     =24
" b_purple  =175  n_purple =132  f_purple   =96
" b_aqua    =108  n_aqua   =72   f_aqua     =66
" b_orange  =208  n_orange =166  f_orange   =130
