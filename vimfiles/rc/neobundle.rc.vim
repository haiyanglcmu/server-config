function! IsMac()
  return (has('mac') || has('macunix') || has('gui_macvim') ||
         \   (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make',
      \     'linux' : 'make',
      \     'unix' : 'gmake',
      \    },
      \ }

" NeoBundle 'Shougo/neosnippet.vim'
" NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'Shougo/neocomplete.vim', { 'insert'  : 1 }

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
NeoBundle 'walm/jshint.vim'
