" pathogen
execute pathogen#infect()

" colorscheme
set background=dark
let base16colorspace=256
let g:base16_shell_path="~/.config/base16-shell"
colorscheme base16-default

" disable default markdown folding
let g:vim_markdown_folding_disabled=1

" enable syntax highlighting
syntax on

" enable mouse if we have one
if has('mouse')
  set mouse=a
endif

" enable paste mode
set paste

" indentation and tabs
filetype plugin indent on
set nosmartindent
set expandtab
set shiftwidth=4
set softtabstop=4

" smart backspace (delete past EOL, indentations, ...)
set backspace=2

" enable linenumbers
set number

" mark current line and 80th column
set cursorline
set colorcolumn=80

" statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

" yaml specific settings
au FileType yaml call DisableIndent()
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2

" use markdown syntax highlighting in txt files
au! BufNewFile,BufRead *.txt set ft=mkd

" keymaps
nmap \e :NERDTreeToggle<CR>

" create new autocommand group
aug PerDirectoryTabs
    " clear all autocommands first
    au!
    " one directory per line do use standard tabs
    au BufRead,BufEnter,BufNewFile ~/src/multipath-tools/* call SetStandardTabs()
aug END

"
" Functions
"

" disable indentation
function! DisableIndent()    
    set autoindent&
    set cindent&
    set smartindent&
    set indentexpr&
endfunction 

" override tab settings
function! SetStandardTabs()
    set noexpandtab
    set tabstop=8
    set softtabstop=4
endfunction
