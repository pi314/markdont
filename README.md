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

*   Bullet / Ordered list items

    -   `<leader>b` generates a new bullet list item
        +   `<leader>b` again switch it between bullet and ordered list item

    -   `<leader>B` removes the bullet list marker / ordered list marker

    -   Bullets list markers change with indent
    -   Ordered list markers automatically follows the number of previous marker

    -   `<CR>` automatically generates a new list item
    -   When cursor is on an list item, `o` creates a new item under it

*   Task list items (checkboxes) (WIP)

*   Indenting

    -   `<`, `>` changes the indent

    -   `<TAB>`, `<S-TAB>` changes the indent
        +   If cursor is on a list item, it indents/unindents the item
        +   If cursor is on a heading, it increases/decreases the heading level

*   Editing support

    -   `^` moves cursor to a logical line start
        +   `^` again toggles cursor between non-black position and logical line start

    -   `I` moves cursor to a logical line start and enter insert mode
    -   `J` joins two line without keeping second line's bullet
    -   `cc` and `S` keeps the list mark or heading if present

* Links (WIP)
