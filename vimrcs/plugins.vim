
"******************************************************************
set nocompatible              " required
filetype off                  " required

"source c:/vim/plug.vim
source $VIMRUNTIME/../plug.vim
call plug#begin('~/plugged')

"------------
" common plugin
" -----------
Plug  'vim-scripts/mru.vim'
Plug  'jiangmiao/auto-pairs'
Plug  'vim-scripts/Mark--Karkat'
Plug  'liuchengxu/vim-which-key'
Plug  'mhinz/vim-startify'
Plug  'junegunn/goyo.vim'
Plug  'tpope/vim-sensible'
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
" text object
" ---------------------
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java','python','go'] }
Plug 'sgur/vim-textobj-parameter'

"----------------------
" Coding
" ---------------------
Plug  'Yggdroot/indentLine' "缩进对其线
Plug  'tell-k/vim-autopep8' "automatically formats Python code to conform to the PEP 8 style guide
Plug  'godlygeek/tabular'  " 输入tabular /, 则以，为分隔符
Plug  'plasticboy/vim-markdown' "markdown 支持
Plug  'vim-scripts/a.vim'   "头文件跳转  :A or <leader>is  <leader>ih
Plug  'vim-scripts/indentpython.vim' "帮助python格式化代码缩进。
Plug  'w0rp/ale'
Plug  'nvie/vim-flake8' "python 标准检查插件
Plug  'majutsushi/tagbar'   "tagbar
" Plug  'jmcantrell/vim-virtualenv' "python virtual 支持
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
Plug  'derekwyatt/vim-fswitch' "头文件和文件切换 <leader>sw
"--------------
" IDE features
"--------------
Plug  'tpope/vim-fugitive' "git 支持
Plug  'mhinz/vim-signify'
Plug  'bling/vim-airline' "状态栏
Plug 'vim-airline/vim-airline-themes'
Plug  'fholgado/minibufexpl.vim'  "minibuf
Plug  'kien/ctrlp.vim' "c-p后调出窗口快速跳转文件及buf
Plug  'scrooloose/nerdtree' "文件树查看 <leader>nt F2
Plug  'terryma/vim-multiple-cursors'  "多光标操作 选中之后c-n  全选中c-n 则为选中头  vip为全选
Plug  'tpope/vim-surround'       "surround cs ds....
Plug  'mbbill/undotree'         "undo  操作
Plug  'skywind3000/asyncrun.vim'  "异步操作
Plug  'junegunn/vim-easy-align'
Plug  'jpalardy/vim-slime'
Plug  'ntpeters/vim-better-whitespace'
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
" ---------------------plugin set-----------------------------------
" ------------------------------------------------------------------

" ------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------
"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
map <leader>fd :NERDTree<CR>
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

"--------------------------
"AirlineTheme设置"
"----------------------------
let g:airline_theme='dark_minimal'

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
"   super tab
" ------------------------------------------------------------------
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim 由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_authorName="Rhys"
let g:DoxygenToolkit_briefTag_funcName="yes"
" let g:DoxygenToolkit_briefTag_pre="@Synopsis "
let g:DoxygenToolkit_paramTag_pre="@param[in] "
let g:doxygen_enhanced_color=1
map <leader>da :DoxAuthor<CR>
map <leader>df :Dox<CR>
map <leader>db :DoxBlock<CR>
map <leader>dc a /* */<LEFT><LEFT><LEFT>

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
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','.github','.vscode']

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
if executable('readtags')
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = $VIMRUNTIME.'\..\gtags.conf'
nmap <leader>cn :cn<CR>
nmap <leader>cp :cp<CR>

""""""""""""""""""""""""""""""
" echodoc
""""""""""""""""""""""""""""""
let g:echodoc#enable_at_startup = 1

