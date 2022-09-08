# Initial vim setting

## Overview
``` ~/.vimrc ``` 파일을 편집해서 vim 에디터의 설정을 바꿀 수 있다.

## 기본 세팅

### **Syntax highlighting**
```
if has ("Syntax")
    syntax on
endif
```

### **colorscheme(테마) - iceberg**
1. 원하는 테마를 다운받는다. (github에서 바로 다운 받는 경우,  ```iceberg.vim``` 파일을 다운받으면 된다.)
2. 테마 파일을 ```~/.vim/colors``` 폴더 안에 넣는다. </br>
(처음 설정 하는 것이라면 본 폴더가 없을텐데, 그럴때는 폴더를 따로 만들어주면 된다.)
```
~$
mkdir .vim
cd .vim
mkdir colors

Downloads $
cp iceberg.vim ~/.vim/colors
```
3. ``` ~/.vimrc ``` 파일에서 colorscheme을 설정해준다. </br>
(iceberg라는 colorscheme을 사용했다.)
```
colorscheme iceberg
```
* 더 많은 colorscheme은 구글에 ```vim colorscheme```을 검색하면 나온다.
</br>

### **줄 번호 표시**
```
set nu
```
= ```set number```
</br>

### **자동 인덴트**
```
set ai
set ci
set si
set paste
set pastetoggle=<F2>
```
= ```set autoindent``` (새로운 line 추가 시, 이전 line의 들여쓰기에 맞춤), </br>
= ```set cindent``` (C 형태의 자동 인덴트), </br>
= ```set smartindent``` (if, for와 같은 것을 입력하고 다음 line으로 넘어갈 시의 들여쓰기)</br>
```set paste```: set ai, set si등으로 인해 붙여넣기를 하면 계단현상이 나타날 수 있는데, 이것을 방지해준다.</br>
```set pastetoggle=<F2>```: paste 옵션이 적용되면 들여쓰기 옵션이 제대로 작동하지 않기 때문에, toggle식으로 옵션을 키고 끌 수 있다. </br>

### **인덴트 너비**
아래의 코드는 각각 tab의 너비, tab 키를 눌렀을 때 이동하는 너비, 자동 인덴트할 때의 너비를 설정해준다.
```
set ts=4
set sts=4
set sw=4
```
= ```set tabstop``` (하나의 tab을 몇 칸으로 할 것인지), </br>
= ```set softtabstop``` (tab키를 눌렀을 때 몇 칸을 이동할 것인지), </br>
= ```set shiftwidth``` (<<, >>으로 들여쓰기 시 몇 칸을 이동할 것인지), </br>

### **상태바표시**
화면 하단에 현재 상태 정보를 보여줄 것인지 설정해준다. </br>
0: never, 1: 화면 분할 시에만, 2: always
```
set ls=0
```
= ```set laststatus=0``` </br>

### **괄호쌍 표시**
현재 선택한 괄호쌍을 표시해준다.
```
set sm
```
= ```set showmatch``` </br>


### **검색 결과에 highlight 표시**
```
set hls
```
= ```set hlsearch```
* 위에 colorscheme을 설치했으면 colorscheme에 맞는 색상으로 highlight가 되어있을 것이고, 설치하지 않았다면 노란색으로 highlight 되어있을것이다.
* 혹시 몰라 첨부하자면, vim에서 검색은 esc를 누른 뒤, ```/a``` 로 하면 된다. (a를 검색할 때)
</br>

### **검색 시 대소문자 구분 안함**
```
set ic
set scs
```
= ```set ignorecase``` </br>
= ```set smartcase``` (ignore이 켜져있어도 검색어에 대문자가 있다면 정확히 일치하는 문자열을 찾는다.)</br>

### **찾는 글씨를 칠 때 마다 찾은 내용 표시**
```
set incsearch
```

### **기타 설정** 
백스페이스로 지울 때 tab 단위로 삭제한다.
```
set smarttab
```
너무 길어서 화면에 전부 표시할 수 없는 줄의 경우, 다음 줄로 자동 줄바꿈해서 표시해준다.
```
set wrap
```

커서 위치 정보(우측 하단에 줄번호와 행번호)를 보여준다.
```
set ruler
```

마지막으로 수정된 곳에 커서를 위치한다.
```
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
```

### **Encoding 설정**
```
set fileencodings=utf8,euc-kr
```
vim 파일을 열 때, 그 파일의 인코딩 방식에 맞춰서 열게 해준다.



### 최종 ``` ~/.vimrc ``` 파일

```
if has("syntax")
    syntax on
endif

colorscheme iceberg

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
```

### 참고:
* https://hongsii.github.io/2018/01/29/vim_configuration/
* https://hyoje420.tistory.com/51
