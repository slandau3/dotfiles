call plug#begin('~/.vim/plugged')
" I honestly don't know how I feel about syntastic. It does make it slightly
" slow but I'm honeslty not sure if I notice it but I'm also not sure if I
" really need it. 
"Plug 'valloric/youcompleteme'

Plug 'bling/vim-airline'
"
" ctrlp https://github.com/ctrlpvim/ctrlp.vim
"Plug 'kien/ctrlp.vim'

"Plug 'tacahiroy/ctrlp-funky'

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

"Plug 'scrooloose/syntastic'
Plug 'junegunn/goyo.vim'

Plug 'davidhalter/jedi-vim'

Plug 'pangloss/vim-javascript'

Plug 'wannesm/wmgraphviz.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'nightsense/office'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-fireplace'

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'

"Plug 'mileszs/ack.vim'

Plug 'christoomey/vim-tmux-navigator'

" Code snippets
Plug 'SirVer/ultisnips'

Plug 'w0rp/ale'

"Plug 'dhruvasagar/vim-table-mode'
call plug#end()


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

"Tag stuff
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
"let g:ackprg = 'rg --vimgrep'
set grepprg=rg\ --vimgrep
set rtp+=~/.fzf

" status bar
set laststatus=2
"
" base 16 color settings
"set background=dark
"let base16colorspace=256
"colorscheme office-dark

"let g:office_dark_CursorLineNr = 'off'
"let g:office_dark_LineNr = 'off'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"colorscheme base16-macintosh
"Stop trying to be vi
set nocompatible

"auto completion for files
set path+=**

" tab and indent settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set autoindent
set ignorecase
set incsearch

set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
" highlight line where the cursor is
" set cursorline
" set cursorcolumn

" column limit
"set colorcolumn=80

" enables mouse support
set mouse=r

" enable linenumbers
set number

" backspace support
set backspace=indent,eol,start

" auto reload file when changed
set autoread
set autowrite       " Automatically save before commands like :next and :make
" onedark stuff
" let g:onedark_terminal_italics = 1

set undofile

set clipboard=unnamed
"make space leader
let mapleader=" "

" tagbar
nnoremap <Leader>tb :TagbarToggle<Cr>

"fzf stuff
nmap <Leader>ff :Files<Cr>
nmap <Leader>tt :Tags<Cr>
nmap <Leader>ji :BTags<Cr>
nmap <Leader>bb :Buffers<Cr>

" Clear highlighted stuff
nnoremap <Leader>sc :noh<Cr>

" move vertically by visual line
" Used when you have a line that wraps
nnoremap j gj
nnoremap k gk

" Let me go back to normal mode with jk
inoremap jk <Esc>
nnoremap <Leader>fs :w<cr>
cmap ;< \<\><Left><Left>
cmap ;( \(\)<Left><Left>
cnoremap <C-l> <Right><Right>
cnoremap <C-h> <Left><Left>

"Nerdtree stuff
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


syntax on
" colorscheme onedark

"" restore cursor when re-editing a file
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand(":p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |
    \   endif |
    \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END

" For some reason copy and paste dont work properly so this fixds it
 function! ClipboardYank()
   call system('pbcopy', @@)
 endfunction
 function! ClipboardPaste()
   let @@ = system('pbpaste')
 endfunction

"vnoremap <silent> y y:call ClipboardYank()<cr>
"vnoremap <silent> d d:call ClipboardYank()<cr>
"nnoremap <silent> p :call ClipboardPaste()<cr>p

" Linting stuff (ALE)
let g:ale_fix_on_save = 1

packloadall
silent! helptags ALL
