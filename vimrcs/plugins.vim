
"******************************************************************
set nocompatible              " required
filetype off                  " required

"source c:/vim/plug.vim
source $VIMRUNTIME/../plug.vim
call plug#begin('~/plugged')

"------------
" common plugin
" -----------
" Plug  'vim-scripts/mru.vim'
" Plug  'jiangmiao/auto-pairs' "与vimlsp 有冲突
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
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java','python','cs','go'] }
Plug 'sgur/vim-textobj-parameter'

"----------------------
" Coding
" ---------------------
Plug  'Yggdroot/indentLine' "缩进对其线
Plug  'tell-k/vim-autopep8' "automatically formats Python code to conform to the PEP 8 style guide
Plug  'godlygeek/tabular'  " 输入tabular /, 则以，为分隔符
Plug  'plasticboy/vim-markdown' "markdown 支持
Plug  'iamcco/markdown-preview.vim'  " need python support
" Plug  'vim-scripts/a.vim'   "头文件跳转  :A or <leader>is  <leader>ih
Plug  'vim-scripts/indentpython.vim' "帮助python格式化代码缩进。
Plug  'dense-analysis/ale'    "ale git 名修改
Plug  'nvie/vim-flake8' "python 标准检查插件
Plug  'majutsushi/tagbar'   "tagbar
Plug  'jmcantrell/vim-virtualenv' "python virtual 支持
Plug  'tpope/vim-commentary' "快速注释 gc gcc
Plug  'vim-scripts/DoxygenToolkit.vim'  "生成doxygen风格注释
Plug  'Shougo/echodoc.vim'
Plug  'ludovicchabant/vim-gutentags'   "管理tags
Plug  'skywind3000/gutentags_plus'
Plug  'skywind3000/vim-preview'
Plug  'tpope/vim-unimpaired'   "通过[]快速按键
Plug  'octol/vim-cpp-enhanced-highlight'
Plug  'OmniSharp/omnisharp-vim'     " c#支持
"-----------------
" Fast navigation
"-----------------
Plug  'easymotion/vim-easymotion'  "快速移动 使用<leader><leader>开头
Plug  'derekwyatt/vim-fswitch' "头文件和文件切换 <leader>fg
"--------------
" IDE features
"--------------
Plug  'tpope/vim-fugitive' "git 支持
Plug  'mhinz/vim-signify'
Plug  'bling/vim-airline' "状态栏
Plug  'vim-airline/vim-airline-themes'
" Plug  'fholgado/minibufexpl.vim'  "minibuf
Plug  'scrooloose/nerdtree' "文件树查看 <leader>ft F2
Plug  'terryma/vim-multiple-cursors'  "多光标操作 选中之后c-n  全选中c-n 则为选中头  vip为全选
Plug  'tpope/vim-surround'       "surround cs ds....
Plug  'mbbill/undotree'         "undo  操作
Plug  'skywind3000/asyncrun.vim'  "异步操作
Plug  'junegunn/vim-easy-align'
Plug  'jpalardy/vim-slime'
Plug  'ntpeters/vim-better-whitespace'
Plug  'kien/ctrlp.vim'             "c-p后调出窗口快速跳转文件及buf
Plug  'tacahiroy/ctrlp-funky'      " func支持
Plug  'liuchengxu/vista.vim'
Plug  'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug  'junegunn/fzf.vim'
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
nnoremap <silent><F2> :NERDTreeToggle<CR>
inoremap <silent><F2> <ESC>:NERDTreeToggle<CR>
nmap ge :NERDTreeToggle<CR>
nnoremap <silent><Leader>ft :NERDTreeToggle<CR>
nnoremap <silent><Leader>fd :NERDTreeFind<CR>
let NERDTreeChDirMode=2
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$','\.git','\.svn','\.root','\.vs']
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
" startify
"----------------------------
autocmd User Startified setlocal cursorline

let g:startify_session_persistence = 0

nmap <leader>Sl :SLoad<cr>
nmap <leader>Ss :SSave<cr>
nmap <leader>Sd :SDelete<cr>
nmap <leader>Sc :SClose<cr>

