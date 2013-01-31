filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => General  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Sets how many lines of history VIM has to remember  
set history=700  
  
" Enable filetype plugin  
filetype plugin on  
filetype indent on  
  
" Set to auto read when a file is changed from the outside  
set autoread  
 
" With a map leader it's possible to do extra key combinations  
" like <leader>w saves the current file  
let mapleader = ","  
let g:mapleader = ","  
  
" Fast saving  
nmap <leader>w :w!<cr>  
  
" Fast editing of the .vimrc  
map <leader>e :e! ~/.vim_runtime/vimrc<cr>  
  
" When vimrc is edited, reload it  
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => VIM user interface  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" Set 7 lines to the curors - when moving vertical..  
set so=7  
  
set wildmenu "Turn on WiLd menu  
  
set ruler "Always show current position  
  
set cmdheight=2 "The commandbar height  
  
set hid "Change buffer - without saving  
  
" Set backspace config  
set backspace=eol,start,indent  
set whichwrap+=<,>,h,l  
  
set ignorecase "搜索时忽略大小写  
set smartcase  
  
set hlsearch "开启搜索高亮  
  
set incsearch "输入搜索字符串的同时进行搜索  
set nolazyredraw "Don't redraw while executing macros   
  
set magic "Set magic on, for regular expressions  
  
set showmatch "Show matching bracets when text indicator is over them  
set mat=2 "How many tenths of a second to blink  
  
" No sound on errors  
set noerrorbells  
set novisualbell  
set t_vb=  
set tm=500  
  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Colors and Fonts  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
syntax enable "开启代码高亮  
  
func! MySys()  
  return "mac"  
endfunc  
  
" Set font according to system  
if MySys() == "mac"  
  set gfn=SimSun:h16  
  set shell=/bin/bash  
elseif MySys() == "windows"  
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10  
elseif MySys() == "linux"  
  set gfn=Monospace\ 10  
  set shell=/bin/bash  
endif    

colorscheme molokai

set number  
  
set encoding=utf-8  
set fileencodings=utf-8,chinese,latin-1  
  
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim  
  
try  
    lang en_US  
catch  
endtry  
  
set ffs=unix,dos,mac "Default file types  
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Text, tab and indent related  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
set expandtab  
set shiftwidth=4  
set tabstop=4  
set smarttab  
  
set lbr  
set tw=500  
  
set ai "Auto indent  
set si "Smart indet  
set wrap "Wrap lines  
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Parenthesis/bracket expanding  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
vnoremap $1 <esc>`>a)<esc>`<i(<esc>  
vnoremap $2 <esc>`>a]<esc>`<i[<esc>  
vnoremap $3 <esc>`>a}<esc>`<i{<esc>  
vnoremap $ <esc>`>a"<esc>`<i"<esc>  
vnoremap $q <esc>`>a'<esc>`<i'<esc>  
vnoremap $e <esc>`>a"<esc>`<i"<esc>  
  
" Map auto complete of (, ", ', [  
inoremap $1 ()<esc>i  
inoremap $2 []<esc>i  
inoremap $3 {}<esc>i  
inoremap $4 {<esc>o}<esc>O  
inoremap $q ''<esc>i  
inoremap $e ""<esc>i  
inoremap $t <><esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Programming Language setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu 

"python
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"  
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m  
autocmd BufRead *.py nmap <F5> :!python %<CR>  
  
autocmd BufRead *.py set tabstop=4  
autocmd BufRead *.py set nowrap  
autocmd BufRead *.py set go+=b  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""  
" => Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tlist
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
map <F3> :silent! Tlist<CR> 
let Tlist_Exit_OnlyWindow=1
"NerdTree
map <F2> :silent! NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
"EasyMotion
let g:EasyMotion_leader_key = ','
"Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_width = 30
"powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'
set t_Co=256
