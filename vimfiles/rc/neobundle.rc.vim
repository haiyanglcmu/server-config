function! IsMac()
  return (has('mac') || has('macunix') || has('gui_macvim') ||
         \   (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim', { 'insert'  : 1 }

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'bling/vim-airline'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

if IsMac()
  NeoBundleLazy 'rcmdnk/vim-markdown', {
      \ 'filetypes' : 'markdown'
      \ }
  NeoBundleLazy 'kannokanno/previm', {
      \ 'filetypes' : ['markdown', 'rst']
      \ }
endif

NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'

NeoBundle 'kien/ctrlp.vim'

NeoBundleLazy 'bkad/CamelCaseMotion', {
      \ 'mappings' : '<Plug>',
      \ }

NeoBundle 'vim-scripts/vim-auto-save'
NeoBundle 'vim-scripts/bufkill.vim/'
NeoBundle 'altercation/vim-colors-solarized'
