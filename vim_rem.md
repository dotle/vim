# jedi-vim
    * Completion <C-Space>
    * Goto assignments <leader>g (typical goto function)
    * Goto definitions <leader>d (follow identifier as far as possible, includes imports and statements)
    * Show Documentation/Pydoc K (shows a popup with assignments)
    * Renaming <leader>r
    * Usages <leader>n (shows all the usages of a name)
    * Open module, e.g. :Pyimport os (opens the os module)
# ��������
	* ��ĩ��$
	* ���ף�^
	* �ո�\s
	* ��ĩ�ո�\s\+$
	* ���׿ո�^\+\s
	* ��ȫ
		- ���в�ȫ                        CTRL-X CTRL-L
		- ���ݵ�ǰ�ļ���ؼ��ֲ�ȫ        CTRL-X CTRL-N
		- �����ֵ䲹ȫ                    CTRL-X CTRL-K
		- ����ͬ����ֵ䲹ȫ              CTRL-X CTRL-T
		- ����ͷ�ļ��ڹؼ��ֲ�ȫ          CTRL-X CTRL-I
		- ���ݱ�ǩ��ȫ                    CTRL-X CTRL-]
		- ��ȫ�ļ���                      CTRL-X CTRL-F
		- ��ȫ�궨��                      CTRL-X CTRL-D
		- ��ȫvim����                     CTRL-X CTRL-V
		- �û��Զ��岹ȫ��ʽ              CTRL-X CTRL-U
		- ƴд����                        CTRL-X CTRL-S 
	* �ո�ɾ��
		��Щ����Ϊ��ĩ�Ŀո������ã��˷Ѷ��ѿ��ġ�Ҫɾ����Щÿ�к������Ŀո񣬿���
		ִ���������
		:%s/\s\+$//
		"gf ���ļ�
# plugin
	Plugin  'tpope/vim-fugitive' "git ֧��
	Plugin  'bling/vim-airline' "״̬��
	Plugin  'fholgado/minibufexpl.vim'  "minibuf
	Plugin  'kien/ctrlp.vim' "c-p��������ڿ�����ת�ļ���buf
	Plugin  'scrooloose/nerdtree' "�ļ����鿴 <leader>nt F2
	Plugin  'terryma/vim-multiple-cursors'  "������� ѡ��֮��c-n  ȫѡ��c-n ��Ϊѡ��ͷ  vipΪȫѡ
	Plugin  'tpope/vim-surround'       "surro��ĩ��$


	��Щ����Ϊ��ĩ�Ŀո������ã��˷Ѷ��ѿ��ġ�Ҫɾ����Щÿ�к������Ŀո񣬿���
	ִ���������

	:%s/\s\+$//und cs ds....
	Plugin  'mbbill/undotree'         "undo  ����
	Plugin  'skywind3000/asyncrun.vim'  "�첽����

# other
	nnoremap <leader>tb :TagbarToggle<CR>        "���ùرպʹ�tagbar���ڵĿ�ݼ�

	"F2�����͹ر���"
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
		s: ����C���Է��ţ������Һ��������ꡢö��ֵ�ȳ��ֵĵط�
		g: ���Һ������ꡢö�ٵȶ����λ�ã�����ctags���ṩ�Ĺ���
		d: ���ұ��������õĺ���
		c: ���ҵ��ñ������ĺ���
		t: ����ָ�����ַ���
		e: ����egrepģʽ���൱��egrep���ܣ��������ٶȿ����
		f: ���Ҳ����ļ�������vim��find����
		i: ���Ұ������ļ����ļ�

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
	Plugin 'tpope/vim-commentary' "����ע�� gc gcc

# �ظ�����
	map <Leader><leader>h <Plug>(easymotion-linebackward)
	map <Leader><Leader>j <Plug>(easymotion-j)
	map <Leader><Leader>k <Plug>(easymotion-k)
	map <Leader><leader>l <Plug>(easymotion-lineforward)
	" �ظ���һ�β���, ����repeat���, ��ǿ��
	map <Leader><leader>. <Plug>(easymotion-repeat)

