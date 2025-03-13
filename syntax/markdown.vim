if exists('b:current_syntax')
    unlet b:current_syntax
endif

" -----------------------------------------------------------------------------
"  Heading

syn region markdownHeading matchgroup=markdownHeadingMarker start=/\v^#{1,6}/ end=/$/
            \ oneline keepend
            \ contains=markdownHeadingMarker,markdownHeadingText

syn match markdownHeadingMarker /\v^#{1,6}/ contained nextgroup=markdownHeadingText
syn match markdownHeadingText   /\v%(# *)@<=.*$/ contained

" -----------------------------------------------------------------------------
"  List item

syn match markdownListItemMarker /\v^%(\s*)[-*+]%(\s+%(\S|$))@=/
syn match markdownListItemMarker /\v^%(\s*)[0-9]+[.)]%(\s+%(\S|$))@=/

" -----------------------------------------------------------------------------
"  Code

syn region markdownCode matchgroup=markdownCodeMarker start=/\v`%(`)@!/ skip=/\\`/ end=/`/
            \ oneline keepend
            \ contains=markdownCodeMarker,markdownCodeText

syn match markdownCodeMarker /`/ contained nextgroup=markdownCodeMarker,markdownCodeText
syn match markdownCodeText   /[^`]*/ contained
            \ nextgroup=markdownCodeMarker,markdownCodeText


syn region markdownFencedCodeBlock start=/\v```.*$/ end=/```$/ keepend
            \ contains=markdownFencedCodeBlockMarker,markdownFencedCodeBlockLanguageName

syn match markdownFencedCodeBlockMarker /```/ contained nextgroup=markdownFencedCodeBlockLanguageName
syn match markdownFencedCodeBlockLanguageName /\v%(```)@<=\w+%(.*)@=/ contained

" -----------------------------------------------------------------------------
"  Link

" syn region markdownLink start=/\v\[/ end=/\v\)/ keepend transparent contains=markdownLinkText,markdownLinkUrl

syn region markdownLinkText matchgroup=markdownLinkTextMarker start=/\v\[/ end=/\v\]%(\(.*\))@=/
            \ oneline

syn region markdownLinkUrl matchgroup=markdownLinkUrlMarker start=/\v%(\[.*\])@<=\(/ end=/\v\)/
            \ oneline

" -----------------------------------------------------------------------------
"  Misc

syn match markdownLineBreak "\v  +$"

" -----------------------------------------------------------------------------

hi markdownHeadingMarker    ctermfg=202
hi markdownHeadingText      ctermfg=208

hi markdownListItemMarker   ctermfg=11

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
