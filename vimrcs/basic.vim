
if(has("win32") || has("win64") || has("win95") || has("win16"))
    " source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" ------------------------------------------------------------------
" chinese
" ------------------------------------------------------------------
"set fenc=chinese
set fenc=utf-8
set encoding=utf-8
filetype plugin on
set fileencodings=utf-8,gbk,chinese,latin-1
if(has("win32") || has("win64") || has("win95") || has("win16"))
 set fileencoding=utf-8
else
 set fileencoding=utf-8
endif
"处理菜单及右键菜单乱码
if(has("win32") || has("win64") || has("win95") || has("win16"))
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif

"处理consle输出乱码
language messages zh_CN.utf-8
"中文乱码结束

" ------------------------------------------------------------------
" normal
" ------------------------------------------------------------------
"去掉vi的一致性"

"显示行号"
set number
" 隐藏滚动条"
set guioptions-=r
set guioptions-=L
set guioptions-=b
set guioptions-=m
set guioptions-=T
"隐藏顶部标签栏"
set showtabline=0

"set noshowmode "for echodoc show func document
set cmdheight=2 "for echodoc show func document

syntax on    "开启语法高亮"

"set wrap    "设置折行"
set nowrap    "设置不折行"
set fileformat=unix    "设置以unix的格式保存文件"
set cindent        "设置C样式的缩进格式"
set tabstop=4    "设置table长度"
set shiftwidth=4        "同上"
set showmatch    "显示匹配的括号"
set scrolloff=5        "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
"set fenc=utf-8      "文件编码"
set backspace=2
set mouse=a        "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase        "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set expandtab        "不允许扩展tab"
set whichwrap+=<,>,h,l
set autoread
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

let mapleader="\<Space>"

set clipboard=unnamed

set completeopt=longest,menu "补全菜单的样式

" ------------------------------------------------------------------
" color
" ------------------------------------------------------------------
if has("gui_running")
  set guioptions-=T
  set background=dark
  set t_Co=256
  set background=dark
  colorscheme evening
  set nu
else
  colorscheme evening
  " colorscheme zellner
  set background=dark
  set nonu
endif

set lines=42 columns=128

"------------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
"------------------------------------------------------------------------------
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:iswindows = 0
endif

"------------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
"------------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"------------------------------------------------------------------------------
"  font
"------------------------------------------------------------------------------
let font_name = ""
if(has("win32") || has("win64") || has("win95") || has("win16"))
	set guifont=Lucida_Console:h12:cANSI
	let font_name = "Lucida_Console"
" else
" 	set guifont=Consolas:h11:cANSI " this is the default visual studio font
" 	let font_name = "Consolas"
endif

" ------------------------------------------------------------------
" splite windows
" ------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ------------------------------------------------------------------
" change backup dir
" ------------------------------------------------------------------
set backup " make backup file and leave it around
"UNUSED: set backupdir=%tmp%
"UNUSED: set directory=.,%tmp%

" setup back and swap directory
let data_dir = $HOME.'/.data/'
let backup_dir = data_dir . 'backup'
let swap_dir = data_dir . 'swap'
let undo_dir = data_dir . 'undo'
if finddir(data_dir) == ''
    silent call mkdir(data_dir)
endif
if finddir(backup_dir) == ''
    silent call mkdir(backup_dir)
endif
if finddir(swap_dir) == ''
    silent call mkdir(swap_dir)
endif
if finddir(undo_dir) == ''
    silent call mkdir(undo_dir)
endif
set backupdir=$HOME/.data/backup " where to put backup file
set directory=$HOME/.data/swap " where to put swap file
set undodir =$HOME/.data/undo "where to put undo file
unlet data_dir
unlet backup_dir
unlet swap_dir
unlet undo_dir

" ------------------------------------------------------------------
"  Command-line editing
" ------------------------------------------------------------------
:cnoremap <C-A> <Home>
:cnoremap <C-F> <Right>
:cnoremap <C-B> <Left>
:cnoremap <C-S> <S-Left>
:cnoremap <C-G> <S-Right>
