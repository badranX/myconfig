call plug#begin(stdpath('data') . '/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'samjwill/nvim-unception'
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

"list all terminal buffers
"echo join(map(filter(nvim_list_bufs(), {i,v -> getbufvar(v,"&buftype") == 'terminal'}), {i,v -> [v,getbufvar(v,"term_title")]}), "\n")

"fixing tmux colors
"highlight Normal guibg=none guifg=none
set termguicolors
"colorscheme morning
colorscheme default
"colorscheme darkblue
"colorscheme delek
"colorscheme industry

" Enable syntax highlighting 
syntax on

" Important!! 
set termguicolors 

"No idea
filetype plugin on

"omnifunc autocompletion
set omnifunc=syntaxcomplete#Complete

"source  ~/.config/nvim/lsp.vim
"source  ~/.config/nvim/my_nvim_cmp.vim

"let fc['.*'] = { 'takeover': 'always' }
""end firenvim
nnoremap <SPACE> <Nop>
let mapleader=" "

"basic remap
"remap regex $ ^
" 
nnoremap <silent><nowait> [ $
nnoremap <silent><nowait> ] ^

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'$'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.'^'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType * call MakeBracketMaps()
augroup END


"cursor similar to VI
"set guicursor=

"Terminal
nnoremap <Leader>t :!alacritty & disown<CR> 
"set splitbelow
cabbrev sterm belowright split +terminal
cabbrev st execute 'belowright sb ' . filter(map(getbufinfo(), 'v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')[0]

"TERMINAL
"nnoremap C-w <ESC>C-w
tnoremap <ESC> <C-\><C-n>

"nnoremap <C-k> <ESC>
inoremap <C-q> <ESC>
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
set mouse=
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
"nnoremap j <Nop>
"nnoremap k <Nop>
"nnoremap h <Nop>
"nnoremap l <Nop>
"nnoremap <expr> k v:count ? 'j' : 'gj'
"nnoremap <expr> l v:count ? 'k' : 'gk'
"nnoremap  L l
"nnoremap  H h
"
"vnoremap <expr> k v:count ? 'j' : 'gj'
"vnoremap <expr> l v:count ? 'k' : 'gk'
"vnoremap  L l
"vnoremap  H h

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

"maps
"nnoremap j h
"nnoremap k j
"nnoremap l k
"nnoremap ; l
"nnoremap h ;
"
"vnoremap j h
"vnoremap k j
"vnoremap l k
"vnoremap ; l
"vnoremap h ;
"sudo keyd reload"


nnoremap gb :buffers<CR>:buffer<Space>
nnoremap gt :echo join(map(filter(nvim_list_bufs(), {i,v -> getbufvar(v,"&buftype") == 'terminal'}), {i,v -> [v,getbufvar(v,"term_title")]}), "\n")<CR>:buffer<Space>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>
nnoremap <Space>T v:val.bufnr'), 'getbufvar(v:val, "&buftype") is# "terminal"')[0] <CR>


"nnoremap <Space>f :execute<Space>"terminal"<Space>|<Space>file<Space>MYTERMINAL<CR>

"autocmd VimEnter * execute "terminal" | execute "file MYTERMINAL" | execute "bprevious"
"augroup MyTermMappings
"  autocmd!
"autocmd TermOpen * nnoremap <buffer> <Space><Space> :b#<CR>
"augroup END

nnoremap <Space><Space> :b MYTERMINAL<CR>
command Myterm execute "terminal" | file MYTERMINAL | execute "bprevious"
autocmd VimEnter * execute "terminal" | execute "file MYTERMINAL" | nnoremap <buffer> <Space><Space> :b#<CR> | execute "bprevious"


""""LSP"""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

call lsp#disable_diagnostics_for_buffer()
