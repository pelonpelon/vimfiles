set nocompatible               " be iMproved
filetype off                   " required!

"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"Bundle 'pathogen'
" let Vundle manage Vundle
" required! 
"Bundle 'gmarik/vundle'
" github
"Bundle 'tpope/vim-rails.git'
"Bundle 'tpope/vim-haml.git'
" vim-scripts repos
"Bundle 'The-NERD-Tree'
"Bundle 'Ack'
"Bundle 'ragtag'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'


"PLUGIN SETTINGS
"so ~/.vim/bundle/pathogen.vim/plugin/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
let g:ragtag_global_maps = 1 
"let NERDTreeIgnore=['\.rbc$', '\~$']
"map <f1> :NERDTreeToggle<CR>

filetype plugin indent on     " required! 

set cpoptions-=u
set history=1000

" Set encoding
set encoding=utf-8

" Formatting
set backspace=indent,eol,start " Backspacing FTW.
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set textwidth=0
"set list listchars=tab:\ \ ,trail:·

au FileType javascript setlocal ts=4 sts=4 sw=4
au FileType php setlocal ts=4 sts=4 sw=4
au FileType python setlocal ts=4 sts=4 sw=4

set foldmethod=syntax
set foldnestmax=2
set foldlevelstart=99

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class

syntax enable
syntax on

" Status bar
set laststatus=2
set number
set ruler
set novisualbell
set noerrorbells
"set vb t_vb=
"set list listchars=tab:▸\ ,eol:¬ " Show tabs and new line 'hidden' characters.


" Command-T configuration
let g:CommandTMaxHeight=20

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function! s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Mm <CR>
endfunction

"function! BundleConnect()
"  set runtimepath+=~/.vim/bundle/vundle
"  call vundle#rc()
"endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab
au FileType python                                   set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

au BufRead,BufNewFile *.txt call s:setupWrapping()

" save session
au VimLeave * mksession! /mnt/home/pelon/work/stud/session.vim

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

"FuzzyFinder
nmap <Leader>b :FufBuffer<CR>
nmap <Leader>j :FufJumpList<CR>
nmap <Leader>f :FufFile<CR>
nmap <Leader>d :FufDir<CR>
nmap <Leader>h :FufHelp<CR>
nmap <Leader>c :FufChangeList<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>ge :Gedit<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gm :Gmove<CR>
nmap <Leader>gr :Gremove<CR>
silent nmap <Leader>gg :Ggrep<space><cword><CR>:cope<CR>
nmap <Leader>gw :Gwrite<CR>
silent nmap <Leader>gl :Glog<CR>:cope<CR>
silent nmap <Leader>s :Ack<space><cword><CR>

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
so ~/.vim/bundle/vividchalk.vim/colors/vividchalk.vim

"Directories for swp files and backups
set nobackup

set statusline=%<%f\ %m\ %=%-20.(\ %y%r\ %{fugitive#statusline()}%)%-18.(\ %l/%L\ %v\ %)\ %P
" done
let g:loaded_vimrc = 1
so ~/.vim/vimrc.local
