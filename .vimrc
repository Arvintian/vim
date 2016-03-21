"自动缩进的时候空格为4
set sw=4
"TAB宽度为4
set ts=4
"编辑时所有TAB替换为空格
set et
"为C程序提供缩进
set smartindent
"不在单词中间换行
set lbr
"打开断行模块对亚洲语言支持
set fo+=mB
"显示括号匹配情况
set sm
"set wildmenu
"当右键单击窗口弹出快捷菜单
set mousemodel=popup
"set selection=inclusive
"可以在buffer任何地方使用鼠标
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"启动时不显示那个援助乌干达儿童的提示
set shortmess=atI
"去掉有关VI一致性模式
set nocompatible

"打开高亮显示
syntax on
"行显示
set cul
"用浅色高亮当前行
autocmd InsertEnter * se cul
"列显示
set cuc
"设置配色背景主题
"color ron
color desert
"color torte
"显示标尺
set ruler
"输入的命令显示出来
set showcmd
"光标移动到顶部和底部时保持3行距离
set scrolloff=3
"启动时显示状态行（1），始终显示状态行（2）
set laststatus=2
"设置状态行内容
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\%H:%M\")}

"自动缩进
set autoindent
"C风格的缩进
set cindent
"TAB建的宽度
set tabstop=4
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"在行和段的开始处使用制表符
set smarttab
"显示行号
set number
"历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
"命令行高度默认为1
set cmdheight=2
"侦测文件类型
"filetype on
"载入文件类型插件
filetype plugin on
"为特定的文件类型提供缩进
filetype indent on
"保存全局变量
set viminfo+=!
"带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
"在处理未保存或只读文件的时候弹出确认
set confirm
"关闭错误滴滴声
set noerrorbells
"不要备份文件
set nobackup
set noswapfile
"在被分割的窗口间显示空白
set fillchars=vert:\ ,stl:\ ,stlnc:\
"使回车键正常处理indent,eol,start等
set backspace=2
"自动保存
set autowrite
"设置当文件被改动时自动载入
set autoread
"set foldmethod=indent
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"C，C++按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "!time ./%<"
    elseif &filetype == "cpp"
        exec "!g++ % -o %<"
        exec "!time ./%<"
        endif
endfunc

"自动跳转上次编辑位置
if has("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif
"F3打开/关闭NERDtree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"全选复制，复制到“+”寄存器即系统粘贴板，若无则可能是没有装VIM图形界面所致
map <C-A> ggVG$"+y
"ctrl+w换工作窗口
map <C-w> <C-w>w
"ctrl+l Esc
imap <C-c> <Esc>O
imap <C-x> <Esc>
map <C-x> <Esc>

"Vundle a plug -in manager for Vim
set nocompatible   "be improved required
filetype off    "required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on
" YCM相关
" YCM配置路径
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 开启语法补全
let g:ycm_seed_identifiers_with_syntax=1
" 设置补全菜单，关闭预览窗空scratch
set completeopt=longest,menu
" 补全回车选中
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"

" 离开补全弹窗或者离开插入模式自动关闭scratch preview
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif


