inoreabbrev bgf \begin{frame}<CR><CR>\end{frame}<ESC>{ko
inoreabbrev bgb \begin{block}<CR><CR>\end{block}<ESC>{ko\item<SPACE> 
inoreabbrev bgi \begin{itemize}<CR><CR>\end{itemize}<ESC>{ko\item<SPACE>  
inoreabbrev bge \begin{enumerate}<CR><CR>\end{enumerate}<ESC>{ko\item<SPACE>  
inoreabbrev bgg \begin{}<CR><CR>\end{}<ESC>{kf}i

"to write without shift
"inoremap ] }
"inoremap [ {
"inoremap { [
"inoremap } ]

inoremap 42 $
inoremap 44 \
inoremap 45 } 
inoremap 43 { 
inoremap ** ^{<SPACE>}<SPACE><ESC>hhi
inoremap ; }{<SPACE>}<SPACE><ESC>hhi


nnoremap <Leader>4 i$<ESC>la$<ESC>

vnoremap <Leader>4 da$$<ESC>hp
vnoremap <Leader>5 da{<SPACE>}<ESC>hi<C-r>"<ESC>%


"spell check
setlocal spell
setlocal spelllang=en
