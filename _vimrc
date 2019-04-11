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

source c:/vim/plug.vim

call plug#begin('c:/plugged')

"------------
" common plugin
" -----------
Plug  'vim-scripts/mru.vim'
Plug  'jiangmiao/auto-pairs'
Plug  'vim-scripts/Mark--Karkat'
Plug  'liuchengxu/vim-which-key'
"--------------------
" Code completions
" -------------------
Plug  'mattn/emmet-vim'   "html 增强插件
Plug  'ervandew/supertab'    "super tab tab 补全
Plug  'vimwiki/vimwiki'
Plug  'mattn/calendar-vim'
"-----------------
"--snippets  "模板支持 如 输入for <tab>出现....
"------------------
Plug  'MarcWeber/vim-addon-mw-utils' "应用
Plug  'tomtom/tlib_vim'  "应用
Plug  'garbas/vim-snipmate'
" Optional:
Plug  'honza/vim-snippets'
"----------------------
" Coding
" ---------------------
Plug  'Yggdroot/indentLine' "缩进对其线
Plug  'tell-k/vim-autopep8' "automatically formats Python code to conform to the PEP 8 style guide
Plug  'godlygeek/tabular'  " 输入tabular /, 则以，为分隔符
Plug  'plasticboy/vim-markdown' "markdown 支持
Plug  'vim-scripts/a.vim'   "头文件跳转  :A or <leader>is  <leader>ih
Plug  'vim-scripts/indentpython.vim' "帮组python格式化代码缩进。
Plug  'w0rp/ale'
Plug  'nvie/vim-flake8' "python 标准检查插件
Plug  'majutsushi/tagbar'   "tagbar
Plug  'jmcantrell/vim-virtualenv' "python virtual 支持
Plug  'tpope/vim-commentary' "快速注释 gc gcc
Plug  'vim-scripts/DoxygenToolkit.vim'  "生成doxygen风格注释
Plug  'Shougo/echodoc.vim'
Plug  'ludovicchabant/vim-gutentags'   "管理tags
Plug  'skywind3000/gutentags_plus'
Plug  'skywind3000/vim-preview'
Plug  'tpope/vim-unimpaired'
Plug  'octol/vim-cpp-enhanced-highlight'
"-----------------
" Fast navigation
"-----------------
Plug  'easymotion/vim-easymotion'  "快速移动 使用<leader><leader>开头
"Plugin 'Lokaltog/vim-easymotion'
Plug  'derekwyatt/vim-fswitch' "头文件和文件切换 <leader>sw
"--------------
" IDE features
"--------------
Plug  'tpope/vim-fugitive' "git 支持
Plug  'mhinz/vim-signify'
Plug  'bling/vim-airline' "状态栏
Plug  'fholgado/minibufexpl.vim'  "minibuf
Plug  'kien/ctrlp.vim' "c-p后调出窗口快速跳转文件及buf
Plug  'scrooloose/nerdtree' "文件树查看 <leader>nt F2
Plug  'terryma/vim-multiple-cursors'  "多光标操作 选中之后c-n  全选中c-n 则为选中头  vip为全选
Plug  'tpope/vim-surround'       "surround cs ds....
Plug  'mbbill/undotree'         "undo  操作
Plug  'skywind3000/asyncrun.vim'  "异步操作
Plug  'junegunn/vim-easy-align'
"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
"------- web backend ---------
Plug  '2072/PHP-Indenting-for-VIm' "官方php缩进
"Bundle 'tpope/vim-rails'
Plug  'lepture/vim-jinja'  "jinja支持
"Bundle 'digitaltoad/vim-jade'

"-----------lsc----------
Plug  'prabirshrestha/asyncomplete.vim'
Plug  'prabirshrestha/async.vim'
Plug  'prabirshrestha/vim-lsp'
Plug  'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()            " required
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
set guioptions-=m
set guioptions-=T
"隐藏顶部标签栏"
set showtabline=0

"set noshowmode "for echodoc show func document
set cmdheight=2 "for echodoc show func document

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

let mapleader="\<Space>"
let g:Powerline_symbols='unicode'

set clipboard=unnamed

set completeopt=longest,menu "补全菜单的样式

nmap <leader>pv :source %<CR>

"------------------------------------------------------------------
"  which key
"------------------------------------------------------------------
set timeoutlen=500
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map =  {}
let g:which_key_map.a = {'name':'+ALE'}
let g:which_key_map.b = {'name':'+buffer'}
let g:which_key_map.c = {'name':'+Gscope'}
let g:which_key_map.d = {'name':'+Dox'}
let g:which_key_map.e = {'name':'+Edit'}
let g:which_key_map.l = {'name':'+Lsp'}
let g:which_key_map.q = {'name':'+quickfix'}
let g:which_key_map.p = {'name':'+Program'}
let g:which_key_map.t = {'name':'+tag'}
let g:which_key_map.w = {'name':'+wiki'}
let g:which_key_map[' ']= {'name':'+EasyMotion'}

try
	call which_key#register('<Space>', "g:which_key_map")
	nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
catch
endtry

" ------------------------------------------------------------------
" code
" ------------------------------------------------------------------
au BufRead,BufNewFile  *.asm,*.c,*.cpp,*.java,*.cs,
			\*.sh,*.lua,*.pl,*.pm,*.py,
			\*.rb,*.erb,*.hs,*.vim
			\ 2match Underlined /.\%81v/
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
" preview windows
" ------------------------------------------------------------------
noremap <leader>tp :PreviewSignature!<cr>
nmap <leader>qw :PreviewClose<cr>

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
au BufNewFile,BufRead *.txt,*.md,*.tmp,*.wiki
\ set wrap    "设置折行"

" ------------------------------------------------------------------
" quick run
" ------------------------------------------------------------------
map <F9> :call Compile()<CR>
imap <F9> <esc>:call Compile()<CR>
map <m-m> :call Compile()<CR>
map <leader>pc :call Compile()<CR>
imap <m-m> <esc>:call Compile()<CR>
func! Compile()
    exec "w"
    if &filetype == 'c'
        "exec "!g++ % -o %<"
        "exec "!gcc % -o %<"
        call CompileRunGcc()
        "exec "!time ./%<"
    elseif &filetype == 'cpp'
        "exec "!g++ % -o %<"
        "exec "!gcc % -o %<"
        call CompileRunGcc()
        "exec " ./%<"
    elseif &filetype == 'python'
         call RunPython()
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
nmap <leader>eb :%s/\s\+$<CR>
nmap <leader>s :w!<cr>
"nmap <leader>bp :bp!<cr>
"nmap <leader>bn :bn!<cr>
" When pressing <leader>cd switch to the directory of the open buffer
" cros to cd
nmap <leader>ed :cd %:p:h<cr>

" programming related
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <leader>ts :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <leader>es :FSHere <CR>
nnoremap <silent> <F4> :A<CR>
" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bd%<cr>

map<leader>ee :e! $VIMRUNTIME/../_vimrc<cr>
"autocmd! bufwritepost _vimrc source c:/vim/_vimrc
map <S-F> <ESC>:%!astyle --style=ansi -U -p -f<CR>
nmap <leader>pf <ESC>:%!astyle --style=ansi -U -p -f<CR>
" map for completion see :help ins-completion for whole completions
" search tags
inoremap <unique> <c-]> <C-X><C-]>
" search in current files, preview first. remove the original c-p
"inoremap <un<c-p> <C-X><C-P>ique>
map  <leader>qc :cclose<cr>
map  <leader>qo :bot copen<cr>
map  <leader>ef :vim /<c-r><c-w>/ **/*.cpp **/*.h **/*.py **/*.c<cr>:copen<cr>
map  <C-F5> :vim /<c-r><c-w>/ **/*.cpp **/*.h **/*.py **/*.c<cr>:copen<cr>
map  <F8> :Calendar<cr>
map  <leader>em :MRU<cr>

