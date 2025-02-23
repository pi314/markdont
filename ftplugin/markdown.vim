nnoremap <buffer> <silent> <leader>b  <cmd>call markdont#set_bullet()<CR>
vnoremap <buffer> <silent> <leader>b :call markdont#set_bullet()<CR>gv
inoremap <buffer> <silent> <leader>b  <cmd>call markdont#set_bullet()<CR>

inoremap <buffer> <silent> <leader>B  <cmd>call markdont#remove_bullet()<CR>
vnoremap <buffer> <silent> <leader>B  :call markdont#remove_bullet()<CR>gv
nnoremap <buffer> <silent> <leader>B  <cmd>call markdont#remove_bullet()<CR>

inoremap <buffer> <silent> <CR> <C-r>=markdont#carriage_return()<CR>
nnoremap <buffer> <silent> o A<C-r>=markdont#carriage_return()<CR>

nnoremap <buffer> <silent> ^ <cmd>call markdont#move_cursor_to_line_start(1)<CR>
vnoremap <buffer> <silent> ^ <cmd>call markdont#move_cursor_to_line_start(1)<CR>
nnoremap <buffer> <silent> I I<cmd>call markdont#move_cursor_to_line_start(0)<CR>
nnoremap <buffer> <silent> J :call markdont#join_two_lines()<CR>

nnoremap <buffer> <silent> > <cmd>call markdont#increase_indent()<CR>
nnoremap <buffer> <silent> < <cmd>call markdont#decrease_indent()<CR>
vnoremap <buffer> <silent> > :call markdont#increase_indent()<CR>gv
vnoremap <buffer> <silent> < :call markdont#decrease_indent()<CR>gv

inoremap <buffer> <silent> <TAB> <C-r>=markdont#tab()<CR>
inoremap <buffer> <silent> <S-TAB> <C-\><C-o>:call markdont#shift_tab()<CR>

nnoremap <buffer> <silent> tj <cmd>call markdont#move_cursor_to_next_heading()<CR>
vnoremap <buffer> <silent> tj <cmd>call markdont#move_cursor_to_next_heading()<CR>
nnoremap <buffer> <silent> tk <cmd>call markdont#move_cursor_to_prev_heading()<CR>
vnoremap <buffer> <silent> tk <cmd>call markdont#move_cursor_to_prev_heading()<CR>

nnoremap <buffer> <silent> cc <cmd>call markdont#cc()<CR>A
nnoremap <buffer> <silent> S <cmd>call markdont#cc()<CR>A
