source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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
"******************************************************************
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:/Vim/vimfiles/bundle/vundle
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin   'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


"--------------------
" Code completions
" -------------------
Plugin  'mattn/emmet-vim'   "html 增强插件 
"-----python 增强
"    Completion <C-Space>
"    Goto assignments <leader>g (typical goto function)
"    Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
"    Show Documentation/Pydoc K (shows a popup with assignments)
"    Renaming <leader>r
"    Usages <leader>n (shows all the usages of a name)
"    Open module, e.g. :Pyimport os (opens the os module)
"---------
Plugin  'davidhalter/jedi-vim'  "python增强

Plugin 'ervandew/supertab'    "super tab tab 补全

"-----------------
"--snippets  "模板支持 如 输入for <tab>出现....
"------------------
Plugin  'MarcWeber/vim-addon-mw-utils' "应用
Plugin  'tomtom/tlib_vim'  "应用
Plugin  'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

"----------------------
" Coding
" ---------------------
Plugin  'Yggdroot/indentLine' "缩进对其线
Plugin  'tell-k/vim-autopep8' "automatically formats Python code to conform to the PEP 8 style guide
Plugin  'godlygeek/tabular'  " 输入tabular /, 则以，为分隔符
Plugin  'plasticboy/vim-markdown' "markdown 支持
Plugin  'vim-scripts/a.vim'   "头文件跳转  :A or <leader>is  <leader>ih

Plugin  'vim-scripts/indentpython.vim' "帮组python格式化代码缩进。

Plugin  'scrooloose/syntastic'  "检查错误

Plugin  'nvie/vim-flake8' "python 标准检查插件

"Plugin  'vim-scripts/taglist.vim'  "tag支持 <leader>tl

Plugin  'majutsushi/tagbar'   "tagbar

Plugin  'jmcantrell/vim-virtualenv' "python virtual 支持

Plugin 'tpope/vim-commentary' "快速注释 gc gcc

Plugin 'DoxygenToolkit.vim'  "生成doxygen风格注释

"-----------------
" Fast navigation
"-----------------
Plugin 'easymotion/vim-easymotion'  "快速移动 使用<leader><leader>开头
"Plugin 'Lokaltog/vim-easymotion'
Plugin 'derekwyatt/vim-fswitch' "头文件和文件切换 <leader>sw
"--------------
" IDE features
"--------------
Plugin  'tpope/vim-fugitive' "git 支持
Plugin  'bling/vim-airline' "状态栏
Plugin  'fholgado/minibufexpl.vim'  "minibuf
Plugin  'kien/ctrlp.vim' "c-p后调出窗口快速跳转文件及buf
Plugin  'scrooloose/nerdtree' "文件树查看 <leader>nt F2
Plugin  'terryma/vim-multiple-cursors'  "多光标操作 选中之后c-n  全选中c-n 则为选中头  vip为全选
Plugin  'tpope/vim-surround'       "surround cs ds....
Plugin  'mbbill/undotree'         "undo  操作
"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
Plugin '2072/PHP-Indenting-for-VIm' "官方php缩进
"Bundle 'tpope/vim-rails'
Plugin 'lepture/vim-jinja'  "jinja支持
"Bundle 'digitaltoad/vim-jade'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" ------------------------------------------------------------------
" chinese
" ------------------------------------------------------------------
"set fenc=chinese
set fenc=utf-8
set encoding=utf-8
filetype plugin on
set fileencodings=utf-8,gbk,chinese,latin-1
if has("win32")
 set fileencoding=utf-8
else
 set fileencoding=utf-8
endif
"处理菜单及右键菜单乱码
 source $VIMRUNTIME/delmenu.vim
 source $VIMRUNTIME/menu.vim

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
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
"set guifont=Monaco:h13
"set guifont=Lucida_Console:h10:cANSI

let font_name = ""
if getfontname("Lucida_Console") != ""
	set guifont=Lucida_Console:h12:cANSI
	let font_name = "Lucida_Console"
elseif getfontname( "Bitstream_Vera_Sans_Mono" ) != ""
	set guifont=Bitstream_Vera_Sans_Mono:h12:cANSI
	let font_name = "Bitstream_Vera_Sans_Mono"
elseif getfontname( "Consolas" ) != ""
	set guifont=Consolas:h11:cANSI " this is the default visual studio font
	let font_name = "Consolas"
else
	set guifont=Lucida_Console:h12:cANSI
	let font_name = "Lucida_Console"
endif
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
set noexpandtab        "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

let mapleader=','
let g:Powerline_symbols='unicode'

