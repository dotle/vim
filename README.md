
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
```
 md c:\vim
 cd c:\vim
 git clone https://github.com/dotle/vim.git
```

# Tools install 
## Vimtools
1. rd ( **add to path**)
    * rd.exe
2. fzf ( **add to path**)
    * fz.exe
3. tags ( **add to path**)
    * ctags(uctags)
        + ctags.exe
    * gtags
        + gtags.exe
        + gtags-cscope.exe

## Others
1. lsp
    * python-language-server
        + pip install pyls
    * c&cpp
        + install clang(llvm)   
             LLVM-8.0.0-win32.exe 
    * java
        + unzip eclipse.jdt.ls.rar to ~\lsp\eclipse.jdt.ls
    * go 
        + go-langserver
2. ALE-Lint
    * cppcheck(install)
        + cppcheck-1.80-x86-Setup.msi
    * c#
        + OmniSharp
    * golint
    * stylelint
    * eslint
    * shellcheck
3. omnisharp(install or copy) 
    * install  
        OmniSharpInstall
    * or copy  
        unzip omnisharp-win-x64.zip to    
        `AppData\Local\omnisharp-vim\omnisharp-roslyn`
