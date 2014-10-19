let mapleader="," 
filetype plugin indent on

" 制表符与缩进
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set autoindent
set cin
" 编码，颜色
set enc=utf-8 
set termencoding=utf-8
set fileencoding=utf-8 " 新建文件使用的编码
set fencs=ucs-bom,utf-8,chinese
set ambiwidth=single
set background=light
set t_Co=256
colo distinguished

set nocp " 不兼容模式
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

if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

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

        autocmd FileType text setlocal textwidth=78

        " jump to the last known cursor position
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

        " Wrap text file
        au BufNewFile,BufRead *.txt setlocal wrap
    augroup END
endif

""""
" 快速移动

nnoremap <Down> 2<C-e>
nnoremap <Up> 2<C-y>
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-e> 10b
nnoremap <c-y> 10w
vnoremap <c-j> 5j
vnoremap <c-k> 5k
vnoremap <c-e> 10b
vnoremap <c-y> 10w

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

" 内容整体移动
nmap <c-d> gO
nmap <c-u> mmkdd`m

" move to end in insert mode
inoremap <c-l> <Esc>A

""""
" 寄存器使用

" 复制
nnoremap <leader>yy "*yy " 系统剪贴板
vnoremap <leader>y "*y
nnoremap Y y$            " 复制到行尾
vnoremap y y`]

" 粘贴
nnoremap <leader>p "*p`]
nnoremap <leader>P "*P`]
nnoremap p p`]
nnoremap P P`]
vnoremap <leader>p "*p`]
imap <c-v> <esc>pa

" 可视模式下通过粘贴进行替换
vnoremap p "0p

" 删除相当于剪切
nnoremap <leader>dd "*dd:w<cr>
vnoremap <leader>d "*d
nnoremap <leader>rr "_dd

""""
" 自动保存

" 重复一个动作后自动保存
nnoremap . .:w<cr>

" 退出插入模式自动保存
inoremap <c-[> <c-[>:w<cr>

" 删除一行自动保存
nnoremap dd dd:w<cr>

" 删除字符自动保存
nnoremap x x:w<cr>

" 撤销后自动保存
nnoremap u u:w<cr>

" 注释后自动保存
nnoremap gcc gcc:w<cr>
vnoremap gc gc:w<cr>

""""
" 查找替换

" 替换所有
function! ReplaceAll()
    let pattern=input("输入替换表达式：")
    exec ':%s/'.pattern.'/g'
endfunction

nnoremap <leader>ra :call ReplaceAll()<cr>

" count matches
nnoremap gn :%s///gn<cr>

" 取消搜索结果高亮
noremap <silent> gl :<c-u>nohlsearch<cr><c-l>

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
" 编辑

" 用寄存器内容替换当前单词, replace word
" nnoremap <leader>rp ""

" delete in insert mode
inoremap <c-h> <c-h>

" change content between the first pair of parentheses
nnoremap ci( ^f(ci(

" 添加空行
nmap gO mmO<esc>`m
nmap go mmo<esc>`m

" 上下添加空行
nnoremap g<space> mmO<esc>`mo<esc>`m

" 将复制的内容粘贴到新行
nnoremap gp $mmp`ma<cr><esc>^
nmap gP gpmmkddp`m

" 防止按 o 换行时自动添加注释
nnoremap o o<esc>"_S
nnoremap O O<esc>"_S

" 应用宏，然后移动到下一行
nnoremap <c-a> @qj

" 换行不自动添加注释
set formatoptions-=or

" 编辑模式下回车开始新的 undo
" 防止自动加注释
inoremap <cr> <c-g>u<cr>

" format all
map <leader>fa mmggVG=`m

" 断行
nnoremap <leader><cr> Do<esc>p^==

" 添加空格并移动到下一个字符 
nnoremap <leader><space> a<space><esc>l

" 快速保存、关闭窗口
nmap <leader><leader> :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :tabnew<cr>:tabprevious<cr>:tabclose<cr>:q<cr>

" 可视模式下移动选中的文本
vnoremap < <gv
vnoremap > >gv

" 局部变量重命名
function! Refactor()
    call inputsave()
    let @z=input("new name: ")
    call inputrestore()
endfunction

nmap <leader>rr "zyiw:call Refactor()<cr>mx:silent! norm gd<cr>[{V%:s/<C-R>//<c-r>z/g<cr>`x


""""
" 窗口和标签页 

" 在右侧打开 
set splitright

" 切换窗口 
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" 打开标签页
map <leader>e :tabedit 
map <leader>n :tabnew<cr>

" 切换标签页 switching tabs
nmap <Left> :tabprevious<cr>
nmap <Right> :tabnext<cr>
vmap <Left> <esc>:tabprevious<cr>
vmap <Right> <esc>:tabnext<cr>

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

""""
" 其他

" Disable Ex mdoe
map Q <Nop>

" Disable K looking stuff up
map K <Nop>