"  run python
"autocmd BufNewFile,BufRead *.py nmap <leader>cp :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <m-y> :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <leader>py :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <F12> :w <cr>:!python %<cr>
"autocmd BufNewFile,BufRead *.py nmap <C-r> :w <cr>:!python %<cr>
"autocmd BufNewFile,BufRead *.py nmap <m-r> :w <cr>:!python %<cr>
map <leader>ps :AsyncStop<cr>
nnoremap <leader>eu :UndotreeToggle<cr>

map <leader>eh :%!xxd -g 1<cr>
map <leader>en :%!xxd -r<cr>
" ------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
map <leader>et :NERDTree<CR>
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

"*********************************************
" gui terminal
" ********************************************

" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
	if winnr('$') <= 1
		return
	endif
	noautocmd silent! wincmd p
	if a:mode == 0
		exec "normal! \<c-y>"
	elseif a:mode == 1
		exec "normal! \<c-e>"
	elseif a:mode == 2
		exec "normal! ".winheight('.')."\<c-y>"
	elseif a:mode == 3
		exec "normal! ".winheight('.')."\<c-e>"
	elseif a:mode == 4
		normal! gg
	elseif a:mode == 5
		normal! G
	elseif a:mode == 6
		exec "normal! \<c-u>"
	elseif a:mode == 7
		exec "normal! \<c-d>"
	elseif a:mode == 8
		exec "normal! k"
	elseif a:mode == 9
		exec "normal! j"
	endif
	noautocmd silent! wincmd p
endfunc


" 0:up, 1:down, 2:pgup, 3:pgdown 4:top, 5:bottom,
function! Tools_QuickfixCursor(mode)
	function! s:quickfix_cursor(mode)
		if &buftype == 'quickfix'
			if a:mode == 0
				exec "normal! \<c-y>"
			elseif a:mode == 1
				exec "normal! \<c-e>"
			elseif a:mode == 2
				exec "normal! ".winheight('.')."\<c-y>"
			elseif a:mode == 3
				exec "normal! ".winheight('.')."\<c-e>"
			elseif a:mode == 4
				normal! gg
			elseif a:mode == 5
				normal! G
			elseif a:mode == 6
				exec "normal! \<c-u>"
			elseif a:mode == 7
				exec "normal! \<c-d>"
			elseif a:mode == 8
				exec "normal! k"
			elseif a:mode == 9
				exec "normal! j"
			endif
		endif
	endfunc
	let l:winnr = winnr()
	noautocmd silent! windo call s:quickfix_cursor(a:mode)
	noautocmd silent! exec ''.l:winnr.'wincmd w'
endfunc

noremap <silent><M-[> :call Tools_QuickfixCursor(2)<cr>
noremap <silent><M-]> :call Tools_QuickfixCursor(3)<cr>
noremap <silent><M-{> :call Tools_QuickfixCursor(4)<cr>
noremap <silent><M-}> :call Tools_QuickfixCursor(5)<cr>
noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>

inoremap <silent><M-[> <c-\><c-o>:call Tools_QuickfixCursor(2)<cr>
inoremap <silent><M-]> <c-\><c-o>:call Tools_QuickfixCursor(3)<cr>
inoremap <silent><M-{> <c-\><c-o>:call Tools_QuickfixCursor(4)<cr>
inoremap <silent><M-}> <c-\><c-o>:call Tools_QuickfixCursor(5)<cr>
inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>

" ----------------------------------------
" tagbar
" --------------------------------------------------
"设置关闭和打开tagbar窗口的快捷键
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 25

" ----------------------------------------
" gutentags
" --------------------------------------------------
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1
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
"set tags=./.tags;,.tags
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

"____________________test____________________________________
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
"  < 编译、连接、运行配置 >
"------------------------------------------------------------------------------
" F9 一键保存、编译、连接存并运行
map <F5> :call MyRun()<CR>
map <m-r> :call MyRun()<CR>
map <leader>pr :call MyRun()<CR>
imap <F5> <ESC>:call MyRun()<CR>
imap <m-r> <ESC>:call MyRun()<CR>

