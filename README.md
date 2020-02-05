
# Dependenc
1. git
2. lsp
    * llvm
    * python-language-server
    * go
3. lint
    * pylint
    * clang(llvm) gcc and so on
    * golint
    * stylelint
    * eslint
    * shellcheck

# Install
1. cmd
```
 md c:\vim
 cd c:\vim
 git clone https://github.com/dotle/vim.git
```
2. copy **Vimtools** Dirctory. Add Path.
3. input `PlugInstall`。
4. install tools(option)
   * llvm(clangd)
   * Mingw
   * cppcheck
   * eclipse.jdt.ls
   * OmniSharp

# Tools install
## Vimtools
1. rd:  **rd.exe**
2. fzf:  **fzf.exe**
3. tags 
    * ctags(uctags): **ctags.exe**
    * gtags: **gtags.exe**, **gtags-cscope.exe**
4. AStyle:  **Astyle.exe**

## Others
1. lsp
    * python-language-server: **pyls**
        ```
        pip install pyls
        ```
    * c&cpp: **clang(llvm)**.  ***LLVM-8.0.0-win32.exe***
    * java: **eclipse.jdt.ls** 
        + unzip ***eclipse.jdt.ls.rar*** to `~\lsp\eclipse.jdt.ls`
    * go: **go-langserver**
2. ALE-Lint
    * cppcheck(install): ***cppcheck-1.80-x86-Setup.msi***
    * c#: OmniSharp
    * golint
    * stylelint
    * eslint
    * shellcheck
3. OmniShrp   (install or copy)
    * install: `OmniSharpInstall`
    * or copy

    unzip omnisharp-win-x64.zip to `~\AppData\Local\omnisharp-vim\omnisharp-roslyn`
4. Mingw
    * gcc g++ 
    * include 
    * lib
