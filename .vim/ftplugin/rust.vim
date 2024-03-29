nnoremap gd :ALEGoToDefinition <CR>
nnoremap gs :ALEGoToDefinitionInVSplit <CR>
nnoremap K :ALEHover <CR>

" ALE
set omnifunc=ale#completion#OmniFunc
let b:ale_linters = ['cargo', 'rls']
let b:ale_fixers = ['rustfmt']
let b:ale_rust_cargo_use_clippy = executable('cargo-clippy')
let b:ale_rust_rls_config = {'rust': {'clippy_preference': 'on'}}

" Rust vim
let g:rustfmt_autosave = 1
let g:racer_cmd = "~/.cargo/bin/racer"

augroup Racer
  autocmd!
  autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
  autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
  autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
  autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

