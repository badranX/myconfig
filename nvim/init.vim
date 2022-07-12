call plug#begin(stdpath('data') . '/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'

"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

"fixing tmux colors
"highlight Normal guibg=none guifg=none
set termguicolors
"colorscheme morning
colorscheme darkblue
" Enable syntax highlighting 
syntax on

" Important!! 
set termguicolors 

"No idea
filetype plugin on

"omnifunc autocompletion
set omnifunc=syntaxcomplete#Complete

source  ~/.config/nvim/lsp.vim
"source  ~/.config/nvim/my_nvim_cmp.vim

"let fc['.*'] = { 'takeover': 'always' }
""end firenvim
nnoremap <SPACE> <Nop>
let mapleader=" "

"cursor similar to VI
set guicursor=

"Terminal
nnoremap <Leader>t :!alacritty & disown<CR> 

"noremap ; l
"noremap d k
"noremap f j
"noremap j h

"COPY-PASTE
vnoremap<Leader>y "+y
nnoremap<Leader>y "+y
vnoremap<Leader>p "+p
nnoremap<Leader>p "+p

"Crl W windows
noremap <Leader>w <C-w>

"TERMINAL
nnoremap <Leader>l yy<C-w>jiq<BS><C-u><C-\><C-n>pi<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>
vnoremap <Leader>l y<C-w>jpi<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>
vnoremap <Leader>t mz"+y<C-w>jiq<BS><C-u><C-\><C-n>i%paste<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>`z
"terminal esc
tnoremap <ESC> <C-\><C-n>

"TODO remove this
nnoremap <Leader>k yy<C-w>lGp<C-w><C-p>
"Tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt

"General Shared with vim
"shared with vim
set number
set relativenumber
set path+=**
set preserveindent
"finding files while ignoring case
set wildignorecase
"search indocument smartly!
set ignorecase
set smartcase


"Netrw
"netrw settings!!
let g:netrw_preview=1
"let g:netrw_browse_split=4
let g:netrw_winsize=20
let g:netrw_banner=0


""mouse and yanking to the computer clipboard on LINUX
set mouse=a
"set clipboard=unnamedplus
"always show status bar
set laststatus=2


"Indentation/indent
set autoindent
set cindent

"max line length
set colorcolumn=79

"Moving when wraping lines
"https://stackoverflow.com/a/21000307/191<CR>7082
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'

"Fixing vim visual mode highlight issue on alacritty
"https://github.com/alacritty/alacritty/issues/3402
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"

"visual mode paste: change default
function! SaveReg(cmd) abort
    let b:saved_reg = getreg('"')
    let b:saved_type = getregtype('"')
    return a:cmd.":\<C-U>call RestxyzoreReg()\r"
endfunction
function! RestoreReg() abort
    call setreg('"', b:saved_reg, b:saved_type)
    unlet b:saved_reg
    unlet b:saved_type
endfunction

xnoremap <silent> <expr> p SaveReg('p')
xnoremap <silent> <expr> P SaveReg('P')
