nnoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_SetBullet :call markdont#set_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet :call markdont#remove_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_ToggleHeading <cmd>call markdont#toggle_heading()<CR>
inoremap <buffer> <silent> <Plug>Markdont_ToggleHeading <cmd>call markdont#toggle_heading()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_ToggleHeading :call markdont#toggle_heading()<CR>gv

inoremap <buffer> <silent> <Plug>Markdont_CarriageReturn <cmd>call markdont#carriage_return()<CR>
nnoremap <buffer> <silent> <Plug>Markdont_o              A<cmd>call markdont#carriage_return()<CR>

inoremap <buffer> <silent> <Plug>Markdont_Backspace <C-r>=markdont#backspace()<CR>

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


if !exists('g:markdont_disable_default_key_mappings') || !g:markdont_disable_default_key_mappings
    nnoremap <buffer> <silent> <leader>b <Plug>Markdont_SetBullet
    inoremap <buffer> <silent> <leader>b <Plug>Markdont_SetBullet
    vnoremap <buffer> <silent> <leader>b <Plug>Markdont_SetBullet

    nnoremap <buffer> <silent> <leader>B <Plug>Markdont_RemoveBullet
    inoremap <buffer> <silent> <leader>B <Plug>Markdont_RemoveBullet
    vnoremap <buffer> <silent> <leader>B <Plug>Markdont_RemoveBullet

    nnoremap <buffer> <silent> <nowait> <leader>t <Plug>Markdont_ToggleHeading
    inoremap <buffer> <silent> <nowait> <leader>t <Plug>Markdont_ToggleHeading
    vnoremap <buffer> <silent> <nowait> <leader>t <Plug>Markdont_ToggleHeading

    inoremap <buffer> <silent> <CR> <Plug>Markdont_CarriageReturn
    nnoremap <buffer> <silent> o    <Plug>Markdont_o

    inoremap <buffer> <silent> <BS> <Plug>Markdont_Backspace

    nnoremap <buffer> <silent> ^ <Plug>Markdont_MoveCursorToLineStart
    vnoremap <buffer> <silent> ^ <Plug>Markdont_MoveCursorToLineStart

    nnoremap <buffer> <silent> I <Plug>Markdont_EditFromLineStart
    nnoremap <buffer> <silent> J <Plug>Markdont_JoinTwoLines

    nnoremap <buffer> <silent> > <Plug>Markdont_IncreaseIndent
    nnoremap <buffer> <silent> < <Plug>Markdont_DecreaseIndent
    vnoremap <buffer> <silent> > <Plug>Markdont_IncreaseIndent
    vnoremap <buffer> <silent> < <Plug>Markdont_DecreaseIndent

    inoremap <buffer> <silent> <TAB> <C-r>=markdont#tab()<CR>
    inoremap <buffer> <silent> <S-TAB> <C-\><C-o>:call markdont#shift_tab()<CR>

    nnoremap <buffer> <silent> tj <Plug>Markdont_MoveToNextHeading
    vnoremap <buffer> <silent> tj <Plug>Markdont_MoveToNextHeading

    nnoremap <buffer> <silent> tk <Plug>Markdont_MoveToPrevHeading
    vnoremap <buffer> <silent> tk <Plug>Markdont_MoveToPrevHeading

    nnoremap <buffer> <silent> cc <cmd>call markdont#cc()<CR>A
    nnoremap <buffer> <silent> S <cmd>call markdont#cc()<CR>A
endif


if exists('g:markdont_disable_default_key_mappings') && g:markdont_disable_default_key_mappings
    nunmap <buffer> <leader>b
    iunmap <buffer> <leader>b
    vunmap <buffer> <leader>b

    nunmap <buffer> <leader>B
    iunmap <buffer> <leader>B
    vunmap <buffer> <leader>B

    nunmap <buffer> <leader>t
    iunmap <buffer> <leader>t
    vunmap <buffer> <leader>t

    iunmap <buffer> <CR>

    nunmap <buffer> o

    nunmap <buffer> ^
    vunmap <buffer> ^

    nunmap <buffer> I
    nunmap <buffer> J

    nunmap <buffer> >
    nunmap <buffer> <
    vunmap <buffer> >
    vunmap <buffer> <

    iunmap <buffer> <TAB>
    iunmap <buffer> <S-TAB>

    nunmap <buffer> tj
    vunmap <buffer> tj

    nunmap <buffer> tk
    vunmap <buffer> tk

    nunmap <buffer> cc
    nunmap <buffer> S
endif
