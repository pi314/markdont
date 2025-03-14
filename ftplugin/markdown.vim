nnoremap <buffer> <silent> <Plug>(MarkdontSetBullet) <cmd>call markdont#set_bullet()<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetBullet) <cmd>call markdont#set_bullet()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetBullet) :call markdont#set_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontRemoveBullet) <cmd>call markdont#remove_bullet()<CR>
inoremap <buffer> <silent> <Plug>(MarkdontRemoveBullet) <cmd>call markdont#remove_bullet()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontRemoveBullet) :call markdont#remove_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontToggleHeading) <cmd>call markdont#toggle_heading()<CR>
inoremap <buffer> <silent> <Plug>(MarkdontToggleHeading) <cmd>call markdont#toggle_heading()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontToggleHeading) :call markdont#toggle_heading()<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading1) <cmd>call markdont#set_heading(1)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading1) <cmd>call markdont#set_heading(1)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading1) :call markdont#set_heading(1)<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading2) <cmd>call markdont#set_heading(2)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading2) <cmd>call markdont#set_heading(2)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading2) :call markdont#set_heading(2)<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading3) <cmd>call markdont#set_heading(3)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading3) <cmd>call markdont#set_heading(3)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading3) :call markdont#set_heading(3)<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading4) <cmd>call markdont#set_heading(4)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading4) <cmd>call markdont#set_heading(4)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading4) :call markdont#set_heading(4)<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading5) <cmd>call markdont#set_heading(5)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading5) <cmd>call markdont#set_heading(5)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading5) :call markdont#set_heading(5)<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontSetHeading6) <cmd>call markdont#set_heading(6)<CR>
inoremap <buffer> <silent> <Plug>(MarkdontSetHeading6) <cmd>call markdont#set_heading(6)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontSetHeading6) :call markdont#set_heading(6)<CR>gv

vnoremap <buffer> <silent> <Plug>(MarkdontMakeLink)     <cmd>call markdont#make_link()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontMakeLink)     <cmd>call markdont#make_link()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontRemoveLink)   <cmd>call markdont#remove_link()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontEditLinkText) <cmd>call markdont#edit_link_text()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontEditLinkLink) <cmd>call markdont#edit_link_link()<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontMoveToLineStart) <cmd>call markdont#move_cursor_to_line_start(1)<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontMoveToLineStart) <cmd>call markdont#move_cursor_to_line_start(1)<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontEditFromLineStart) I<cmd>call markdont#move_cursor_to_line_start(0)<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontJoinTwoLines) :call markdont#join_two_lines()<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontIncreaseIndent) <cmd>call markdont#increase_indent()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontDecreaseIndent) <cmd>call markdont#decrease_indent()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontIncreaseIndent) :call markdont#increase_indent()<CR>gv
vnoremap <buffer> <silent> <Plug>(MarkdontDecreaseIndent) :call markdont#decrease_indent()<CR>gv

nnoremap <buffer> <silent> <Plug>(MarkdontMoveToNextHeading) <cmd>call markdont#move_cursor_to_next_heading()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontMoveToNextHeading) <cmd>call markdont#move_cursor_to_next_heading()<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontMoveToPrevHeading) <cmd>call markdont#move_cursor_to_prev_heading()<CR>
vnoremap <buffer> <silent> <Plug>(MarkdontMoveToPrevHeading) <cmd>call markdont#move_cursor_to_prev_heading()<CR>

" -----------------------------------------------------------------------------

inoremap <buffer> <silent> <Plug>(MarkdontKey[CarriageReturn]) <cmd>call markdont#carriage_return()<CR>
nnoremap <buffer> <silent> <Plug>(MarkdontKey[o])              A<cmd>call markdont#carriage_return()<CR>

inoremap <buffer> <silent> <Plug>(MarkdontKey[Backspace]) <C-r>=markdont#backspace()<CR>

inoremap <buffer> <silent> <Plug>(MarkdontKey[Tab]) <C-r>=markdont#tab()<CR>
inoremap <buffer> <silent> <Plug>(MarkdontKey[ShiftTab]) <C-\><C-o>:call markdont#shift_tab()<CR>

nnoremap <buffer> <silent> <Plug>(MarkdontKey[cc]) <cmd>call markdont#cc()<CR>A
nnoremap <buffer> <silent> <Plug>(MarkdontKey[S]) <cmd>call markdont#cc()<CR>A

" -----------------------------------------------------------------------------

if !(exists('g:markdont_disable_default_key_mappings') && g:markdont_disable_default_key_mappings)
    let s:mappings = [
                \ ['niv',   '<leader>b',    '<Plug>(MarkdontSetBullet)'],
                \ ['niv',   '<leader>B',    '<Plug>(MarkdontRemoveBullet)'],
                \ ['niv',   '<leader>t',    '<Plug>(MarkdontToggleHeading)'],
                \ ['nv',    't1',           '<Plug>(MarkdontSetHeading1)'],
                \ ['nv',    't2',           '<Plug>(MarkdontSetHeading2)'],
                \ ['nv',    't3',           '<Plug>(MarkdontSetHeading3)'],
                \ ['nv',    't4',           '<Plug>(MarkdontSetHeading4)'],
                \ ['nv',    't5',           '<Plug>(MarkdontSetHeading5)'],
                \ ['nv',    't6',           '<Plug>(MarkdontSetHeading6)'],
                \ ['nv',    '^',            '<Plug>(MarkdontMoveToLineStart)'],
                \ ['n',     'I',            '<Plug>(MarkdontEditFromLineStart)'],
                \ ['n',     'J',            '<Plug>(MarkdontJoinTwoLines)'],
                \ ['nv',    '>',            '<Plug>(MarkdontIncreaseIndent)'],
                \ ['nv',    '<',            '<Plug>(MarkdontDecreaseIndent)'],
                \ ['nv',    'tj',           '<Plug>(MarkdontMoveToNextHeading)'],
                \ ['nv',    'tk',           '<Plug>(MarkdontMoveToPrevHeading)'],
                \ ['nv',    '<leader>l',    '<Plug>(MarkdontMakeLink)'],
                \ ['n',     '<leader>L',    '<Plug>(MarkdontRemoveLink)'],
                \ ['n',     'clt',          '<Plug>(MarkdontEditLinkText)'],
                \ ['n',     'cll',          '<Plug>(MarkdontEditLinkLink)'],
                \ ['i',     '<CR>',         '<Plug>(MarkdontKey[CarriageReturn])'],
                \ ['n',     'o',            '<Plug>(MarkdontKey[o])'],
                \ ['i',     '<BS>',         '<Plug>(MarkdontKey[Backspace])'],
                \ ['i',     '<TAB>',        '<Plug>(MarkdontKey[Tab])'],
                \ ['i',     '<S-TAB>',      '<Plug>(markdontKey[ShiftTab])'],
                \ ['n',     'cc',           '<Plug>(MarkdontKey[cc])'],
                \ ['n',     'S',            '<Plug>(MarkdontKey[S])'],
                \ ]

    for s:entry in s:mappings
        for s:mode in s:entry[0]
            if !hasmapto(s:entry[2], s:mode)
                execute s:mode . 'noremap <buffer> <silent> ' . s:entry[1] .' '. s:entry[2]
            endif
        endfor
    endfor
endif
