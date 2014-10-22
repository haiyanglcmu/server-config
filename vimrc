""""
" 加载、配置插件 plugins

" 加载外部配置文件
function! s:source_rc(path)
  execute 'source' fnameescape(expand('~/.vim/rc/' . a:path))
endfunction

if has('vim_starting')
  set nocp " 不兼容模式
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
call s:source_rc('neobundle.rc.vim')
call neobundle#end()

NeoBundleCheck

" 插件配置
call s:source_rc('plugins.rc.vim')
call neobundle#call_hook('on_source')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader="\\"
filetype plugin indent on

" 制表符与缩进
set smartindent
set tabstop=4     " how many cols a tab counts for
set shiftwidth=4  " how many cols is indented
set softtabstop=4 " how many cols when tab in insert mode
set expandtab     " hitting tab in insert mode produces spaces
set smarttab

" 显示空白字符
set list!
set listchars=tab:>-

" 编码，颜色，字体 encoding, colors, fonts
set enc=utf-8
set termencoding=utf-8
set fileencoding=utf-8 " 新建文件使用的编码
set fencs=ucs-bom,utf-8,chinese
set ambiwidth=single
set guifont=Literation\ Mono\ Powerline:h16

set t_Co=256
syntax enable
set background=light
colo solarized

set fileformats=unix,dos,mac
set history=700
set autoread " auto read when a file is changed from the outside
set backspace=indent,eol,start
set nobackup
set nowb
set noswapfile
set nu
set showcmd
set laststatus=2 " always show the status line
set display+=lastline " 不用 @ 填充
set wildmenu " 命令模式 tab 自动补全时显示菜单
set ruler
set showmatch " 显示匹配
set cmdheight=1 " 命令行高度
set mousemodel=popup " 鼠标右键弹出菜单
set nowrap
set guioptions+=b " 水平滚动条
set cursorline
set shell=/bin/bash
set hls
set is
set ignorecase
set smartcase
" exit visual mode with no delay
set timeoutlen=1000 ttimeoutlen=0

" hide buffer with unsaved changes instead of closing it
set hidden

if has("gui_running")
    set guioptions-=T
endif

" 滚屏设置
if !&scrolloff
    set scrolloff=4
endif

if has("autocmd")
    augroup vimrcEx
        au!

        autocmd FileType text setlocal textwidth=78 wrap linebreak

        " jump to the last known cursor position
        if has("autocmd")
            au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
        endif

        " indent by filetype
        au FileType python     setl ts=2 sw=2 sts=2 et
        au FileType javascript setl ts=2 sw=2 sts=2 et
        au FileType vim        setl ts=2 sw=2 sts=2 et
        au FileType html       setl ts=2 sw=2 sts=2 et
        au FileType css        setl ts=2 sw=2 sts=2 et
        au FileType scss        setl ts=2 sw=2 sts=2 et
        au FileType sh         setl ts=2 sw=2 sts=2 et
    augroup END
endif

""""
" 快速移动

nnoremap <Down>   5<C-e>
nnoremap <Up>     5<C-y>
nnoremap <C-j> 5j
nnoremap <C-k> 5k

" 移动到屏幕最后一行
function! GotoLastLineOnScreen()
    let lines_to_move=winheight(0)-winline()
    execute 'normal ' . lines_to_move . 'j'
endfunction

" 移动到屏幕第一行
function! GotoFirstLineOnScreen()
    let lines_to_move=winline()-1
    execute 'normal ' . lines_to_move . 'k'
endfunction

nnoremap <leader>j :call GotoLastLineOnScreen()<cr>
nnoremap <leader>k :call GotoFirstLineOnScreen()<cr>

nnoremap k gk
nnoremap j gj

" 删除上下行
nmap <c-u> mmkdd`m
nmap <c-d> mmjdd`m

""""
" copy and paste

" 将复制的内容粘贴到新行
nnoremap gp $mmp`ma<cr><esc>^
nmap gP gpmmkddp`m

" 复制
nnoremap <leader>yy "*yy " 系统剪贴板
vnoremap <leader>y "*y
nnoremap Y y$            " 复制到行尾
vnoremap y y`]

" 粘贴
nnoremap p         p`]
nnoremap P         P`]
nnoremap <leader>p "*p`]
nnoremap <leader>P "*P`]
vnoremap <leader>p "*p`]
imap     <c-v>     <esc>pa

" 可视模式下通过粘贴进行替换
vnoremap p "0p

" 删除 delete
nnoremap <leader>dd "*dd:w<cr>
vnoremap <leader>d "*d
" remove instead of cut
nnoremap <leader>rr "_dd
nnoremap <leader>rl "_S<esc>

""""
" 查找替换

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" 替换所有
function! ReplaceAll()
    let pattern=input("输入替换表达式：")
    exec ':%s/'.pattern.'/g'
endfunction