"--------------------------
"AirlineTheme设置"
"----------------------------
let g:airline_theme='dark_minimal'
nmap <leader>tl :AirlineToggle<cr>
nmap <leader>ar :AirlineRefresh<cr>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1 " buffer 编号
let g:airline#extensions#tabline#formatter = 'unique_tail' " 仅显示名称
let g:airline#extensions#tabline#show_buffers = 1 "buffer 显示在一个tab忠
let g:airline#extensions#tabline#show_tabs = 0 " 不显示tab
let g:airline#extensions#whitespace#enabled = 0 "不显示空白
" let g:airline#extensions#tabline#alt_sep = 0  " 分隔符
"--------------------------------------------------------------------------------
"easy mothing
"--------------------------------------------------------------------------------
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
" map <Leader><Leader>j <Plug>(easymotion-j)
" map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" " 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)
" map <Leader><leader> <Plug>(easymotion-prefix)
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
map <leader>;Da :DoxAuthor<CR>
map <leader>;Df :Dox<CR>
map <leader>;Db :DoxBlock<CR>

" ----------------------------------------
" tagbar
" --------------------------------------------------
"设置关闭和打开tagbar窗口的快捷键
nnoremap <leader>tt :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 25

" ----------------------------------------
" gutentags
" --------------------------------------------------
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project','.vs','.vscode']

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

" 放入环境变量中设置
" let $GTAGSLABEL = 'native-pygments'
" let $GTAGSCONF = $VIMRUNTIME.'/../gtags.conf'
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
nmap  <leader>rR :CtrlPRoot<CR>
nmap  <leader>rr :CtrlPMRUFiles<cr>
nmap  <leader>rc :CtrlPChange<cr>
nmap  <leader>ru :CtrlPUndo<cr>
nmap  <leader>rl :CtrlPLine<cr>
nmap  <leader>rs :CtrlPRTS<cr>
nmap  <leader>ra :CtrlPBufTagAll<cr>
nmap  <leader>rb :CtrlPBuffer<cr>

