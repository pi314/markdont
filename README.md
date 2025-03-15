# markdont.vim

A vim plugin derived from https://github.com/pi314/pi314.rst.vim for Markdown.


## Usage

### Mappings

To disable default mappings, set `g:markdont_disable_default_key_mappings` to `v:true`:

```vim
let g:markdont_disable_default_key_mappings = v:true
```

*   Headings (sections)

    -   `tj` / `tk` jumps down / up by one markdown section
        +   Both ATX headings and Setext headings count
        +   Heading level is not calculated, i.e. no sibliing heading jumps

    -   Default mappings:

        ```vim
        nnoremap tj <Plug>(MarkdontMoveToNextHeading)
        nnoremap tk <Plug>(MarkdontMoveToPrevHeading)
        vnoremap tj <Plug>(MarkdontMoveToNextHeading)
        vnoremap tk <Plug>(MarkdontMoveToPrevHeading)
        ```

*   Bullet / Ordered list items

    -   `<leader>b` generates a new bullet list item
        +   `<leader>b` again switch it between bullet and ordered list item

    -   `<leader>B` removes the bullet list marker / ordered list marker

    -   Bullets list markers change with indent
    -   Ordered list markers automatically follows the number of previous marker

    -   `<CR>` automatically generates a new list item
    -   When cursor is on an list item, `o` creates a new item under it

    -   Default mappings:

        ```vim
        nnoremap <leader>b <Plug>(MarkdontSetBullet)
        inoremap <leader>b <Plug>(MarkdontSetBullet)
        vnoremap <leader>b <Plug>(MarkdontSetBullet)
        nnoremap <leader>B <Plug>(MarkdontRemoveBullet)
        inoremap <leader>B <Plug>(MarkdontRemoveBullet)
        vnoremap <leader>B <Plug>(MarkdontRemoveBullet)
        ```

*   Task list items (checkboxes) (WIP)

*   Indenting

    -   `<`, `>` changes the indent

    -   `<TAB>`, `<S-TAB>` changes the indent
        +   If cursor is on a list item, it indents/unindents the item
        +   If cursor is on a heading, it increases/decreases the heading level

    -   Default mappings:

        ```vim
        nnoremap > <Plug>(MarkdontIncreaseIndent)
        vnoremap > <Plug>(MarkdontIncreaseIndent)
        nnoremap < <Plug>(MarkdontDecreaseIndent)
        vnoremap < <Plug>(MarkdontDecreaseIndent)
        ```

*   Editing support

    -   `^` moves cursor to a logical line start
        +   `^` again toggles cursor between non-black position and logical line start

    -   `I` moves cursor to a logical line start and enter insert mode
    -   `J` joins two line without keeping second line's bullet
    -   `cc` and `S` keeps the list marks or heading marks if present

    -   Default mappings:

        ```vim
        nnoremap ^  <Plug>(MarkdontMoveToLineStart)
        vnoremap ^  <Plug>(MarkdontMoveToLineStart)
        nnoremap I  <Plug>(MarkdontEditFromLineStart)
        nnoremap J  <Plug>(MarkdontJoinTwoLines)
        ```

*   Links

    -   [normal] `<leader>l` makes the word under cursor a link
    -   [visual] `<leader>l` makes selected text a link
    -   `<leader>L` removes the link and only keeps the text
    -   `clt` edits the link text if cursor is on a link object
    -   `cll` edits the link URL if cursor is on a link object

    -   Default mappings:

        ```vim
        nnoremap <leader>l <Plug>(MarkdontMakeLink)
        vnoremap <leader>l <Plug>(MarkdontMakeLink)
        nnoremap <leader>L <Plug>(MarkdontRemoveLink)

        nnoremap clt <Plug>(MarkdontEditLinkText)
        nnoremap cll <Plug>(MarkdontEditLinkLink)
        ```
