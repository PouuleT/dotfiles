setlocal noexpandtab     " use tabs instead of spaces
setlocal shiftwidth=4    " autoindent with 4 tabs
setlocal softtabstop=4   " 4 spaces to represent a tab
setlocal tabstop=4       " use 4 spaces

" ALE
let b:ale_linters = ['go build', 'gofmt', 'golint', 'go vet']

" Go vim - :help go-settings
let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
nmap tgd <Plug>(go-def-tab)