""""""""""""""""""""""""""""""
" ctrlp
""""""""""""""""""""""""""""""
nnoremap <leader>rt :CtrlPBufTag<CR>
nmap  <leader>rr :CtrlPRoot<CR>
nmap  <leader>rm :CtrlPMRUFiles<cr>
nmap  <leader>rc :CtrlPChange<cr>
nmap  <leader>ru :CtrlPUndo<cr>
nmap  <leader>rl :CtrlPLine<cr>
nmap  <leader>rs :CtrlPRTS<cr>
nmap  <leader>ra :CtrlPBufTagAll<cr>
nmap  <leader>rb :CtrlPBuffer<cr>
nmap  <leader>rp :CtrlP<cr>

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
"  mark
"  ----------------------------------------------------------------
nmap <leader>mm <Plug>MarkSet
vmap <leader>mm <Plug>MarkSet
nmap <leader>mr <Plug>MarkRegex
vmap <leader>mr <Plug>MarkRegex
nmap <leader>mn <Plug>MarkClear

" -----------------------------------------------------------------
"  vimwiki
"  ----------------------------------------------------------------
" vimwiki
let g:vimwiki_use_mouse = 1
source $VIMRUNTIME/../wiki-list.vim
" change wiki prefix to v
let g:vimwiki_map_prefix = '<Leader>v'

" -----------------------------------------------------------------
"  better white space
"  ----------------------------------------------------------------
let g:better_whitespace_enabled=1
nmap <leader>fwe :EnableWhitespace<CR>
nmap <leader>fwd :DisableWhitespace<CR>
nmap <leader>fwt :ToggleWhitespace<CR>
nmap <leader>fws :StripWhitespace<CR>
let g:better_whitespace_filetypes_blacklist=['text', 'markdown', 'vimwiki',
            \'diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown','Dockerfile']
" -----------------------------------------------------------------
" fugitive
" -----------------------------------------------------------------
nmap <leader>ga :Git add %<CR>
nmap <leader>gc :Gcommit %<CR>
nmap <leader>gC :Gcommit .<CR>

" -----------------------------------------------------------------
" source and header switch
" -----------------------------------------------------------------
nmap <leader>fg :FSHere <CR>

" -----------------------------------------------------------------
" Calendar
" -----------------------------------------------------------------
map  <F8> :Calendar<cr>
map <leader>fc :Calendar<cr>

" -----------------------------------------------------------------
" MRU
" -----------------------------------------------------------------
map  <leader>fm :MRU<cr>

" -----------------------------------------------------------------
" async
" -----------------------------------------------------------------
"autocmd BufNewFile,BufRead *.py nmap <leader>cp :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <m-y> :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <leader>py :w <cr>:AsyncRun -raw python %<cr>
map <leader>ps :AsyncStop<cr>

" -----------------------------------------------------------------
" undotree
" -----------------------------------------------------------------
nnoremap <leader>fu :UndotreeToggle<cr>
" ------------------------------------------------------------------
" preview windows
" ------------------------------------------------------------------
noremap <leader>tv :PreviewSignature!<cr>
nmap <leader>qw :PreviewClose<cr>

" -----------------------------------------------------------------
" vim-slime
" -----------------------------------------------------------------
let g:slime_target = "vimterminal"

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:slime_vimterminal_cmd = "cmd"
else
    let g:slime_vimterminal_cmd = "bash"
endif
nmap <leader>sc <plug>SlimeConfig
nmap <leader>sp <plug>SlimeParagraphSend
xmap <leader>ss <plug>SlimeRegionSend
nmap <leader>ss :SlimeSend<cr>
nmap <leader>sl :SlimeSendCurrentLine<cr>
nmap <leader>s1 :SlimeSend1
nmap <leader>s0 :SlimeSend0
" let g:slime_python_ipython = 1

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
"let g:jedi#completions_enabled = 0
" c/c++ clangd
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
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
"java
if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.300.v20190213-1655.jar'),
        \     '-configuration',
        \     expand('~/lsp/eclipse.jdt.ls/config_win'),
        \     '-data',
        \     expand('~/.cache/javalsp/cache')
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif

let g:asyncomplete_auto_popup = 0
let g:lsp_async_completion = 1
let g:lsp_use_event_queue = 1
let g:lsp_text_edit_enabled = 1
let g:lsp_diagnostics_enabled  = 0
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
nmap <leader>ls :LspStatus<cr>

