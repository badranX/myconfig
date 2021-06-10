call plug#begin('~/.config/nvim/plugged')
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'ton/vim-bufsurf'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

source ~/.config/nvim/mycoc.vim

nnoremap <Leader>l yy<C-w>jiq<BS><C-u><C-\><C-n>pi<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>
"""nnoremap <Leader>t vip"+y<C-w>jiq<BS><C-u><C-\><C-n>i%paste<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>
vnoremap <Leader>l y<C-w>jpi<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>
vnoremap <Leader>t mz"+y<C-w>jiq<BS><C-u><C-\><C-n>i%paste<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>`z
nnoremap <Leader>m 2yy<C-w>jGpG<C-\><C-n><C-w><C-p>

let cell = "#-------cell--------"
let cell = "#-------cell--------"

nnoremap <Leader>t mz?# + <CR>jV/\(# + \\|\%$\)<CR>k"+y<C-w>jiq<BS><C-u><C-\><C-n>i%paste<CR><C-\><C-n>i<C-\><C-n><C-w><C-p>`z:noh<CR>
nnoremap <Leader><Up> ?\(# + \\|\%^\)<CR>:noh<CR>
nnoremap <Leader><Down> /\(# + \\|\%$\)<CR>:noh<CR>
nnoremap <Leader>- i# + <ESC>:noh<CR>


nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt


"shared with vim
set number
set relativenumber
set path+=**
set preserveindent
"finding files while ignoring case
set wildignorecase

"NEW LINES IN NORMAL MODE
"Leader
nnoremap <Leader>g :w<CR>
"nnoremap <Leader>z :tabnew %<CR>


nnoremap <Leader>o o<Esc>
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

noremap <Leader>w <C-w>
noremap <Leader>u :
"terminal
tnoremap <ESC> <C-\><C-n>
"search indocument smartly!
set ignorecase
set smartcase

"""let $PAGER=''

"netrw settings!!
let g:netrw_preview=1
"let g:netrw_browse_split=4
let g:netrw_winsize=20
let g:netrw_banner=0
"
""mouse and yanking to the computer clipboard on LINUX
set mouse=a
"set clipboard=unnamedplus

"always show status bar
set laststatus=2


"cursor insert/normal
"autocmd InsertEnter,InsertLeave * set cul!
set cursorline
"idnentation/indent
set autoindent
set cindent

"no idea
syntax on
filetype plugin on
"<<<<

"<<<<drive
command Drive execute "!drive push --no-prompt %:p"
command DriveI execute "!drive push --no-prompt -ignore-conflict %:p"
command Drivef execute "!drive push --no-prompt -ignore-conflict --force %:p"

"<<<<drive_end


command -bang T :botright split <bar> normal :term<CR>i


"moving when wraping lines
"https://stackoverflow.com/a/21000307/1917082
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

vnoremap <expr> j v:count ? 'j' : 'gj'
vnoremap <expr> k v:count ? 'k' : 'gk'

