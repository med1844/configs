set nocompatible
set nu rnu
set ts=4 expandtab sw=4
set so=6
set hidden

" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

set ls=2

syntax enable

set keywordprg=":help"

set autoindent
set backspace=indent,eol,start

set ttimeout
set ttimeoutlen=50

set incsearch
set hlsearch

set laststatus=2

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = ","
let g:mapleader = ","

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set ttimeoutlen=2

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'easymotion/vim-easymotion'

" ycm
Plugin 'ycm-core/youcompleteme'

" nerdtrees
" Plugin 'preservim/nerdtree'
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" airlines
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" syntax highlight
Plugin 'sheerun/vim-polyglot'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'

let g:airline_theme = 'wombat'
let g:airline_powerline_fonts = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" nerd tree settings
" let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" autocmd VimEnter * NERDTree | wincmd p
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

map <Space> <Plug>(easymotion-prefix)

let g:AutoPairsMapCR = 0

