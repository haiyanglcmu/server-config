"---------------------------------------------------------------------------
" neocomplete.vim
"

let g:neocomplete#disable_auto_complete = 0

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case = 1

" Use fuzzy completion.
let g:neocomplete#enable_fuzzy_completion = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Set auto completion length.
let g:neocomplete#auto_completion_start_length = 2
" Set manual completion length.
let g:neocomplete#manual_completion_start_length = 0
" Set minimum keyword length.
let g:neocomplete#min_keyword_length = 3

" For auto select.
let g:neocomplete#enable_complete_select = 1
try
  let completeopt_save = &completeopt
  set completeopt+=noinsert,noselect
catch
  let g:neocomplete#enable_complete_select = 0
finally
  let &completeopt = completeopt_save
endtry
let g:neocomplete#enable_auto_select = 0
let g:neocomplete#enable_refresh_always = 0
let g:neocomplete#enable_cursor_hold_i = 0

" Test.
let g:neocomplete#enable_omni_fallback = 1

let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $CACHE.'/vimshell/command-history',
      \ 'java' : '~/.vim/dict/java.dict',
      \ 'ruby' : '~/.vim/dict/ruby.dict',
      \ 'scala' : '~/.vim/dict/scala.dict',
      \ }

let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#disable_auto_select_buffer_name_pattern =
      \ '\[Command Line\]'
let g:neocomplete#max_list = 100
let g:neocomplete#force_overwrite_completefunc = 1
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#enable_auto_close_preview = 1

" let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'

let g:neocomplete#sources#omni#functions.go =
      \ 'gocomplete#Complete'

let g:neocomplete#sources#omni#input_patterns.php =
      \'\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" Disable omni auto completion for Java.
" let g:neocomplete#sources#omni#input_patterns.java = ''

" Define keyword pattern.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'
let g:neocomplete#keyword_patterns.rst =
      \ '\$\$\?\w*\|[[:alpha:]_.\\/~-][[:alnum:]_.\\/~-]*\|\d\+\%(\.\d\+\)\+'

let g:neocomplete#ignore_source_files = ['tag.vim']

let g:neocomplete#sources#vim#complete_functions = {
      \ 'Ref' : 'ref#complete',
      \ 'Unite' : 'unite#complete_source',
      \ 'VimShellExecute' :
      \      'vimshell#vimshell_execute_complete',
      \ 'VimShellInteractive' :
      \      'vimshell#vimshell_execute_complete',
      \ 'VimShellTerminal' :
      \      'vimshell#vimshell_execute_complete',
      \ 'VimShell' : 'vimshell#complete',
      \ 'VimFiler' : 'vimfiler#complete',
      \ 'Vinarise' : 'vinarise#complete',
      \}
" call neocomplete#custom#source('look', 'min_pattern_length', 4)
" call neocomplete#custom#source('_', 'sorters', [])

function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