" ----------------------------------------
" ctrlp-funky
" --------------------------------------------------
nnoremap <Leader>tf :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>rF :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""
nmap  <leader>tv :Vista finder<CR>
nmap  <leader>f? :FZF<cr>
nmap <leader>zz :Files
" Git files ( `git ls-files` )
nmap <leader>zgf :GFiles<CR>
" Git files ( `git status` )
nmap <leader>zgF :GFiles?<CR>
" Open buffers
nmap <leader>zb :Buffers<CR>
" Color schemes
nmap <leader>zS :Colors<CR>
" {ag}{6} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
nmap <leader>ag :Ag<CR>
" {rg}{7} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
nmap <leader>rg :Rg<CR>
" Lines in loaded buffers
nmap <leader>fB :Lines<CR>
" Lines in the current buffer
nmap <leader>fb :BLines<CR>
" Tags in the project ( `ctags -R` )
nmap <leader>tB :Tags<CR>
" Tags in the current buffer
nmap <leader>tb :BTags<CR>
" Marks
nmap <leader>zm :Marks<CR>
" Windows
nmap <leader>zw :Windows<CR>
"  `locate`  command output
nmap <leader>zo :Locate
"  `v:oldfiles`  and open buffers
nmap <leader>fr :History<CR>
" Command history
nmap <leader>zd :History:<CR>
" Search history
nmap <leader>zs :History/<CR>
" Snippets ({UltiSnips}{8})
nmap <leader>zp :Snippets<CR>
" Git commits (requires {fugitive.vim}{9})
nmap <leader>zc :Commits<CR>
" Git commits for the current buffer
nmap <leader>zC :BCommits<CR>
" Commands
nmap <leader>zD :Commands<CR>
" Normal mode mappings
nmap <leader>? :Maps<CR>
" Help tags [1]
nmap <leader>z? :Helptags<CR>
" File types
nmap <leader>zy :Filetypes<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
 let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'border':  ['fg', 'Ignore'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.cache/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

if executable('fzf')
    " Insert mode completion
    imap <c-x><c-k> <plug>(fzf-complete-word)
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
    " Advanced customization using autoload functions
    " inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
endif

" ----------------------------------------
" vista.vim
" --------------------------------------------------
nmap  <leader>vv :Vista!!<CR>
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction


" set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ 'c': 'vim_lsp',
  \ 'py': 'vim_lsp',
  \ 'go': 'vim_lsp',
  \ 'java': 'vim_lsp',
  \ 'cs': 'ctags',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

""""""""""""""""""""""""""""""
" easy-align
""""""""""""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>xa <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>xa <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
" miniBufexplorer Config
""""""""""""""""""""""""""""""
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapCTabSwitchWindows = 1
""let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

""解决FileExplorer窗口变小问题
"let g:miniBufExplForceSyntaxEnable = 1
"let g:miniBufExplorerMoreThanOne=0

"nmap <leader>er :MBEToggle<cr>
" -----------------------------------------------------------------
"  mark
"  ----------------------------------------------------------------
nmap <leader>mm <Plug>MarkSet
vmap <leader>mm <Plug>MarkSet
nmap <leader>mr <Plug>MarkRegex
vmap <leader>mr <Plug>MarkRegex
nmap <leader>mn <Plug>MarkClear
nmap <unique> <silent> <Leader>m* <Plug>MarkSearchCurrentNext
nmap <unique> <silent> <Leader>m# <Plug>MarkSearchCurrentPrev
nmap <unique> <silent> <Leader>m/ <Plug>MarkSearchAnyNext
nmap <unique> <silent> <Leader>m? <Plug>MarkSearchAnyPrev
" -----------------------------------------------------------------
"  markdown-preview
"  ----------------------------------------------------------------
" need python support
if executable('chrome')
    let g:mkdp_path_to_chrome = "chrome"
elseif executable('firefox')
    let g:mkdp_path_to_chrome = "firefox"
endif
map <leader>Mp <Plug>MarkdownPreview
map <leader>Ms <Plug>StopMarkdownPreview

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
nmap <leader>tw :ToggleWhitespace<CR>
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
map <leader>;c :Calendar<cr>

" -----------------------------------------------------------------
" MRU
" -----------------------------------------------------------------
" map  <leader>em :MRU<cr>

" -----------------------------------------------------------------
" async
" -----------------------------------------------------------------
"autocmd BufNewFile,BufRead *.py nmap <leader>cp :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <m-y> :w <cr>:AsyncRun -raw python %<cr>
autocmd BufNewFile,BufRead *.py nmap <leader>pap :w <cr>:AsyncRun -raw python %<cr>
map <leader>pas :AsyncStop<cr>

" -----------------------------------------------------------------
" undotree
" -----------------------------------------------------------------
nnoremap <leader>tu :UndotreeToggle<cr>
" ------------------------------------------------------------------
" preview windows
" ------------------------------------------------------------------
noremap <leader>pp :PreviewSignature!<cr>
nmap <leader>wqd :PreviewClose<cr>
" -----------------------------------------------------------------
" vim-slime
" -----------------------------------------------------------------
let g:slime_target = "vimterminal"

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:slime_vimterminal_cmd = "cmd"
else
    let g:slime_vimterminal_cmd = "bash"
endif
nmap <leader>'c <plug>SlimeConfig
nmap <leader>'p <plug>SlimeParagraphSend
xmap <leader>'s <plug>SlimeRegionSend
nmap <leader>'s :SlimeSend<cr>
nmap <leader>'l :SlimeSendCurrentLine<cr>
nmap <leader>'1 :SlimeSend1
nmap <leader>'0 :SlimeSend0
" let g:slime_python_ipython = 1

" -----------------------------------------------------------------
" lsc
" -----------------------------------------------------------------
imap <c-l> <Plug>(asyncomplete_force_refresh)

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

let g:asyncomplete_auto_popup = 1
" c 对中文问题
let g:lsp_async_completion = 1
let g:lsp_use_event_queue = 1
let g:lsp_text_edit_enabled = 1
let g:lsp_diagnostics_enabled  = 1
let g:lsp_signature_help_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_signs_priority = 11
let g:lsp_signs_priority_map = {
        \'LspError': 11,
        \'LspWarning': 7,
        \'clangd_LspWarning': 11,
        \'clangd_LspInformation': 11
        \}

" set statusline+=%{NearestMethodOrFunction()}
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

autocmd! FileType python,go,c,cpp,java
autocmd FileType python,go,c,cpp,java
\ setlocal omnifunc=lsp#complete

"仅导入一次，显示lsp的warning和error
autocmd VimEnter *
\ let g:airline_section_warning = g:airline_section_warning.
\'%{lsp#get_buffer_diagnostics_counts()["warning"]?
\"▸W:".lsp#get_buffer_diagnostics_counts()["warning"]:""}'|
\ let g:airline_section_error = g:airline_section_error.
\'%{lsp#get_buffer_diagnostics_counts()["error"]?
\"▸E:".lsp#get_buffer_diagnostics_counts()["error"]:""}
\%{lsp#get_buffer_first_error_line()?
\"(L".lsp#get_buffer_first_error_line().")":""}'
" △▽○◇□☆▷◁♤♡♢♧☼☺☏•▲▼●◆■★▶◀♠♥♦♣☀☻☎‥▪•*☉⊙⊕Θ◎❤¤✪の⊿☜☞⊱⋛⋌⋚⊰⊹⌒®©¢℡™ª㈱卍卐♂♀※∷#№&@◤◣◢◥▨▤▧▥▩▥▧▤▨▦☋☍☌▬〓≡▓▒░㊣↔↑→↘↙←↖╋┃┠┨┷┿┯┯┕━━┼┐アイケセテニタサヂデゲギルミヘュッ、夬乛乚亅厃々丂⺷⺻⺳⺪⺧⺋⺈⺄⺁兀〩ㄅㄇㄉㄋㄌㄔㄓㄒㄑㄐㄏㄎㄍㄟㄠㄡㄢㄣㄤㄩㄨㄧㄦㄥΝνξΞΠΟοπρΡΣΤΥΦΧΨΩωψχφυτσÅÆÇÈÉÊËêéèçæå±＜＞﹥＝≧≌∽≮≯⌒⊥∠㏑∏￡㎎ml♂￥

" key setting
autocmd FileType python,go,c,cpp,java
\ nmap <leader>l* :LspStatus<cr>|
\ nmap <buffer> <leader>la  :LspCodeAction<cr>|
\ nmap <buffer> <leader>lD  :LspDocumentDiagnostics<cr>|
\ nmap <buffer> <leader>lgD  :LspDeclaration<cr>|
\ nmap <buffer> <leader>lgd  :LspDefinition<cr>|
\ nmap <buffer> <leader>lf  :LspDocumentFold<cr>|
\ nmap <buffer> <leader>lsf  :LspDocumentFoldSync<cr>|
\ nmap <buffer> <leader>lF  :LspDocumentFormat<cr>|
\ nmap <buffer> <leader>lsF  :LspDocumentFormatSync<cr>|
\ vmap <buffer> <leader>lf  :LspDocumentRangeFormat<cr>|
\ nmap <buffer> <leader>lsd  :LspDocumentSymbol<cr>|
\ nmap <buffer> <leader>lh  :LspHover<cr>|
\ nmap <buffer> <leader>len  :LspNextError<cr>|
\ nmap <buffer> <leader>lRn  :LspNextReference<cr>|
\ nmap <buffer> <leader>lpD  :LspPeekDeclaration<cr>|
\ nmap <buffer> <leader>lpd  :LspPeekDefinition<cr>|
\ nmap <buffer> <leader>lpi  :LspPeekImplementation<cr>|
\ nmap <buffer> <leader>lpt  :LspPeekTypeDefinition<cr>|
\ nmap <buffer> <leader>lep  :LspPreviousError<cr>|
\ nmap <buffer> <leader>lRp  :LspPreviousReference<cr>|
\ nmap <buffer> <leader>lgi  :LspImplementation<cr>|
\ nmap <buffer> <leader>lr  :LspReferences<cr>|
\ nmap <buffer> <leader>ln  :LspRename<cr>|
\ nmap <buffer> <leader>lgt  :LspTypeDefinition<cr>|
\ nmap <buffer> <leader>lsw  :LspWorkspaceSymbol<cr>|
\ nmap <buffer> <leader>lpc  <plug>(lsp-preview-close)|
\ nmap <buffer> <leader>lpf  <plug>(lsp-preview-focus)

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
nmap <Leader>aT :ALEToggleBuffer<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>
"java 中文乱码
let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'
" auto parse makefile
let g:ale_c_parse_makefile = 1
" let g:ale_c_parse_compile_commands = 1
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" 使用clangd对c和c++进行语法检查，对python使用pylint进行语法检查
 let g:ale_linters = {
 \   'cpp':        ['cppcheck'],
 \   'c':          ['cppcheck'],
 \   'python':     ['pylint'],
 \   'javascript': ['eslint'],
 \   'java':       ['eslint'],
 \   'css':        ['stylelint'],
 \   'bash':       ['shellcheck'],
 \   'go':         ['golint'],
 \   'cs': ['OmniSharp'],
 \}

" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'css':        ['stylelint'],
" \   'bash':       ['shellcheck'],
" \   'cs': ['OmniSharp'],
" \}
" autocmd BufWritePre *.cpp,*.c !cppcheck %
"------------------------------------------------------------------
"  Omnisharp
"------------------------------------------------------------------
" let g:OmniSharp_server_path = 'D:\tools\omnisharp-win-x64\OmniSharp.exe'
" Use the stdio OmniSharp-roslyn server
let g:OmniSharp_server_stdio = 1

" Set the type lookup function to use the preview window instead of echoing it
"let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
" let g:ale_linters = { 'cs': ['OmniSharp'] }

" Update semantic highlighting after all text changes
let g:OmniSharp_highlight_types = 3
" Update semantic highlighting on BufEnter and InsertLeave
" let g:OmniSharp_highlight_types = 2

augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> <leader>sd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>si :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sb :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>su :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>sm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>sx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>st :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sD :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <leader>ss :OmniSharpSignatureHelp<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <leader>s[[ :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <leader>s]] :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>sc :OmniSharpGlobalCodeCheck<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sr :OmniSharpRename<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <buffer> <Leader>sS :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader>sg :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader>sg :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
" nnoremap <Leader>nm :OmniSharpRename<CR>
" nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>sf :OmniSharpCodeFormat<CR>

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
" Enable snippet completion
let g:OmniSharp_want_snippet=0


"------------------------------------------------------------------
"  which key
"------------------------------------------------------------------
set timeoutlen=300
" 与新版本vim有冲突，导致状态栏小时
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:which_key_map      = {}
let g:which_key_map[' '] = {'name':'+easyMotion'}
let g:which_key_map["'"] = {'name':'+slime/terminal'}
let g:which_key_map["?"] = {'name':'+Maps'}
let g:which_key_map.a    = {'name':'+ALE'}
let g:which_key_map.c    = {'name':'+gscope'}
let g:which_key_map.f    = {'name':'+files'}
let g:which_key_map.f.v  = {'name':'+vimrcs'}
let g:which_key_map.f.w  = {'name':'+whiteSpace'}
let g:which_key_map.l    = {'name':'+lsp'}
let g:which_key_map.l.e  = {'name':'+error'}
let g:which_key_map.l.g  = {'name':'+goto'}
let g:which_key_map.l.p  = {'name':'+peek/preview'}
let g:which_key_map.l.R  = {'name':'+reference-jump'}
let g:which_key_map.l.s  = {'name':'+symbol/sync'}
let g:which_key_map.p    = {'name':'+program'}
let g:which_key_map.p.a  = {'name':'+Async'}
let g:which_key_map.t    = {'name':'+tag/toggle'}
let g:which_key_map.v    = {'name':'+wiki/vista'}
let g:which_key_map.m    = {'name':'+mark'}
let g:which_key_map.M    = {'name':'+markdown'}
let g:which_key_map.r    = {'name':'+ctrlp'}
let g:which_key_map.S    = {'name':'+session/search'}
let g:which_key_map.s    = {'name':'+OmniSharp'}
let g:which_key_map.z    = {'name':'+fzf'}
let g:which_key_map.z.g  = {'name':'+fzf/git'}

let g:which_key_map[";"] = {
        \'name': '+tools',
        \'D': {
          \'name': '+Doxygen'
          \},
        \'x':    'toBinary',
        \'X':    'toString'
        \}

let g:which_key_map.b = {
      \ 'name': '+buffer',
      \ '1':    'buffer1',
      \ '2':    'buffer2',
      \ '3':    'buffer3',
      \ '4':    'buffer4',
      \ '5':    'buffer5',
      \ '6':    'buffer6',
      \ '7':    'buffer7',
      \ '8':    'buffer8',
      \ '9':    'buffer9',
      \ 'a' : ['ba'        , 'delete-all-buffer']   ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ 'b' : ['Buffers'   , 'fzf-buffer'  ] ,
      \ '?' : ['Buffers'   , 'fzf-buffer'   ],
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
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'o' : ['only'       , 'close-all-windows-except-current'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : [':resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : [':resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'q' : {
          \'name':'+quickfix/preview',
          \}
      \ }

let g:which_key_map['x'] = {
      \ 'name' : '+text'           ,
      \ 'a' : ['<Plug>(EasyAlign)' , 'easy-align']                 ,
      \ 'd' : ['StripWhitespace'   , 'delete-trailing-whitespace'] ,
      \ }
try
	call which_key#register('<Space>', "g:which_key_map")
	nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
catch
endtry