" Ctrl + F9 一键保存并编译
"map <C-F9> :call CompileRunGcc()<CR>
"imap <C-F9> <ESC> :call CompileRunGcc()<CR>

" Ctrl + F10 一键保存并连接
map <F10> :call Link()<CR>
map <leader>pl :call Link()<CR>
imap <F10> <ESC>:call Link()<CR>

if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

let s:LastShellReturn_C = 0
let s:LastShellReturn_L = 0
let s:ShowWarning = 1
let s:Obj_Extension = '.o'
let s:Exe_Extension = '.exe'
let s:Sou_Error = 0

"let s:windows_CFlags = 'gcc\ -std=gnu++0x\ -fexec-charset=gbk\ -Wall\ -g\ -O3\ -c\ %\ -o\ %<.o'
"let s:linux_CFlags = 'gcc\ -std=gnu++0x\ -Wall\ -g\ -O3\ -c\ %\ -o\ %<.o'

"let s:windows_CPPFlags = 'g++\ -std=gnu++0x\ -fexec-charset=gbk\ -Wall\ -g\ -O3\ -c\ %\ -o\ %<.o'
"let s:linux_CPPFlags = 'g++\ -std=gnu++0x\ -Wall\ -g\ -O3\ -c\ %\ -o\ %<.o'

let s:windows_CFlags = 'clang\ -fexec-charset=utf-8\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CFlags = 'clang\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

let s:windows_CPPFlags = 'clang\ -fexec-charset=utf-8\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'
let s:linux_CPPFlags = 'clang\ -Wall\ -g\ -O0\ -c\ %\ -o\ %<.o'

func! CompileRunGcc()
    exe ":ccl"
    exe ":update"
    if expand("%:e") == "c" || expand("%:e") == "cpp" || expand("%:e") == "cxx"
        let s:Sou_Error = 0
        let s:LastShellReturn_C = 0
        let Sou = expand("%:p")
        let Obj = expand("%:p:r").s:Obj_Extension
        let Obj_Name = expand("%:p:t:r").s:Obj_Extension
        let v:statusmsg = ''
        if !filereadable(Obj) || (filereadable(Obj) && (getftime(Obj) < getftime(Sou)))
            redraw!
            if expand("%:e") == "c"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CFlags
                else
                    exe ":setlocal makeprg=".s:linux_CFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                if g:iswindows
                    exe ":setlocal makeprg=".s:windows_CPPFlags
                else
                    exe ":setlocal makeprg=".s:linux_CPPFlags
                endif
                echohl WarningMsg | echo " compiling..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_C = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_C != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " compilation failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " compilation successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " compilation successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Obj_Name"is up to date"
        endif
    else
        let s:Sou_Error = 1
        echohl WarningMsg | echo " please choose the correct source file"
    endif
    exe ":setlocal makeprg=make"
endfunc

