syn match markdownConsoleShellCommandLine   /\v^\w+[>$#%❯➜].*$/ contains=markdownConsoleShellName,markdownConsoleShellSymbol
syn match markdownConsoleShellName          /\v^\w+%([>$#%❯➜])@=/ contained nextgroup=markdownConsoleShellPrompt
syn match markdownConsoleShellSymbol        /\v%(^\w+)@<=[>$#%❯➜] */ contained nextgroup=markdownConsoleShellCommand

syn match markdownConsoleShellCommand       /\v[^ ]+.*$/ contained contains=markdownConsoleShellCommandName,markdownConsoleShellCommandArguments
syn match markdownConsoleShellCommandName   /\v[^ ]+/ contained nextgroup=markdownConsoleShellCommandArguments

syn match markdownConsoleShellCommandArguments  /\v%([^ ]+)@<=.*$/ contained
            \ contains=
            \ markdownConsoleShellCommandSpace,
            \ markdownConsoleShellCommandNormalArgument,
            \ markdownConsoleShellCommandDashArgument,
            \ markdownConsoleShellCommandString

syn match markdownConsoleShellCommandSpace  /\v +/ contained nextgroup=markdownConsoleShellCommandNormalArgument,markdownConsoleShellCommandDashArgument,markdownConsoleShellCommandString

syn match markdownConsoleShellCommandNormalArgument     /\v[^-"' ][^ ]*/ contained contains=markdownConsoleShellCommandString nextgroup=markdownConsoleShellCommandSpace
syn match markdownConsoleShellCommandDashArgument       /\v-[^ ][^ ]+/ contained contains=markdownConsoleShellCommandString nextgroup=markdownConsoleShellCommandSpace
syn match markdownConsoleShellCommandDashDashArgument   /\v--[^ ][^ ]+/ contained contains=markdownConsoleShellCommandString nextgroup=markdownConsoleShellCommandSpace
syn region markdownConsoleShellCommandString        start=/"/ skip=/\\"/ end=/"/ contained nextgroup=markdownConsoleShellCommandSpace
syn region markdownConsoleShellCommandString        start=/'/ skip=/\\'/ end=/'/ contained nextgroup=markdownConsoleShellCommandSpace


hi markdownConsoleShellName                     ctermfg=99
hi markdownConsoleShellSymbol                   ctermfg=135
hi markdownConsoleShellCommandName              ctermfg=14
hi markdownConsoleShellCommandNormalArgument    ctermfg=NONE
hi markdownConsoleShellCommandDashArgument      ctermfg=10
hi markdownConsoleShellCommandDashDashArgument  ctermfg=208
hi markdownConsoleShellCommandString            ctermfg=208
