if neobundle#tap('neocomplete.vim') "{{{
  let g:neocomplete#enable_at_startup = 1
  let neobundle#hooks.on_source =
    \ '~/.vim/rc/plugins/neocomplete.rc.vim'
  call neobundle#untap()
endif "}}}
