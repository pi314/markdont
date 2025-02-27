const s:TYPE_NONE = v:false
const s:TYPE_UL = 'UL'
const s:TYPE_OL = 'OL'
const s:TYPE_HEADING = 'HD'

const s:UL_BULLET_SYMBOLS = ['*', '-', '+']
const s:OL_BULLET_FORMATS = ['#.', '#)']


" =============================================================================
" Utility functions " {{{
" -----------------------------------------------------------------------------

function! s:vwidth (s) " {{{
    return strdisplaywidth(a:s)
endfunction " }}}


function! s:endswith (str, postfix) " {{{
    let str_len = strlen(a:str)
    let pattern_len = strlen(a:postfix)
    if str_len < pattern_len
        return 0
    endif
    return (a:str[(str_len - pattern_len):] ==# a:postfix)
endfunction " }}}


function! s:is_monotonic (restriction, list) " {{{
    let this = a:list[0]
    for i in a:list[1:]
        let positive = v:true
        if a:restriction == '<'
            let positive = this < i
        elseif a:restriction == '<='
            let positive = this <= i
        elseif a:restriction == '>'
            let positive = this > i
        elseif a:restriction == '>='
            let positive = this >= i
        endif
        if !positive
            return 0
        endif
        let this = i
    endfor
    return 1
endfunction " }}}


function! s:is_heading_underline (text) " {{{
    return a:text =~# '\v^([-=])\1*$'
endfunction " }}}


function! s:is_heading (text) " {{{
    return a:text =~# '\v^(#+)'
endfunction " }}}


function! s:drift_cursor_position (delta) " {{{
    call cursor(line('.'), col('.') + a:delta)
endfunction " }}}

" -----------------------------------------------------------------------------
" Utility functions " }}}
" =============================================================================

" =============================================================================
" Logic functions " {{{
" -----------------------------------------------------------------------------

function! s:get_bspace (bullet) " {{{
    return repeat(' ', &softtabstop - (s:vwidth(a:bullet) % &softtabstop))
endfunction " }}}


function! s:get_bullet_str (line) " {{{
    if a:line['type'] == s:TYPE_UL
        let indent = a:line['indent']
        let indent_level = (s:vwidth(indent) / &softtabstop)
        let bullet = s:UL_BULLET_SYMBOLS[indent_level % len(s:UL_BULLET_SYMBOLS)]
        return bullet . s:get_bspace(bullet)

    elseif a:line['type'] == s:TYPE_OL
        let indent = a:line['indent']
        let indent_level = (s:vwidth(indent) / &softtabstop)
        let bformat = s:OL_BULLET_FORMATS[indent_level % len(s:OL_BULLET_FORMATS)]
        let bullet = substitute(bformat, '#', a:line['bnum'], '')
        return bullet . s:get_bspace(bullet)
    endif

    return ''
endfunction " }}}


function! s:writeline (line) " {{{
    let line_len = s:vwidth(a:line['origin'])
    let new_line = a:line['origin']

    if a:line['type'] == s:TYPE_UL || a:line['type'] == s:TYPE_OL
        let new_line = a:line['indent'] . s:get_bullet_str(a:line) . a:line['text']
    elseif has_key(a:line, 'heading')
        let new_line = a:line['indent'] . a:line['heading'] . a:line['hspace'] . a:line['text']
    else
        let new_line = a:line['indent'] . a:line['text']
    endif

    if a:line['origin'] != new_line
        call setline(a:line['#'], new_line)
        if a:line['#'] == line('.')
            let new_len = s:vwidth(new_line)
            call s:drift_cursor_position(new_len - line_len)
        endif
    endif
endfunction " }}}


function! s:parseline (linenum) " {{{
    " Patterns:
    "
    " <indent> <bullet> <text>
    "   bullet = <btext> space[N]
    "
    " [WIP] <indent> <checkbox> <text>
    "   checkbox = "-" space[1] mark
    "   mark = "[ ]" | "[X]"
    "
    " <heading> space[N] <text>
    "
    " <indent> <text>
    "
    " indent = space[N]

    if type(a:linenum) == type(0)
        let linenum = a:linenum
    else
        let linenum = line(a:linenum)
    endif

    if linenum < 1 || line('$') < linenum
        return {}
    endif

    let ret = {}
    let ret['#'] = linenum
    let line = getline(a:linenum)
    let ret['origin'] = line

    " bullet -*+
    let m = matchlist(line, '\v^( *)([-*+])( +)(.*)$')
    if m != []
        let ret['type'] = s:TYPE_UL
        let ret['indent'] = m[1]
        let ret['bullet'] = m[2] . m[3]
        let ret['btext'] = m[2]
        let ret['text'] = m[4]
        let ret['textleft'] = m[1] . m[2] . m[3]
        return ret
    endif

    " bullet 1.  1)
    let m = matchlist(line, '\v^( *)(\d+)(\)|\.)( +)(.*)$')
    if m != []
        let ret['type'] = s:TYPE_OL
        let ret['indent'] = m[1]
        let ret['bullet'] = m[2] . m[3] . m[4]
        let ret['btext'] = m[2] . m[3]
        let ret['bnum'] = str2nr(m[2])
        let ret['bformat'] = '#' . m[3]
        let ret['text'] = m[5]
        let ret['textleft'] = m[1] . m[2] . m[3] . m[4]
        return ret
    endif

    " ## heading
    let m = matchlist(line, '\v^(#+)( *)(.*)$')
    if m != []
        let ret['type'] = s:TYPE_HEADING
        let ret['indent'] = ''
        let ret['heading'] = m[1]
        let ret['hspace'] = m[2]
        let ret['text'] = m[3]
        let ret['textleft'] = m[1] . m[2]
        return ret
    endif

    " normal lines
    let m = matchlist(line, '\v(^ *)(.*)')
    let ret['type'] = s:TYPE_NONE
    let ret['indent'] = m[1]
    let ret['text'] = m[2]
    let ret['textleft'] = m[1]
    return ret
endfunction " }}}


function! s:align_bullet (line, refline, alignment) " {{{
    if !has_key(a:line, 'bullet')
        return
    endif

    const RESET = 'RESET'
    const FOLLOW = 'FOLLOW'

    if !has_key(a:refline, 'bullet')
        let action = RESET

    else
        let align_point_1 = s:vwidth(a:refline['indent'])
        let align_point_2 = s:vwidth(a:refline['textleft'])
        if s:vwidth(a:refline['indent']) == s:vwidth(a:line['indent'])
            " same indent, follow it
            let action = FOLLOW

        elseif s:is_monotonic('<', [
                    \ s:vwidth(a:line['indent']),
                    \ align_point_1,
                    \ align_point_2,
                    \ ])
            " refline has greater indent than this line,
            " maybe it's belong to a higher list, so keep searching
            let action = RESET

        elseif s:is_monotonic('<', [
                    \ align_point_1,
                    \ s:vwidth(a:line['indent']),
                    \ align_point_2,
                    \ ])
            " my indent is between reference line's indent and text
            if a:alignment == '<'
                " follow it
                let action = FOLLOW

            elseif a:alignment == '>'
                " indent one level deeper and reset bullet number
                let a:line['indent'] = repeat(' ', align_point_2)
                let action = RESET
            endif

        elseif s:is_monotonic('<', [
                    \ align_point_1,
                    \ align_point_2,
                    \ s:vwidth(a:line['indent']),
                    \ ])
            " refline has lesser indent than this line
            let action = RESET

        else
            " lesser indent bulleted list item, I'm either its subitem or
            " no relation, so reset bullet
            let action = RESET

        endif
    endif

    if action == RESET
        let a:line['bnum'] = 1

    elseif action == FOLLOW
        let a:line['indent'] = a:refline['indent']
        let a:line['type'] = a:refline['type']
        if a:refline['type'] == s:TYPE_OL
            let a:line['bformat'] = a:refline['bformat']
            let a:line['bnum'] = a:refline['bnum'] + 1
        endif

    else
        " echom 's:align_bullet():'. action

    endif
endfunction " }}}


function! s:search_refline (line, types) " {{{
    " Search for previous lines for reference
    let refline = {}
    let meet_empty_line = v:false
    for i in range(a:line['#'] - 1, 1, -1)
        let refline = s:parseline(i)
        if refline == {}
            break
        endif

        " Skip for two consecutive empty lines
        if refline['text'] == ''
            if meet_empty_line
                break
            else
                let meet_empty_line = v:true
            endif
        else
            let meet_empty_line = v:false
        endif

        let baseline = strlen(a:line['textleft'])
        let ref_baseline = strlen(refline['textleft'])

        if baseline < ref_baseline
            continue
        endif

        if baseline > ref_baseline
            return {}
        endif

        if baseline == ref_baseline && index(a:types, refline['type']) != -1
            break
        endif
    endfor

    return refline
endfunction " }}}

" -----------------------------------------------------------------------------
" Logic functions " }}}
" =============================================================================

" =============================================================================
" API for mappings " {{{
" -----------------------------------------------------------------------------

function! markdont#set_bullet () " {{{
    let line = s:parseline('.')

    let refline = s:search_refline(line, [s:TYPE_UL, s:TYPE_OL])

    if refline == {} || !has_key(refline, 'bullet')
        if get(line, 'type', s:TYPE_NONE) == s:TYPE_NONE
            let line['type'] = s:TYPE_UL

        elseif line['type'] == s:TYPE_UL
            let line['type'] = s:TYPE_OL
            let line['bnum'] = 1

        elseif line['type'] == s:TYPE_OL
            let line['type'] = s:TYPE_UL
            unlet line['bnum']
        endif

    else
        let line['indent'] = refline['indent']

        let line['type'] = refline['type']
        if has_key(refline, 'bnum')
            let line['bnum'] = refline['bnum'] + 1
        endif
    endif

    call s:writeline(line)
endfunction " }}}


function! markdont#remove_bullet () range " {{{
    for linenum in range(a:firstline, a:lastline)
        let line = s:parseline(linenum)

        let refline = s:search_refline(line, [s:TYPE_NONE, s:TYPE_UL, s:TYPE_OL])

        if has_key(line, 'bullet')
            unlet line['bullet']
            let line['type'] = s:TYPE_NONE
            if refline != {} && has_key(refline, 'bullet')
                let line['indent'] = repeat(' ', strlen(refline['textleft']))
            endif
            call s:writeline(line)
        endif
    endfor
endfunction " }}}


function! markdont#carriage_return () " {{{
    let line = s:parseline('.')
    let offset = col('.') - 1
    let breakpoint = strlen(line['textleft'])

    if offset <= breakpoint
        let left = ''
        let right = line['text']
    else
        let left = line['origin'][:offset-1]
        let right = repeat(' ', strlen(get(line, 'bullet', ''))) . line['origin'][offset:]
    endif

    call setline('.', left)
    call append('.', line['indent'] . right)
    call cursor(line('.') + 1, 1)

    if has_key(line, 'bullet')
        call markdont#set_bullet()
    endif
    call markdont#move_cursor_to_line_start(0)
endfunction " }}}


function! markdont#backspace () " {{{
    let line = s:parseline('.')

    if has_key(line, 'bullet') && strlen(line['textleft']) + 1 == col('.')
        let line['type'] = s:TYPE_NONE
        let line['indent'] = repeat(' ', strlen(line['textleft']))
        call s:writeline(line)
        return ''
    endif

    return "\<backspace>"
endfunction " }}}


function! markdont#move_cursor_to_line_start (toggle) " {{{
    let line = s:parseline('.')
    let logical_line_start = strlen(line['textleft']) + 1
    if col('.') == logical_line_start && a:toggle
        if has_key(line, 'indent')
            call cursor(line('.'), strlen(line['indent']) + 1)
        elseif has_key(line, 'heading')
            call cursor(line('.'), 1)
        endif
    else
        call cursor(line('.'), logical_line_start)
    endif
endfunction " }}}


function! markdont#move_cursor_to_next_heading () " {{{
    let thisline = getline('.')
    let nextline = (line('.') > line('$')) ? '' : getline(line('.') + 1)

    let row = line('.')
    if s:is_heading(thisline)
        let row = row + 1
    elseif s:is_heading_underline(nextline)
        let row = row + 2
    endif

    while row <= line('$')
        let line = getline(row)
        if s:is_heading(line)
            call cursor(row, 1)
            return
        endif
        if s:is_heading_underline(line)
            let lastline = getline(row - 1)
            if lastline != ''
                call cursor(row - 1, 1)
                return
            endif
        endif
        let row += 1
    endwhile
endfunction " }}}


function! markdont#move_cursor_to_prev_heading () range " {{{
    let row = line('.') - 1
    while row > 0
        let line = getline(row)
        if s:is_heading(line)
            call cursor(row, 1)
            return
        endif
        if s:is_heading_underline(line)
            let lastline = getline(row - 1)
            if lastline != ''
                call cursor(row - 1, 1)
                return
            endif
        endif
        let row -= 1
    endwhile
endfunction " }}}


function! markdont#join_two_lines () " {{{
    let nln = line('.') + 1
    if nln <= line('$')
        let line = s:parseline(nln)
        call setline(nln, line['text'])
        normal! J
    endif
endfunction " }}}


function! markdont#increase_indent () range " {{{
    for linenum in range(a:firstline, a:lastline)
        let line = s:parseline(linenum)
        " Error
        if line == {}
            continue
        endif

        " Skip empty lines
        if line['type'] == s:TYPE_NONE && get(line, 'indent', '') == '' && get(line, 'text', '') == ''
            continue
        endif

        " Search for prev two lines for reference
        let refline = s:parseline(linenum - 1)
        if get(refline, 'text', '') == ''
            let refline = s:parseline(linenum - 2)
        endif

        let check = v:true
        let misindent = strlen(refline['indent']) - strlen(line['indent'])
        if s:is_monotonic('<', [0, misindent, &shiftwidth])
            let line['indent'] = repeat(' ', strlen(line['indent']) + misindent)
            let check = v:false
        endif

        if check
            let misindent = (strlen(line['indent']) % &shiftwidth)
            let line['indent'] = repeat(' ', strlen(line['indent']) - misindent + &shiftwidth)
        endif

        if has_key(line, 'bullet')
            call s:align_bullet(line, refline, '>')
        endif
        call s:writeline(line)
    endfor
endfunction " }}}


function! markdont#decrease_indent () range " {{{
    for linenum in range(a:firstline, a:lastline)
        let line = s:parseline(linenum)
        " Error
        if line == {}
            continue
        endif

        " Skip empty lines
        if line['type'] == s:TYPE_NONE && get(line, 'indent', '') == '' && get(line, 'text', '') == ''
            continue
        endif

        " Search for prev two lines for reference
        let refline = s:parseline(linenum - 1)
        if get(refline, 'text', '') == ''
            let refline = s:parseline(linenum - 2)
        endif

        let check = v:true
        let misindent = strlen(line['indent']) - strlen(refline['indent'])
        if s:is_monotonic('<', [0, misindent, &shiftwidth])
            let line['indent'] = repeat(' ', strlen(line['indent']) - misindent)
            let check = v:false
        endif

        if check
            let misindent = (strlen(line['indent']) % &shiftwidth)
            if misindent != 0
                let line['indent'] = repeat(' ', strlen(line['indent']) - misindent)
            else
                let line['indent'] = repeat(' ', strlen(line['indent']) - &shiftwidth)
            endif
        endif

        if has_key(line, 'bullet')
            call s:align_bullet(line, refline, '<')
        endif

        call s:writeline(line)
    endfor
endfunction " }}}


function! markdont#tab () " {{{
    let line = s:parseline('.')

    if line['type'] == s:TYPE_HEADING
        if strlen(line['hspace']) == 0
            let line['hspace'] = ' '
            call s:writeline(line)
            call cursor(line('.'), strlen(line['heading'] . line['hspace']) + 1)
            return ''
        endif

        if strlen(line['heading']) < 6
            let line['heading'] .= '#'
            call s:writeline(line)
            call cursor(line('.'), strlen(line['heading'] . line['hspace']) + 1)
        endif
        return ''
    endif

    if !has_key(line, 'bullet')
        return "\<TAB>"
    endif

    let logical_line_start = strlen(line['textleft']) + 1
    if col('.') <= logical_line_start
        call markdont#increase_indent()
        call markdont#move_cursor_to_line_start(0)
        return ''
    else
        return "\<TAB>"
    endif
endfunction " }}}


function! markdont#shift_tab () " {{{
    let line = s:parseline('.')

    if has_key(line, 'heading')
        if strlen(line['heading']) > 1
            let line['heading'] = line['heading'][:-2]
            call s:writeline(line)
            call markdont#move_cursor_to_line_start(0)
        endif
        return ''
    endif

    let logical_line_start = strlen(line['textleft']) + 1
    if col('.') <= logical_line_start
        call markdont#decrease_indent()
        call markdont#move_cursor_to_line_start(0)
    endif
    return ''
endfunction " }}}


function! markdont#cc () " {{{
    let line = s:parseline('.')
    let line['text'] = ''
    call s:writeline(line)
endfunction " }}}

" -----------------------------------------------------------------------------
" API for mappings " }}}
" =============================================================================
