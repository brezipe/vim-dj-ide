set encoding=utf-8
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


Bundle 'airblade/vim-gitgutter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'davidhalter/jedi-vim'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-easymotion'
" require: sudo apt-get install xdotool
Bundle 'lordm/vim-browser-reload-linux'  
Bundle 'majutsushi/tagbar'
Bundle "mattn/emmet-vim"
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'

filetype plugin indent on
syntax on

" theme
set t_Co=256
"set term=xterm-256color
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
highlight clear SignColumn
autocmd ColorScheme * highlight clear SignColumn

set cursorline

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80

" gvim customizations
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r
set guifont=Ubuntu\ Mono\ 12

" Automatic reloading of .vimrc
"" autocmd! bufwritepost .vimrc source %
au BufWritePost .vimrc so ~/.vimrc

cmap w!! %!sudo tee > /dev/null %

" =============================================================================
" uncertainces
" =============================================================================
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"==============================================================================

" Esc by press jk or kj
inoremap jk <Esc>
inoremap kj <Esc>

let mapleader = ","

nnoremap <leader>ev :tabedit $MYVIMRC<cr>

" @@ to repeat macro
map Q @@

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


set history=1000
set undolevels=1000


" nice list
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

set tabstop=4
set shiftwidth=4
"set softtabstop=4
"set shiftround
"set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


:nmap <c-h> :tabprevious<cr>
:nmap <c-l> :tabnext<cr>
":nmap <C-S-tab> :tabprevious<cr>
":nmap <C-tab> :tabnext<cr>
":nmap <C-t> :tabnew<cr>
":map <C-t> :tabnew<cr>
":map <C-S-tab> :tabprevious<cr>
":map <C-tab> :tabnext<cr>
":map <C-w> :tabclose<cr>
":imap <C-S-tab> <ESC>:tabprevious<cr>i
":imap <C-tab> <ESC>:tabnext<cr>i
":imap <C-t> <ESC>:tabnew<cr>


" moving lines by holding alt
noremap <A-j> :m+<CR>
noremap <A-k> :m-2<CR>
inoremap <A-j> <Esc>:m+<CR>
inoremap <A-k> <Esc>:m-2<CR>
vnoremap <A-j> :m'>+<CR>gv
vnoremap <A-k> :m-2<CR>gv


" pro skakani na zacatek/konec radku v normal modu
noremap H ^
noremap L $


nmap t o<ESC>k
nmap T O<ESC>j


" =============================================================================
" Python IDE Setup
" =============================================================================
" python mode
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = 'ipdb'
let g:pymode_folding = 0

" disable ropes autocomplete for jedi
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0

let g:pymode_lint_cwindow = 0
let g:pymode_lint_write = 0
let g:pymode_lint = 0

" vim-jedi
let g:jedi#popup_select_first = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 0  " buggy with history
map <leader>p :Pyimport 
let g:jedi#usages_command="<leader>u"


" Ack
nmap <leader>a <Esc>:Ack!


" gundo
nnoremap <leader>h :GundoToggle<CR>


" ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
map <leader>t :CtrlPBufTag<CR>


" tagbar
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>


" nerdtree
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']


" vim-flake8 -- depends on flake8!
"autocmd BufWritePost *.py call Flake8()


" syntastic
"let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers = ['jshint']


" airline
set laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
" Short form mode text
let g:airline_mode_map = {
\ '__' : '-',
\ 'n' : 'N',
\ 'i' : 'I',
\ 'R' : 'R',
\ 'c' : 'C',
\ 'v' : 'V',
\ 'V' : 'V-L',
\ '' : 'V-B',
\ 's' : 'S',
\ 'S' : 'S-L',
\ '' : 'S-B',
\ }

"
" UltiSnips
let g:UltiSnipsRemoveSelectModeMappings = 1
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

imap <silent><C-j> <C-R>=OmniPopup('j')<CR>
imap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" =============================================================================
" utils
" =============================================================================
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)


" function for move tabs
function! ShiftTab(direction)
     let tab_number = tabpagenr()
     if a:direction == 0
         if tab_number == 1
             exe 'tabm' . tabpagenr('$')
         else
             exe 'tabm' . (tab_number - 2)
         endif
     else
         if tab_number == tabpagenr('$')
             exe 'tabm ' . 0
         else
             exe 'tabm ' . tab_number
         endif
     endif
     return ''
endfunction

"inoremap <silent> <C-S-Left>  <C-r>=ShiftTab(0)<CR>
"inoremap <silent> <C-S-Right>  <C-r>=ShiftTab(1)<CR>

" shifting tabs
noremap <silent> <C-S-Left>  :call ShiftTab(0)<CR>
noremap <silent> <C-S-Right> :call ShiftTab(1)<CR>
"==============================================================================