func! Link()
    call CompileRunGcc()
    if s:Sou_Error || s:LastShellReturn_C != 0
        return
    endif
    let s:LastShellReturn_L = 0
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
        let Exe_Name = expand("%:p:t:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
        let Exe_Name = expand("%:p:t:r")
    endif
    let v:statusmsg = ''
    if filereadable(Obj) && (getftime(Obj) >= getftime(Sou))
        redraw!
        if !executable(Exe) || (executable(Exe) && getftime(Exe) < getftime(Obj))
            if expand("%:e") == "c"
                setlocal makeprg=gcc\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            elseif expand("%:e") == "cpp" || expand("%:e") == "cxx"
                setlocal makeprg=g++\ -o\ %<\ %<.o
                echohl WarningMsg | echo " linking..."
                silent make
            endif
            redraw!
            if v:shell_error != 0
                let s:LastShellReturn_L = v:shell_error
            endif
            if g:iswindows
                if s:LastShellReturn_L != 0
                    exe ":bo cope"
                    echohl WarningMsg | echo " linking failed"
                else
                    if s:ShowWarning
                        exe ":bo cw"
                    endif
                    echohl WarningMsg | echo " linking successful"
                endif
            else
                if empty(v:statusmsg)
                    echohl WarningMsg | echo " linking successful"
                else
                    exe ":bo cope"
                endif
            endif
        else
            echohl WarningMsg | echo ""Exe_Name"is up to date"
        endif
    endif
    setlocal makeprg=make
endfunc

func! CRun()
    let s:ShowWarning = 0
    call Link()
    let s:ShowWarning = 1
    if s:Sou_Error || s:LastShellReturn_C != 0 || s:LastShellReturn_L != 0
        return
    endif
    let Sou = expand("%:p")
    let Obj = expand("%:p:r").s:Obj_Extension
    if g:iswindows
        let Exe = expand("%:p:r").s:Exe_Extension
    else
        let Exe = expand("%:p:r")
    endif
    if executable(Exe) && getftime(Exe) >= getftime(Obj) && getftime(Obj) >= getftime(Sou)
        redraw!
        echohl WarningMsg | echo " running..."
        if g:iswindows
            exe ":!%<.exe"
        else
            if g:isGUI
                exe ":!gnome-terminal -e ./%<"
            else
                exe ":!./%<"
            endif
        endif
        redraw!
        echohl WarningMsg | echo " running finish"
    endif
endfunc

func! MyRun()
    exec "w"
    if &filetype == 'c'
        call CRun()
	elseif &filetype == 'cpp'
        call CRun()
    elseif &filetype == 'python'
        exec "!python %"
    elseif &filetype == 'java'
        exec "!javac % && java %<"
        "exec "!java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'html'
        exec "!firefox % "
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
"autocmd BufNewFile,BufRead *.py nmap <m-r> :w <cr>:!python %<cr>
endfunc

" ------------------------------------------------------------------
"   super tab
" ------------------------------------------------------------------
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" ------------------------------------------------------------------
"  ALE
" ------------------------------------------------------------------
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
let g:ale_set_highlights = 0
""自定义error和warning图标
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'w'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['E %d', 'W %d', 'O OK']
""显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
""打开文件时不进行检查
"let g:ale_lint_on_enter = 0

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader>an <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>at :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"
let g:ale_linters = {
\   'cpp':        ['cppcheck','clang','gcc'],
\   'c':          ['cppcheck','clang', 'gcc'],
\   'python':     ['pylint'],
\   'javascript': ['eslint'],
\   'css':        ['stylelint'],
\   'bash':       ['shellcheck'],
\   'go':         ['golint'],
\}

""""""""""""""""""""""""""""""
" echodoc
""""""""""""""""""""""""""""""
let g:echodoc#enable_at_startup = 1

""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""
nnoremap <leader>pp :CtrlPBufTag<CR>

""""""""""""""""""""""""""""""
" easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" miniBufexplorer Config
""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchWindows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne=0

" -----------------------------------------------------------------
"  vimwiki
"  ----------------------------------------------------------------
" vimwiki
let g:vimwiki_use_mouse = 1
source $VIMRUNTIME/../wiki-list.vim

" -----------------------------------------------------------------
" lsc
" -----------------------------------------------------------------
imap <c-space> <Plug>(asyncomplete_force_refresh)

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" python pyls
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
let g:jedi#completions_enabled = 0
" c/c++ clangd
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif
" go
if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
endif

let g:lsp_async_completion = 1
let g:lsp_use_event_queue = 1
let g:lsp_text_edit_enabled = 0

nmap <leader>ls :LspStatus<cr>

autocmd FileType python,go,c,cpp
\  setlocal omnifunc=lsp#complete|
\  nmap <leader>ld <plug>(lsp-definition)|
\  nmap <leader>lh <plug>(lsp-hover)|
\  nmap <leader>lf :LspDocumentFormat<cr>|
\  vmap <leader>lf :LspDocumentRangeFormat<cr>|
\  nmap <leader>ln :LspNextError<cr>|
\  nmap <leader>lp :LspPreviousError<cr>|
\  nmap <leader>lr :LspRename<cr>