autocmd FileType python,go,c,cpp,java
\  setlocal omnifunc=lsp#complete|
\  nmap <leader>ld <plug>(lsp-definition)|
\  nmap <leader>lh <plug>(lsp-hover)|
\  nmap <leader>lf :LspDocumentFormat<cr>|
\  vmap <leader>lf :LspDocumentRangeFormat<cr>|
\  nmap <leader>ln :LspNextError<cr>|
\  nmap <leader>lp :LspPreviousError<cr>|
\  nmap <leader>lr :LspRename<cr>

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
let g:ale_sign_warning = 'W'
""在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['E %d', 'W %d', 'O OK']
""显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
""打开文件时不进行检查
"let g:ale_lint_on_enter = 0

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
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
"java 中文乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
" auto parse makefile
let g:ale_c_parse_makefile = 1
" let g:ale_c_parse_compile_commands = 1
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'cpp':        ['cppcheck','clang','gcc'],
\   'c':          ['cppcheck','clang', 'gcc'],
\   'python':     ['pylint'],
\   'javascript': ['eslint'],
\   'java':       ['eslint'],
\   'css':        ['stylelint'],
\   'bash':       ['shellcheck'],
\   'go':         ['golint'],
\}

"------------------------------------------------------------------
"  which key
"------------------------------------------------------------------
set timeoutlen=500
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map =  {}
let g:which_key_map.a = {'name':'+ALE'}
let g:which_key_map.c = {'name':'+gscope'}
let g:which_key_map.d = {'name':'+dox'}
let g:which_key_map.e = {'name':'+edit'}
let g:which_key_map.f = {'name':'+file'}
let g:which_key_map.f.w = {'name':'+whitespace'}
let g:which_key_map.l = {'name':'+lsp'}
let g:which_key_map.q = {'name':'+quickfix'}
let g:which_key_map.p = {'name':'+program'}
let g:which_key_map.t = {'name':'+tag'}
let g:which_key_map.v = {'name':'+wiki'}
let g:which_key_map.m = {'name':'+mark'}
let g:which_key_map.r = {'name':'+ctrlp'}
let g:which_key_map.s = {'name':'+slime'}
let g:which_key_map[' ']= {'name':'+easyMotion'}

let g:which_key_map.b = {
      \ 'name' : '+buffer' ,
      \ 'a' : ['ba'        , 'delete-all-buffer']   ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ }
let g:which_key_map.g = {
      \ 'name' : '+git/version-control' ,
      \ 'a' : 'git-add-current-file',
      \ 'b' : ['Gblame'                 , 'fugitive-blame']             ,
      \ 'c' : 'commits-for-current-buffer',
      \ 'C' : 'fugitive-commit' ,
      \ 'd' : ['Gdiff'                  , 'fugitive-diff']              ,
      \ 'D' : ['SignifyDiff'            , 'fugitive-diff']              ,
      \ 'e' : ['Gedit'                  , 'fugitive-edit']              ,
      \ 'f' : ['Gfetch'                 , 'fugitive-fetch']              ,
      \ 'l' : ['Glog'                   , 'fugitive-log']               ,
      \ 'r' : ['Gread'                  , 'fugitive-read']              ,
      \ 's' : ['Gstatus'                , 'fugitive-status']            ,
      \ 'w' : ['Gwrite'                 , 'fugitive-write']             ,
      \ 'p' : ['Gpush'                  , 'fugitive-push']              ,
      \ 'P' : ['Gpull'                  , 'fugitive-pull']              ,
      \ 'y' : ['Goyo'                   , 'goyo-mode']         ,
 \}

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'c' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>H'     , 'move-window-left']    ,
      \ 'J' : ['<C-W>J'     , 'move-window-down']   ,
      \ 'K' : ['<C-W>K'     , 'move-window-right']   ,
      \ 'L' : ['<C-W>L'     , 'move-window-left']   ,
      \ '>' : ['<C-W>5>'    , 'expand-window-left']   ,
      \ '<' : ['<C-W>5<'    , 'expand-window-right']   ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 'b' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ }

try
	call which_key#register('<Space>', "g:which_key_map")
	nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
catch
endtry
