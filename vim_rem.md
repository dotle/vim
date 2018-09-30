# jedi-vim
    * Completion <C-Space>
    * Goto assignments <leader>g (typical goto function)
    * Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
    * Show Documentation/Pydoc K (shows a popup with assignments)
    * Renaming <leader>r
    * Usages <leader>n (shows all the usages of a name)
    * Open module, e.g. :Pyimport os (opens the os module)
# 基本操作
	* 行末：$
	* 行首：^
	* 空格：\s
	* 行末空格：\s\+$
	* 行首空格：^\+\s
	* 补全
		- 整行补全                        CTRL-X CTRL-L
		- 根据当前文件里关键字补全        CTRL-X CTRL-N
		- 根据字典补全                    CTRL-X CTRL-K
		- 根据同义词字典补全              CTRL-X CTRL-T
		- 根据头文件内关键字补全          CTRL-X CTRL-I
		- 根据标签补全                    CTRL-X CTRL-]
		- 补全文件名                      CTRL-X CTRL-F
		- 补全宏定义                      CTRL-X CTRL-D
		- 补全vim命令                     CTRL-X CTRL-V
		- 用户自定义补全方式              CTRL-X CTRL-U
		- 拼写建议                        CTRL-X CTRL-S 
	* 空格删除
		有些人认为行末的空格是无用，浪费而难看的。要删除这些每行后面多余的空格，可以
		执行如下命令：
		:%s/\s\+$//
		"gf 打开文件
# plugin
	Plugin  'tpope/vim-fugitive' "git 支持
	Plugin  'bling/vim-airline' "状态栏
	Plugin  'fholgado/minibufexpl.vim'  "minibuf
	Plugin  'kien/ctrlp.vim' "c-p后调出窗口快速跳转文件及buf
	Plugin  'scrooloose/nerdtree' "文件树查看 <leader>nt F2
	Plugin  'terryma/vim-multiple-cursors'  "多光标操作 选中之后c-n  全选中c-n 则为选中头  vip为全选
	Plugin  'tpope/vim-surround'       "surro行末：$


	有些人认为行末的空格是无用，浪费而难看的。要删除这些每行后面多余的空格，可以
	执行如下命令：

	:%s/\s\+$//und cs ds....
	Plugin  'mbbill/undotree'         "undo  操作
	Plugin  'skywind3000/asyncrun.vim'  "异步操作

# other
	nnoremap <leader>tb :TagbarToggle<CR>        "设置关闭和打开tagbar窗口的快捷键

	"F2开启和关闭树"
	map <F2> :NERDTreeToggle<CR>
	map <leader>nt :NERDTree<CR>
# fastkey
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
	"autocmd! bufwritepost _vimrc source c:/vim/_vimrc
	map <S-F> <ESC>:%!astyle --style=ansi -U -p -f<CR>

	" map for completion see :help ins-completion for whole completions
	" search tags
	inoremap <unique> <c-]> <C-X><C-]>
	" search in current files, preview first. remove the original c-p
	"inoremap <un<c-p> <C-X><C-P>ique>
	map  <leader>bc :bot cw<cr>
	map  <leader>f :vim /<c-r><c-w>/*.cpp *.h *.py<cr>
	map  <C-F5> :vim /<c-r><c-w>/*.cpp *.h *.py <cr>

# cscope
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
	* cscope -R
	* cs.py
		s: 查找C语言符号，即查找函数名、宏、枚举值等出现的地方
		g: 查找函数、宏、枚举等定义的位置，类似ctags所提供的功能
		d: 查找本函数调用的函数
		c: 查找调用本函数的函数
		t: 查找指定的字符串
		e: 查找egrep模式，相当于egrep功能，但查找速度快多了
		f: 查找并打开文件，类似vim的find功能
		i: 查找包含本文件的文件

#run python
	"  run python
	"autocmd BufNewFile,BufRead *.py nmap <leader>cp :w <cr>:AsyncRun -raw python %<cr>
	autocmd BufNewFile,BufRead *.py nmap <m-p> :w <cr>:AsyncRun -raw python %<cr>
	autocmd BufNewFile,BufRead *.py nmap <F12> :w <cr>:!python %<cr>
	"autocmd BufNewFile,BufRead *.py nmap <C-r> :w <cr>:!python %<cr>
	autocmd BufNewFile,BufRead *.py nmap <m-r> :w <cr>:!python %<cr>
	map <leader>as :AsyncStop<cr>
	nnoremap <leader>u :UndotreeToggle<cr>


	map <F5> :call CompileRunGcc()<CR>
	map <m-m> :call CompileRunGcc()<CR>

	map <leader>da :DoxAuthor<CR>
	map <leader>df :Dox<CR>
	map <leader>db :DoxBlock<CR>
	map <leader>dc a /* */<LEFT><LEFT><LEFT>


	vim /word/ *.py
	Plugin 'tpope/vim-commentary' "快速注释 gc gcc

# 重复操作
	map <Leader><leader>h <Plug>(easymotion-linebackward)
	map <Leader><Leader>j <Plug>(easymotion-j)
	map <Leader><Leader>k <Plug>(easymotion-k)
	map <Leader><leader>l <Plug>(easymotion-lineforward)
	" 重复上一次操作, 类似repeat插件, 很强大
	map <Leader><leader>. <Plug>(easymotion-repeat)

