" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set incsearch		" Incremental search
set background=dark
set mouse=a
set number
set ruler
set backspace=2
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P


"hightlight satus line"
highlight StatusLine ctermfg=blue ctermbg=black

filetype plugin on

autocmd FileType c,cpp :set cindent

nmap <tab> ==
nmap <F12> ggVG=
"vmap <C-c> :s/^/\/\//<CR>
"vmap <C-C> :s/^\([ \t]*\)\/\//\1/<CR>
"set backspace=indent,eol,start

"remap commands
command! Q q " Bind :Q to :q
command! Qall qall 


au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

" mv text typed by mistake on inset mode to normal mode"
inoremap <F2> <ESC>u@. 

"do autocorrect word"
:source ~/.vim/plugin/autocorrect.vim 


"moving lines of text up and down using ctrl arrow key"
function! MoveLineUp()
  call MoveLineOrVisualUp(".", "")
endfunction

function! MoveLineDown()
  call MoveLineOrVisualDown(".", "")
endfunction

function! MoveVisualUp()
  call MoveLineOrVisualUp("'<", "'<,'>")
  normal gv
endfunction

function! MoveVisualDown()
  call MoveLineOrVisualDown("'>", "'<,'>")
  normal gv
endfunction

function! MoveLineOrVisualUp(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num - v:count1 - 1 < 0
    let move_arg = "0"
  else
    let move_arg = a:line_getter." -".(v:count1 + 1)
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualDown(line_getter, range)
  let l_num = line(a:line_getter)
  if l_num + v:count1 > line("$")
    let move_arg = "$"
  else
    let move_arg = a:line_getter." +".v:count1
  endif
  call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! MoveLineOrVisualUpOrDown(move_arg)
  let col_num = virtcol(".")
  execute "silent! ".a:move_arg
  execute "normal! ".col_num."|"
endfunction

nnoremap <silent> <C-Up> :<C-u>call MoveLineUp()<CR>
nnoremap <silent> <C-Down> :<C-u>call MoveLineDown()<CR>
inoremap <silent> <C-Up> <C-o>:<C-u>call MoveLineUp()<CR>
inoremap <silent> <C-Down> <C-o>:<C-u>call MoveLineDown()<CR>
vnoremap <silent> <C-Up> :<C-u>call MoveVisualUp()<CR>
vnoremap <silent> <C-Down> :<C-u>call MoveVisualDown()<CR>



" adding headers to files ------ NEEDS SOME WORK" 
autocmd bufnewfile *.c so /home/jsmith/c_header.txt
autocmd bufnewfile *.c exe "1, " . 10 . "g/File Name
: .*/s//File Name : " .expand("%") 
autocmd bufnewfile *.c exe "1, " .10 . "g/Creation Date
: .*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre, filewritepre *.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.c exe "1," . 10 .
"g/Last Modified :.*/s/Last Modified :.*/Last Modified 
": " .strftime("%c")
"autocmd bufwritepost, filewritepost *.c execute "normal `a"

:vnoremap < <gv
:vnoremap > >gv


"vim script to toggle syntax on
"function! ToggleSyntax()
"   if exists("g:syntax_on")
"        syntax off
"    else
"        syntax enable
"    endif
"endfunction


"function toggle spell check
let b:myLang=0
let g:myLangList=["nospell","en_gb"]
function! ToggleSpell()
    let b:myLang=b:myLang+1
    if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
    if b:myLang==0
        setlocal nospell
    else
        execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
    endif
    echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> ;s :call ToggleSpell()<CR>

"Pathogen load 
filetype off 
call pathogen#infect()
call pathogen#helptags()

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

"html mode options
let g:html_tag_case = 'lowercase'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH " ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
 au FileType javascript call JavaScriptFold()
 au FileType javascript setl fen
 au FileType javascript setl nocindent

au FileType javascript imap <c AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH " ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


"Word auto complete
:autocmd BufEnter * call DoWordComplete() 
 
"python-mode options

  " Enable python folding
let g:pymode_folding = 0
let g:pymode_lint_ignore = "WW"


