nnoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_SetBullet :call markdont#set_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet :call markdont#remove_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_ToggleHeading <cmd>call markdont#toggle_heading()<CR>
inoremap <buffer> <silent> <Plug>Markdont_ToggleHeading <cmd>call markdont#toggle_heading()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_ToggleHeading :call markdont#toggle_heading()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_MoveCursorToLineStart <cmd>call markdont#move_cursor_to_line_start(1)<CR>
vnoremap <buffer> <silent> <Plug>Markdont_MoveCursorToLineStart <cmd>call markdont#move_cursor_to_line_start(1)<CR>

nnoremap <buffer> <silent> <Plug>Markdont_EditFromLineStart I<cmd>call markdont#move_cursor_to_line_start(0)<CR>

nnoremap <buffer> <silent> <Plug>Markdont_JoinTwoLines :call markdont#join_two_lines()<CR>

nnoremap <buffer> <silent> <Plug>Markdont_IncreaseIndent <cmd>call markdont#increase_indent()<CR>
nnoremap <buffer> <silent> <Plug>Markdont_DecreaseIndent <cmd>call markdont#decrease_indent()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_IncreaseIndent :call markdont#increase_indent()<CR>gv
vnoremap <buffer> <silent> <Plug>Markdont_DecreaseIndent :call markdont#decrease_indent()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_MoveToNextHeading <cmd>call markdont#move_cursor_to_next_heading()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_MoveToNextHeading <cmd>call markdont#move_cursor_to_next_heading()<CR>

nnoremap <buffer> <silent> <Plug>Markdont_MoveToPrevHeading <cmd>call markdont#move_cursor_to_prev_heading()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_MoveToPrevHeading <cmd>call markdont#move_cursor_to_prev_heading()<CR>

" -----------------------------------------------------------------------------

inoremap <buffer> <silent> <Plug>Markdont_CarriageReturn <cmd>call markdont#carriage_return()<CR>
nnoremap <buffer> <silent> <Plug>Markdont_o              A<cmd>call markdont#carriage_return()<CR>

inoremap <buffer> <silent> <Plug>Markdont_Backspace <C-r>=markdont#backspace()<CR>

inoremap <buffer> <silent> <Plug>Markdont_Tab <C-r>=markdont#tab()<CR>
inoremap <buffer> <silent> <Plug>markdont_ShiftTab <C-\><C-o>:call markdont#shift_tab()<CR>

nnoremap <buffer> <silent> <Plug>Markdont_cc <cmd>call markdont#cc()<CR>A
nnoremap <buffer> <silent> <Plug>Markdont_S <cmd>call markdont#cc()<CR>A



if !(exists('g:markdont_disable_default_key_mappings') && g:markdont_disable_default_key_mappings)
    let s:mappings = [
                \ ['niv',   '<leader>b',    '<Plug>Markdont_SetBullet'],
                \ ['niv',   '<leader>B',    '<Plug>Markdont_RemoveBullet'],
                \ ['niv',   '<leader>h',    '<Plug>Markdont_ToggleHeading'],
                \ ['nv',    '^',            '<Plug>Markdont_MoveCursorToLineStart'],
                \ ['n',     'I',            '<Plug>Markdont_EditFromLineStart'],
                \ ['n',     'J',            '<Plug>Markdont_JoinTwoLines'],
                \ ['nv',    '>',            '<Plug>Markdont_IncreaseIndent'],
                \ ['nv',    '<',            '<Plug>Markdont_DecreaseIndent'],
                \ ['nv',    'tj',           '<Plug>Markdont_MoveToNextHeading'],
                \ ['i',     '<CR>',         '<Plug>Markdont_CarriageReturn'],
                \ ['n',     'o',            '<Plug>Markdont_o'],
                \ ['i',     '<BS>',         '<Plug>Markdont_Backspace'],
                \ ['i',     '<TAB>',        '<Plug>Markdont_Tab'],
                \ ['i',     '<S-TAB>',      '<Plug>markdont_ShiftTab'],
                \ ['n',     'cc',           '<Plug>Markdont_cc'],
                \ ['n',     'S',            '<Plug>Markdont_S'],
                \ ]

    for s:entry in s:mappings
        for s:mode in s:entry[0]
            if !hasmapto(s:entry[2], s:mode)
                execute s:mode . 'noremap <buffer> <silent> ' . s:entry[1] .' '. s:entry[2]
            endif
        endfor
    endfor
endif