set clipboard=unnamed
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
  colorscheme zellner
  set background=dark

  set nonu
endif

set lines=42 columns=128

" ------------------------------------------------------------------
" splite windows
" ------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ------------------------------------------------------------------
" python
" ------------------------------------------------------------------
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/



let python_highlight_all=1

" ------------------------------------------------------------------
" md txt tmp
" ------------------------------------------------------------------
au BufNewFile,BufRead *.txt,*.md,*.tmp
\ set wrap    "设置折行"

" ------------------------------------------------------------------
" quick run
" ------------------------------------------------------------------
map <F5> :call CompileRunGcc()<CR>
map <m-m> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec " ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
         call RunPython()
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc


function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
" -----------------------------------------------
" fast key
" -----------------------------------------------

nmap <leader>w :w!<cr>
nmap <leader>z :bp!<cr>
nmap <leader>x :bn!<cr>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" programming related
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <leader>ts :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <leader>sw :FSHere <CR>
" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bd%<cr>

map<leader>e :e! c:/vim/_vimrc<cr>
autocmd! bufwritepost _vimrc source c:/vim/_vimrc
map <S-F> <ESC>:%!astyle --style=ansi -U -p -f<CR>

" map for completion see :help ins-completion for whole completions
" search tags
inoremap <unique> <c-]> <C-X><C-]>
" search in current files, preview first. remove the original c-p
"inoremap <un<c-p> <C-X><C-P>ique>
map  <leader>bc :bot cw<cr>
map  <leader>f :vim /<c-r><c-w>/*.cpp *.h *.py<cr>
map  <C-F5> :vim /<c-r><c-w>/*.cpp *.h *.py <cr>

"  cscope
nmap <leader>csa :cs add cscope.out<CR>
nmap <leader>csr :!cscope -Rb<CR>
nmap <leader>csk :cs kill -1 <CR>
nmap <leader>cfa :cs find a <c-r><c-w> <CR>
nmap <leader>cfc :cs find c <c-r><c-w> <CR>
nmap <leader>cfd :cs find d <c-r><c-w> <CR>
nmap <leader>cfe :cs find e <c-r><c-w> <CR>
nmap <leader>cff :cs find f <c-r><c-w> <CR>
nmap <leader>cfg :cs find g <c-r><c-w> <CR>
nmap <leader>cfi :cs find i <c-r><c-w> <CR>
nmap <leader>cfs :cs find s <c-r><c-w> <CR>
nmap <leader>cft :cs find t <c-r><c-w> <CR>

nmap <C-'>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"  run python
autocmd BufNewFile,BufRead *.py nmap <leader>cp :w <cr>:!python %<cr>
autocmd BufNewFile,BufRead *.py nmap <F12> :w <cr>:!python %<cr>
"autocmd BufNewFile,BufRead *.py nmap <C-r> :w <cr>:!python %<cr>
autocmd BufNewFile,BufRead *.py nmap <m-r> :w <cr>:!python %<cr>

nnoremap <leader>u :UndotreeToggle<cr>
" ------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
map <leader>nt :NERDTree<CR>
let NERDTreeChDirMode=2
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$','\.git','\.svn']
"窗口大小"
let NERDTreeWinSize=25

"缩进指示线"
let g:indentLine_char='|'
let g:indentLine_enabled = 1



"--------------------------
"autopep8设置"
"----------------------------
let g:autopep8_disable_show_diff=1
"-------------------------------------------------------------------------------- 
"easy mothing
"-------------------------------------------------------------------------------- 
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

" ------------------------------------------------------------------
" taglist
" ------------------------------------------------------------------
"let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
"let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
"let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
"let Tlist_Ctags_Cmd='d:/tools/ctags.exe'  "设置ctags命令的位置
"let Tlist_WinWidth = 40
"nnoremap <leader>tl : Tlist<CR>        "设置关闭和打开taglist窗口的快捷键

" ----------------------------------------
" tagbar
" --------------------------------------------------
nnoremap <leader>tb :TagbarToggle<CR>        "设置关闭和打开tagbar窗口的快捷键
let g:tagbar_autofocus = 1

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
" tags
" ------------------------------------------------------------------

set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find 
set makeef=error.err " the errorfile for :make and :grep

" ------------------------------------------------------------------
" Desc: snipMate
" ------------------------------------------------------------------
:filetype plugin on
"------------------------------------------------------------ 
" arduino
"------------------------------------------------------------
au BufNewFile,BufRead *.ino set filetype=c

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Rhys"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /* */<LEFT><LEFT><LEFT>
"-----------------------------------------------------------------
