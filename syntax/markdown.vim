if exists('b:current_syntax')
    unlet b:current_syntax
endif

" -----------------------------------------------------------------------------
" Heading

syn region markdownHeading matchgroup=markdownHeadingMarker start=/\v^#{1,6}/ end=/$/
            \ oneline keepend
            \ contains=markdownHeadingMarker,markdownHeadingText

syn match markdownHeadingMarker /\v^#{1,6}/ contained nextgroup=markdownHeadingText
syn match markdownHeadingText   /\v%(# *)@<=.*$/ contained

" -----------------------------------------------------------------------------
" List item

syn match markdownListItemMarker /\v^%(\s*)[-*+]%(\s+%(\S|$))@=/
syn match markdownListItemMarker /\v^%(\s*)[0-9]+[.)]%(\s+%(\S|$))@=/

" -----------------------------------------------------------------------------
" Emphasis

syn region markdownSingleEmphasis start=/\v\z(\*|_)/ end=/\v\z1/ oneline keepend

syn region markdownDoubleEmphasis start=/\v\z(\*\*|__)/ end=/\v\z1/ oneline keepend

syn region markdownTripleEmphasis start=/\v\z(\*\*\*|___)/ end=/\v\z1/ oneline keepend

" -----------------------------------------------------------------------------
" Code

syn region markdownCode matchgroup=markdownCodeMarker start=/\v`%(`)@!/ skip=/\\`/ end=/`/
            \ oneline keepend
            \ contains=markdownCodeMarker,markdownCodeText

syn match markdownCodeMarker /`/ contained nextgroup=markdownCodeMarker,markdownCodeText
syn match markdownCodeText   /[^`]*/ contained
            \ nextgroup=markdownCodeMarker,markdownCodeText


syn region markdownFencedCodeBlock start=/\v```.*$/ end=/```$/ keepend
            \ transparent
            \ contains=markdownFencedCodeBlockMarker,markdownFencedCodeBlockLanguageName

syn match markdownFencedCodeBlockMarker /```/ contained
syn match markdownFencedCodeBlockMarker /\v%(```)@<=\w+/ contained

if !exists('g:markdown_fenced_languages')
  let g:markdown_fenced_languages = []
endif

function! s:load_fenced_language_syntax_highlight ()
    let included = {}
    for entry in g:markdown_fenced_languages
        " g:markdown_fenced_languages = ['alias=lang']
        let tokens = split(entry, '=')
        if tokens == []
            continue
        endif
        let aliases = tokens[:-1]
        let lang = tokens[-1]
        if lang == ''
            continue
        endif

        try
            if !has_key(included, lang)
                exe 'syn include @markdownEmbeddedLanguage_'. lang .' syntax/'. lang .'.vim'
                unlet! b:current_syntax

                exe 'syn match markdownFencedCodeBlockLanguageName /\v%(```)@<='. lang .'>/ contained'

                exe 'syn region markdownFencedCodeBlock start=/\v```'. lang .'>%(.*)?$/ end=/```$/ keepend' .
                        \ ' transparent'
                        \ ' contains=markdownFencedCodeBlockMarker,markdownFencedCodeBlockLanguageName,@markdownEmbeddedLanguage_'. lang
            endif

            for alias in aliases
                if alias != lang
                    exe 'syn match markdownFencedCodeBlockLanguageName /\v%(```)@<='. alias .'>/ contained'
                    exe 'syn region markdownFencedCodeBlock start=/\v```'. alias .'>%(.*)?$/ end=/```$/ keepend' .
                            \ ' transparent'
                            \ ' contains=markdownFencedCodeBlockMarker,markdownFencedCodeBlockLanguageName,@markdownEmbeddedLanguage_'. lang
                endif
            endfor

            let included[(lang)] = v:true
        catch /E484/
            " Syntax file not found, ignore it
        endtry
    endfor
endfunction
call <SID>load_fenced_language_syntax_highlight()

" -----------------------------------------------------------------------------
" Link

" syn region markdownLink start=/\v\[/ end=/\v\)/ keepend transparent contains=markdownLinkText,markdownLinkUrl

syn region markdownLinkText matchgroup=markdownLinkTextMarker start=/\v\[/ end=/\v\]%(\(.*\))@=/
            \ oneline

syn region markdownLinkUrl matchgroup=markdownLinkUrlMarker start=/\v%(\[.*\])@<=\(/ end=/\v\)/
            \ oneline

" -----------------------------------------------------------------------------
" Misc

syn match markdownLineBreak "\v  +$"

" -----------------------------------------------------------------------------

hi markdownHeadingMarker    ctermfg=202
hi markdownHeadingText      ctermfg=208

hi markdownListItemMarker   ctermfg=11

hi markdownSingleEmphasis   cterm=italic
hi markdownDoubleEmphasis   cterm=bold
hi markdownTripleEmphasis   cterm=bold,italic

hi markdownCodeMarker       ctermfg=5
hi markdownCodeText         ctermfg=13

hi markdownFencedCodeBlockMarker        ctermfg=5
hi markdownFencedCodeBlockLanguageName  ctermfg=13

hi markdownLinkText         cterm=underline ctermfg=45
hi markdownLinkTextMarker   ctermfg=39
hi markdownLinkUrl          cterm=underline ctermfg=135
hi markdownLinkUrlMarker    ctermfg=99

hi def link markdownLineBreak Visual

let b:current_syntax = 'markdont'