nnoremap <leader>ra :call ReplaceAll()<cr>

" count matches
nnoremap gn :%s///gn<cr>

" 取消搜索结果高亮
noremap <silent> gl :<c-u>nohlsearch<cr><c-l>:w<cr>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
            \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
            \gV:call setreg('"', old_reg, old_regtype)<CR>

""""
" 插入模式 insert mode

" start new undo
inoremap <cr> <c-g>u<cr>

" 插入模式下前后移动
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-b> <esc>I
inoremap <C-e> <esc>A

""""
" 编辑 edit

" 删除trailing spaces
nnoremap <leader>$ :s/\s\+$//<cr>$:w<cr>

" 用寄存器内容替换当前单词, replace word
" nnoremap <leader>rp ""

" change content between the first pair of parentheses
nnoremap ci( ^f(ci(

" 防止按 o 换行时自动添加注释
nnoremap o o<esc>"_S<space><c-h><esc>:w<cr>a
nnoremap O O<esc>"_S<space><c-h><esc>:w<cr>a

" 添加空行
nmap gO mmO<esc>`m
nmap go mmo<esc>`m

" 上下添加空行
nnoremap g<space> mmO<esc>`mo<esc>`m

" 应用宏，然后移动到下一行
nnoremap <c-a> @qj

" 换行不自动添加注释
set formatoptions-=or

" format all
map <leader>fa mmggVG=`m

" 断行
nnoremap <leader><cr> Do<esc>p^==

" 添加空格并移动到下一个字符
nnoremap <leader><space> a<space><esc>l

" 快速保存、关闭窗口
nmap <leader><leader> :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :tabclose<cr>
nnoremap <leader>a :qa<cr>

" 可视模式下移动选中的文本
vnoremap < <gv
vnoremap > >gv

" 局部变量重命名
function! Refactor()
    call inputsave()
    let @z=input("new name: ")
    call inputrestore()
endfunction

" rename
nmap <leader>rn "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x

""""
" splits, tabs, buffers

" splits
nnoremap <Leader>swh :topleft  vsp<cr>
nnoremap <Leader>swl :botright vsp<cr>
nnoremap <Leader>swj :botright sp<cr>
nnoremap <Leader>swk :topleft  sp<cr>

nnoremap <Leader>sh  :leftabove  vsp<cr>
nnoremap <Leader>sl  :rightbelow vsp<cr>
nnoremap <Leader>sj  :rightbelow  sp<cr>
nnoremap <Leader>sk  :leftabove   sp<cr>

" 在右侧打开
set splitright

" 切换窗口
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <C-Down> <c-w>j
nnoremap <C-Up> <c-w>k

" switching buffers
nmap <Left>  :bp<cr>
nmap <Right> :bn<cr>
vmap <Left>  <esc>:bp<cr>
vmap <Right> <esc>:bn<cr>

" 将窗口移动到标签页
function! MoveToPrevTab()
    "there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif
    "preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() != 1
        close!
        if l:tab_nr == tabpagenr('$')
            tabprev
        endif
        vsp
    else
        close!
        exe "0tabnew"
    endif
    "opening current buffer in new window
    exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
    " there is only one window
    if tabpagenr('$') == 1 && winnr('$') == 1
        return
    endif
    " preparing new window
    let l:tab_nr = tabpagenr('$')
    let l:cur_buf = bufnr('%')
    if tabpagenr() < tab_nr
        close!
        if l:tab_nr == tabpagenr('$')
            tabnext
        endif
        vsp
    else
        close!
        tabnew
    endif
    " opening current buffer in new window
    exe "b".l:cur_buf
endfunc

nnoremap <silent> <leader>tp :call MoveToPrevTab()<CR>
nnoremap <silent> <leader>tn :call MoveToNextTab()<CR>

" 移动标签页
function! MoveTab(direction)
    if a:direction == 0
        let pos = tabpagenr() - 2
        if pos < 0
            let l:position = 0
        else
            let l:position = pos
        endif
    elseif a:direction == 1
        let l:position = tabpagenr()
    endif
    exec 'tabm ' . l:position
endfunction

nnoremap <silent> <c-left> :call MoveTab(0) <cr>
nnoremap <silent> <c-right> :call MoveTab(1) <cr>

" 改变 split 大小
nnoremap - 5<c-w><
nnoremap = 5<c-w>>
nnoremap _ 5<c-w>-
nnoremap + 5<c-w>+

""""
" 其他

" Disable Ex mdoe
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

set noimdisable
autocmd! InsertLeave * set imdisable|set iminsert=0
autocmd! InsertEnter * set noimdisable|set iminsert=0


autocmd BufRead,BufNewFile *.mkd,*.markdown,*.md,*.mdown,*.mkdn
  \ setlocal wrap linebreak filetype=markdown autoindent formatoptions=tcroqn2 comments=n:>
