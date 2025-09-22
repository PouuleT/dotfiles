setlocal noexpandtab     " use tabs instead of spaces
setlocal shiftwidth=4    " autoindent with 4 tabs
setlocal softtabstop=4   " 4 spaces to represent a tab
setlocal tabstop=4       " use 4 spaces

" ALE
let b:ale_linters = ['gopls', 'gofmt', 'go build', 'go vet', 'staticcheck']
let b:ale_fixers = ['gopls', 'gofmt', 'golint']
let b:ale_go_golangci_lint_options = "--exclude-use-default=false -E godot -E revive -E gocritic"
let b:ale_go_golangci_lint_package = 1
let b:ale_go_staticcheck_options = '-checks all,-ST1000'
let g:ale_go_gopls_init_options = {'buildFlags': ['-tags', 'bpf']}

" Go vim - :help go-settings
let b:go_fmt_command = "gofmt"
let b:go_play_open_browser = 0
let b:go_highlight_functions = 1
let b:go_highlight_methods = 1
let b:go_highlight_structs = 1
let b:go_build_tags = "bpf"
nmap tgd <Plug>(go-def-tab)
