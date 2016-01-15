" if neobundle#tap('neocomplete.vim') "{{{
"   let g:neocomplete#enable_at_startup = 1
"   let neobundle#hooks.on_source =
"     \ '~/.vim/rc/plugins/neocomplete.rc.vim'
"   call neobundle#untap()
" endif "}}}

if neobundle#tap('vim-auto-save') "{{{
  let g:auto_save = 1
  " let g:auto_save_no_updatetime = 1
  let g:auto_save_silent = 1
  call neobundle#untap()
endif "}}}

" previm
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a "Google Chrome"'

" autopairs
let g:AutoPairsMapBS = 0

" ailine
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-markdown
let g:vim_markdown_folding_disabled=1

" ctrlp
let g:ctrlp_working_path_mode = 'ra'
