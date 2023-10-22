if has("syntax")
    syntax on
endif

set nu
set ai
set ci
set si
set paste
set pastetoggle=<F2>
set ts=4
set sts=4
set sw=4
set ls=0
set sm
set hls
set ic
set scs
set incsearch
set smarttab
set wrap
set ruler
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

set fileencodings=utf8,euc-kr
