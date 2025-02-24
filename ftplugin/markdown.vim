nnoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_SetBullet <cmd>call markdont#set_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_SetBullet :call markdont#set_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
inoremap <buffer> <silent> <Plug>Markdont_RemoveBullet <cmd>call markdont#remove_bullet()<CR>
vnoremap <buffer> <silent> <Plug>Markdont_RemoveBullet :call markdont#remove_bullet()<CR>gv

nnoremap <buffer> <silent> <Plug>Markdont_MoveCursorToLineStart <cmd>call markdont#move_cursor_to_line_start(1)<CR>
vnoremap <buffer> <silent> <Plug>Markdont_MoveCursorToLineStart <cmd>call markdont#move_cursor_to_line_start(1)<CR>

inoremap <buffer> <silent> <Plug>Markdont_EditFromLineStart I<cmd>call markdont#move_cursor_to_line_start(0)<CR>

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
    nmap <buffer> <silent> <leader>b  <Plug>Markdont_SetBullet
    imap <buffer> <silent> <leader>b  <Plug>Markdont_SetBullet
    vmap <buffer> <silent> <leader>b  <Plug>Markdont_SetBullet

    nmap <buffer> <silent> <leader>B  <Plug>Markdont_RemoveBullet
    imap <buffer> <silent> <leader>B  <Plug>Markdont_RemoveBullet
    vmap <buffer> <silent> <leader>B  <Plug>Markdont_RemoveBullet

    inoremap <buffer> <silent> <CR> <C-r>=markdont#carriage_return()<CR>

    nnoremap <buffer> <silent> o A<C-r>=markdont#carriage_return()<CR>

    nmap <buffer> <silent> ^ <Plug>Markdont_MoveCursorToLineStart
    vmap <buffer> <silent> ^ <Plug>Markdont_MoveCursorToLineStart

    nnoremap <buffer> <silent> I <Plug>Markdont_EditFromLineStart
    nnoremap <buffer> <silent> J <Plug>Markdont_JoinTwoLines

    nnoremap <buffer> <silent> > <Plug>Markdont_IncreaseIndent
    nnoremap <buffer> <silent> < <Plug>Markdont_DecreaseIndent
    vnoremap <buffer> <silent> > <Plug>Markdont_IncreaseIndent
    vnoremap <buffer> <silent> < <Plug>Markdont_DecreaseIndent

    inoremap <buffer> <silent> <TAB> <C-r>=markdont#tab()<CR>
    inoremap <buffer> <silent> <S-TAB> <C-\><C-o>:call markdont#shift_tab()<CR>

    nmap <buffer> <silent> tj <Plug>Markdont_MoveToNextHeading
    vmap <buffer> <silent> tj <Plug>Markdont_MoveToNextHeading

    nmap <buffer> <silent> tk <Plug>Markdont_MoveToPrevHeading
    vmap <buffer> <silent> tk <Plug>Markdont_MoveToPrevHeading

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
