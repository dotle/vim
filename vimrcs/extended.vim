
" ------------------------------------------------------------------
" code
" ------------------------------------------------------------------
au BufRead,BufNewFile  *.asm,*.c,*.cpp,*.java,*.cs,
			\*.sh,*.lua,*.pl,*.pm,*.py,
			\*.rb,*.erb,*.hs,*.vim,*.ino,*.go,*.h,*.pyw
            \ setlocal softtabstop=4|
            \ setlocal cul|
            \ setlocal cc=80 |
            \ setlocal textwidth=79
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.ino,*.go,*.vim,*.java,*.cs,*.asm match BadWhitespace /\s\+$/
nmap <leader>pv :source %<CR>
" nmap <leader>wc <C-W>c

" hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
" \ 2match Underlined /.\%81v/|
" \ match BadWhitespace /\s\+$/|

" ------------------------------------------------------------------
" python
" ------------------------------------------------------------------
au BufNewFile,BufRead *.py
\ setlocal textwidth=79 |
\ setlocal autoindent |
" \ setlocal cc=80
" \ setlocal cursorcolumn

let python_highlight_all=1

" ------------------------------------------------------------------
" md txt tmp wiki
" ------------------------------------------------------------------
"设置折行 不自动换行
au BufNewFile,BufRead *.txt,*.md,*.tmp,*.wiki,*.markdown
\ setlocal wrap

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
nmap <leader>fs :w!<cr>
nmap <leader>fa :wall<cr>
nmap <leader>fh :nohlsearch<CR>
map <leader>fx :%!xxd -g 1<cr>
map <leader>fn :%!xxd -r<cr>
nmap <leader>ft :terminal<cr>
map  <leader>ff :vim /<c-r><c-w>/ **/*.cpp **/*.h **/*.py **/*.c<cr>:copen<cr>
map  <leader>fF :vim // **/*.*<left><left><left><left><left><left><left><left>
map  <C-F5> :vim /<c-r><c-w>/ **/*.cpp **/*.h **/*.py **/*.c<cr>:copen<cr>
" When pressing <leader>ed switch to the directory of the open buffer
" cros to cd
nmap <leader>ed :cd %:p:h<cr>

nmap <leader>tg <C-W>}
" programming related
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <leader>tc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <silent> <F4> :A<CR>
" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :bd%<cr>
nmap <leader>bu :unhide<cr>

map<leader>ee :e! $VIMRUNTIME/../_vimrc<cr>
map<leader>eb :e! $VIMRUNTIME/../vimrcs/basic.vim<cr>
map<leader>ex :e! $VIMRUNTIME/../vimrcs/extended.vim<cr>
map<leader>ep :e! $VIMRUNTIME/../vimrcs/plugins.vim<cr>
map<leader>ew :setlocal wrap<cr>
map<leader>eW :setlocal nowrap<cr>
"autocmd! bufwritepost _vimrc source c:/vim/_vimrc
map <S-F> <ESC>:%!astyle --style=ansi -U -p -f<CR>
nmap <leader>pf <ESC>:%!astyle --style=ansi -U -p -f<CR>
" map for completion see :help ins-completion for whole completions
" search tags
inoremap <unique> <c-]> <C-X><C-]>
" search in current files, preview first. remove the original c-p
inoremap <unique> <c-p> <C-X><C-P>
inoremap <unique> <m-o> <C-X><C-O>
" inoremap <unique> <c-o> <C-X><C-O>
" mapping
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <expr> <C-U>      pumvisible()?"\<C-E>":"\<C-U>"

map  <leader>qc :cclose<cr>
map  <leader>qo :bot copen<cr>

"  run python
autocmd BufNewFile,BufRead *.py nmap <F12> :w <cr>:!python %<cr>

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

" ------------------------------------------------------------------
" tags
" ------------------------------------------------------------------
"set tags=./.tags;,.tags
set tags+=./tags,./../tags,./**/tags,tags " which tags files CTRL-] will find
set makeef=error.err " the errorfile for :make and :grep

"------------------------------------------------------------
" arduino
"------------------------------------------------------------
au BufNewFile,BufRead *.ino set filetype=c

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
