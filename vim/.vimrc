""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VIM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" minimal -  true: no plugin / false: use plugin
let minimal=v:true

let mapleader = " "
let maplocalleader = "\\"

color industry
silent! color habamax

"" Options
set timeout timeoutlen=300
set clipboard=unnamed,unnamedplus
set mouse=a number norelativenumber cursorline
set ts=2 sw=2 sts=2
set autoindent smartindent expandtab smarttab
set ignorecase smartcase incsearch hlsearch noshowmatch
set nobackup writebackup swapfile undofile confirm
set iskeyword+=- backspace=indent,eol,start
set wrap linebreak showbreak=↪ whichwrap+=<,>,[,],h,l
set scrolloff=4 sidescrolloff=8
set nolist listchars=tab:→\ ,nbsp:␣,trail:•,space:⋅,extends:▶,precedes:◀,eol:↴
" set shortmess+=c
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.git/*

"" Avoid Alt trigger the menu on gVim/Windows
set winaltkeys=no


"" Disable some key
map <S-q> <Nop>
map <S-j> <Nop>
"map <S-k> <Nop>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" """"
"" Keymaps
"" """"
""          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang | ~
"" Command        +------+-----+-----+-----+-----+-----+------+------+ ~
"" [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
"" n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
"" [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
"" i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
"" c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
"" v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
"" x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
"" s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
"" o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
"" t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
"" l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |
""
"" Fast enter command-line
nnoremap ; :
"" """"
"" ESC key
"" """"
inoremap jk <ESC>
inoremap kj <ESC>
"" Tang do nhay nhan chuoi ESC
set ttimeout ttimeoutlen=50
"" ESC/mapping fast in Insert, normal if not in Insert-mode
"" ESC se thoat InsertMode nhanh hon
augroup FastEscOnlyInInsert
  autocmd!
  autocmd InsertEnter * set timeoutlen=139
  autocmd InsertLeave * set timeoutlen=300
augroup END
"" fix error 2;2R in vim. <ESC> -> nohl only in neovim
if has('nvim')
  ""nnoremap <silent> <ESC><ESC> :nohl<CR>
endif
nnoremap <leader><F12> :nohl<CR>
nnoremap <leader><DEL> :nohl<CR>

"" nnoremap <C-x> :q!<CR>
nnoremap <C-q> :q!<CR>
map <C-f> <Nop>
map <C-b> <Nop>
map <C-j> <Nop>

" Saving, also in Insert mode (<C-O> doesn't work well when using completions).
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>gi
" nnoremap <C-l><C-r> :source $HOME/.vimrc<CR>:echo ".vimrc reloaded"<CR>
" nnoremap <C-r><C-l> :source $HOME/.vimrc<CR>:echo ".vimrc reloaded"<CR>

"" """"
"" Clipboard
"" yank & copy register " to system clipboard, and you can user CTRL+SHIFT+V
""to paste to
xnoremap gy y:call system('xsel -i -b', getreg('"'))<CR>    ;"" yank & copy register " to system clipboard
"" Quick paste using + register
"" inoremap <C-r><C-r> <C-\><C-o>"+P
inoremap <C-r><C-e> <C-\><C-o>"+P
inoremap <C-e><C-r> <C-\><C-o>"+P
cnoremap <C-r><C-e> <C-r>+
cnoremap <C-e><C-r> <C-r>+
cnoremap <C-r><C-r> <C-r>+

"" enter visual-block mode, press v to enter visual mode then press c-\ to enter visual-block
"vnoremap <c-\> <c-v>

"" Toggle wrap, listchars & relativenumber
map <F5> :set relativenumber!<CR>
map <F7> :set wrap!<CR>:set wrap?<CR>
map <F8> :set list!<CR>:set list?<CR>
map <F12> :set paste!<CR>

"" """"
"" Buffer
"" """"
map <S-x> <Nop>
nnoremap <S-x> :bd!<CR>
"" Smart delete the buffer without messing the layout
command! BufferDelete bp | bd #
nnoremap <silent><S-x> :bp \| bd #<CR>
nnoremap <silent><S-x> :BufferDelete<CR>
"" """"
function! SmartBdelete()
  let l:buf = bufnr('%')

  " Switch away first to preserve layout
  if buflisted(l:buf)
    execute 'bp'
  endif

  " Terminal buffer?
  if getbufvar(l:buf, '&buftype') ==# 'terminal'
    execute 'bd!' l:buf
  else
    execute 'bd' l:buf
  endif
endfunction
nnoremap <silent><S-x> :call SmartBdelete()<CR>
"" """"
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
noremap <C-PageUp> :bp<CR>
noremap <C-PageDown> :bn<CR>
nnoremap ~ :b#<CR>
" nnoremap <M-`> :b#<CR>
" nnoremap <S-Tab> :b#<CR>
" nnoremap <leader>bb :ls<CR>:b<Space>
" nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"" """"
"" MOVE AROUND
""  in InsertMode & CommandMode
noremap! <C-j> <Nop>
noremap! <C-k> <Nop>
noremap! <C-h> <Nop>
noremap! <C-l> <Nop>
noremap! <M-j> <Nop>
noremap! <M-k> <Nop>
noremap! <M-h> <Nop>
noremap! <M-l> <Nop>
" cnoremap <C-j> <DOWN>
" cnoremap <C-k> <UP>
" noremap! <C-h> <LEFT>
" noremap! <C-l> <RIGHT>
"" Moving around text with Alt + jkhl
noremap! <M-j> <DOWN>
noremap! <M-k> <UP>
noremap! <ESC>j <DOWN>
noremap! <ESC>k <UP>
noremap! <M-h> <LEFT>
noremap! <M-l> <RIGHT>
noremap! <ESC>h <LEFT>
noremap! <ESC>l <RIGHT>

"" Better move through wrap line
noremap j g<DOWN>
noremap k g<UP>
" inoremap <C-j> <C-o>g<DOWN>
" inoremap <C-k> <C-o>g<UP>

"" Move around windows
nnoremap <C-h> <C-w><LEFT>
nnoremap <C-l> <C-w><RIGHT>
nnoremap <C-j> <C-w><DOWN>
nnoremap <C-k> <C-w><UP>
" CTRL-Tab is Next window
"nnoremap <C-Tab> <C-W>w

"" Indent
inoremap <M-H> <ESC>v<gi
inoremap <M-L> <ESC>v>gi
inoremap <ESC>H <ESC>v<gi
inoremap <ESC>L <ESC>v>gi
nnoremap < v<
nnoremap > v>
nnoremap <M-H> v<
nnoremap <M-L> v>
nnoremap <ESC>H v<
nnoremap <ESC>L v>
vnoremap < <gv
vnoremap > >gv
vnoremap <S-h> <gv
vnoremap <S-l> >gv
vnoremap <M-H> <gv
vnoremap <M-L> >gv
vnoremap <ESC>H <gv
vnoremap <ESC>L >gv

"" Move lines up & down
nnoremap <S-j> :m .+1<cr>==
nnoremap <S-k> :m .-2<cr>==
vnoremap <S-j> :m '>+1<cr>gv=gv
vnoremap <S-k> :m '<-2<cr>gv=gv
vnoremap <ESC>J :m '>+1<cr>gv=gv
vnoremap <ESC>K :m '<-2<cr>gv=gv
inoremap <M-J> <ESC>:m .+1<cr>==gi
inoremap <M-K> <ESC>:m .-2<cr>==gi
inoremap <ESC>J <ESC>:m .+1<cr>==gi
inoremap <ESC>K <ESC>:m .-2<cr>==gi

""""
" nnoremap <A-j> :m .+1<cr>==
" nnoremap <A-k> :m .-2<cr>==
" inoremap <A-j> <ESC>:m .+1<cr>==gi
" inoremap <A-k> <ESC>:m .-2<cr>==gi
" vnoremap <A-j> :m '>+1<cr>gv=gv
" vnoremap <A-k> :m '<-2<cr>gv=gv
"
" nnoremap <A-,> :m .+1<cr>==
" nnoremap <A-.> :m .-2<cr>==
" inoremap <A-,> <ESC>:m .+1<cr>==gi
" inoremap <A-.> <ESC>:m .-2<cr>==gi 
" vnoremap <A-,> :m '>+1<cr>gv=gv
" vnoremap <A-.> :m '<-2<cr>gv=gv
"
" nnoremap <A-h> v<
" nnoremap <A-l> v>
" inoremap <A-h> <ESC>v<gi
" inoremap <A-l> <ESC>v>gi
" vnoremap <A-h> <gv
" vnoremap <A-l> >gv
""""

"" Ctrl+A to select all
nnoremap <C-a> maggVG

"" Increment & Decrement number
nnoremap - <C-x>
nnoremap = <C-a>

"" Do not yank on x & p
nnoremap x "_x
vnoremap p "_dP

"" Search & Replace
nnoremap <C-f> <Nop>
vnoremap <C-f> y<ESC>/<C-r>"<CR>
vnoremap <C-r> <Nop>
vnoremap <C-r><C-e> "hy:%s/<C-r>h//gc<LEFT><LEFT><LEFT>
nnoremap gls :ls<CR>:b<SPACE>
nnoremap gre yiw:%s/<C-r>0//g<LEFT><LEFT>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Netrw
" https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
nnoremap <leader>E :cd %:p:h<CR>:Lexplore<CR>:pwd<CR>
nnoremap <leader>1 :Lexplore<CR>
nnoremap <C-F1>    :Lexplore<CR>
nnoremap <S-F1>    :Lexplore<CR>

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z
  nmap <buffer> <C-l> <C-w>l

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>
endfunction 

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if minimal==v:true                                 " no plugin
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" Status line
  "" https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
  "" https://stackoverflow.com/questions/30283764/whats-wrong-with-this-vimrc-im-not-getting-the-colors-im-supposed-to
  if &statusline==""
    set showmode
    set laststatus=2
    set statusline=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}\ %t\ %w\ \|\ CWD:\ %r%{getcwd()}%h\ \ \|\ %l:%c\


    set statusline=\ %#StatusLine#\ %t\ %m%r\ %=%#LineNr#\ %y\ [%{&fileencoding}]\ %l:%c\ %p%%


    set statusline=
    set statusline +=\ %n\             "buffer number
    set statusline +=%{&ff}            "file format
    set statusline +=%y                "file type
    set statusline +=\ %<%F            "full path
    set statusline +=%m                "modified flag
    set statusline +=\|%=\|%5l\|       "current line
    set statusline +=/%L               "total lines
    set statusline +=%4v\              "virtual column number
    set statusline +=0x%04B\           "character under cursor


    set statusline=
    set statusline+=\ %{&paste==1?'[PASTE\ MODE]\ \ ':''}         "paste_mode ?
    set statusline+=%t\ [%w%r%h%M]\|                            "status ?
    set statusline+=\ CWD:\ %r%{getcwd()}\|                       "CWD
    set statusline+=%=                                            "separator
    set statusline+=\|%5l/%-5c                                    "line / column


    set statusline=
    set statusline+=\ %n\|                                        "buffer number
    set statusline+=%{&paste==1?'[PASTE_MODE]':''}                "paste_mode ?
    set statusline+=\ %t                                          "file_name
    set statusline+=\ %w%r%h%m                                    "modified status
    set statusline+=%=                                            "separator
    set statusline+=%<\ CWD=%{getcwd()}\ \|\                        "CWD
    set statusline+=%f                                            "full_path(relative)
    set statusline+=\ [%{&fileformat}\|%{&fileencoding}]\ 
    set statusline+=\|%5l/%L\                                     "line / total
    set statusline+=[%3v]                                         "virtual column number
    set statusline+=\ 0x%04B\                                     "character under cursor

  endif



  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" bufferline - tabline
  "" https://www.reddit.com/r/vim/comments/11tdlx0/i_made_a_bufferline_with_40_lines_of_vimscript/
  set showtabline=2

  function! SpawnBufferLine()
    let s = ''
    if has('nvim')
      let s .= 'NVIM | '
    else
      let s .= 'VIM | '
    endif

    " Get the list of buffers. Use bufexists() to include hidden buffers
    let bufferNums = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    " Making a buffer list on the left side
    for i in bufferNums
      " Highlight with yellow if it's the current buffer
      let s .= (i == bufnr()) ? ('%#TabLineSel#') : ('%#TabLine#')
      let s .= i . ' '  " Append the buffer number
      if bufname(i) == ''
        let s .= '[NEW]'  " Give a name to a new buffer
      endif
      if getbufvar(i, "&modifiable")
        let s .= fnamemodify(bufname(i), ':t')  " Append the file name
        " let s .= pathshorten(bufname(i))  " Use this if you want a trimmed path
        " If the buffer is modified, add + and separator. Else, add separator
        let s .= (getbufvar(i, "&modified")) ? (' [+] | ') : (' | ')
      else
        let s .= fnamemodify(bufname(i), ':t') . ' [RO] | '  " Add read only flag
      endif
    endfor
    let s .= '%#TabLineFill#%T'  " Reset highlight

    let s .= '%=' " Spacer

    " Making a tab list on the right side
    for i in range(1, tabpagenr('$'))  " Loop through the number of tabs
      " Highlight with yellow if it's the current tab
      let s .= (i == tabpagenr()) ? ('%#TabLineSel#') : ('%#TabLine#')
      let s .= '%' . i . 'T '  " set the tab page number (for mouse clicks)
      let s .= i . ''          " set page number string
    endfor
    let s .= '%#TabLineFill#%T'  " Reset highlight

    " Close button on the right if there are multiple tabs
    if tabpagenr('$') > 1
      let s .= '%999X X'
    endif
    return s
  endfunction

  set tabline=%!SpawnBufferLine()  " Assign the tabline


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
else                                              " use plugin
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" Vim-Plug
  ""   Install vim-plug on Windows
  ""   Run this in PowerShell
  "" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" auto install vim-plug
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has("unix") && !has("nvim")
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
  endif


  if !has("nvim")
    call plug#begin()
      """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " List your plugins here
      Plug 'tpope/vim-sensible'

      "" nerdtree
      Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
      nnoremap <leader>n :NERDTreeFocus<CR>
      nnoremap <C-n> :NERDTree<CR>
      nnoremap <C-t> :NERDTreeToggle<CR>
      " nnoremap <C-f> :NERDTreeFind<CR>
      let g:NERDTreeMapActivateNode = 'l'
      let g:NERDTreeMapJumpParent = 'h'

      "" bufferline
      Plug 'vim-airline/vim-airline'
      Plug 'vim-airline/vim-airline-themes'
      let g:airline#extensions#tabline#enabled = 1


      "" Delete buffers and close files in Vim without closing your windows or messing up your layout.
      "Plug 'https://github.com/moll/vim-bbye'

      "" ayu theme
      Plug 'Luxed/ayu-vim'    " or other package manager
    call plug#end()

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" set colorscheme ayu
    set termguicolors       " enable true colors support
    ""set background=light    " for light version of theme
    set background=dark     " for either mirage or dark version.
    " NOTE: `background` controls `g:ayucolor`, but `g:ayucolor` doesn't control `background`
    ""let g:ayucolor="mirage" " for mirage version of theme
    let g:ayucolor="dark"   " for dark version of theme
    " NOTE: g:ayucolor will default to 'dark' when not set.
    silent! colorscheme ayu
  endif


endif





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VIM
if !has("nvim")
  "" Change Your Vim Cursor from a Block to Line in Insert Mode
  let &t_SI = "\e[6 q"
  let &t_EI = "\e[2 q"

  "" write as sudo
  if has("unix")
    "cmap w!! w !sudo tee > /dev/null %
    command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
  endif
endif

if has("nvim")
  if has("unix")
    "command! WW execute 'w !sudo -S tee % > /dev/null' <bar> edit!
    "command! WW silent! write !sudo tee % > /dev/null | edit!
    command! WW execute 'w !sudo -S tee % > /dev/null' | edit!
  endif
endif





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Neovide
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("g:neovide")
  let cursor_vfx_mode = ["railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"]
  let g:neovide_cursor_vfx_mode = cursor_vfx_mode[4]
  set guifont=JetBrainsMono\ Nerd\ Font:h11
  let g:neovide_transparency = 0.95
  " let g:neovide_fullscreen = v:true  "" windowed fullscreen mode
  nnoremap <F11> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>
  let g:neovide_cursor_animation_length = 0.08 "" default = 0.06
  let g:neovide_cursor_trail_size = 0.8 "" default = 0.7
  " let g:neovide_cursor_antialiasing = v:false  "" Disabling may fix some cursor visual issues.
endif


