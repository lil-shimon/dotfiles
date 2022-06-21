cnoremap init :<C-u>edit $MYVIMRC<CR>                           
noremap <Space>s :source $MYVIMRC<CR>                          
noremap <Space>w :<C-u>w<CR>                                    
set shell=fish
set completeopt=menuone,noselect

"-----------------------------------------
"             font settings
"-----------------------------------------
set guifont=Monospace\ Bold\ 100


"-----------------------------------------
"             Search config
"-----------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set pumblend=10


"-----------------------------------------
"              ColorScheme
"-----------------------------------------
set termguicolors     " enable true colors support


set suffixesadd=.js,.ts,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md


"-----------------------------------------
"              JavaScript
"-----------------------------------------
au BufNewFile,BufRead *.es6 setf javascript


"-----------------------------------------
"              TypeScript
"-----------------------------------------
au BufNewFile,BufRead *.tsx setf typescript


"-----------------------------------------
"            Encoding config
"-----------------------------------------
set encoding=utf-8


"-----------------------------------------
"            Editor settings
"-----------------------------------------
set number
set relativenumber
set splitbelow                                                  " 水平分割時に下に表示
set splitright                                                  " 縦分割時を右に表示
set noequalalways                                               " 分割時に自動調整を無効化
set wildmenu                                                    " コマンドモードの補完
set clipboard+=unnamed
set laststatus=2

filetype on


"-----------------------------------------
"              Keymapping
"-----------------------------------------
let g:mapleader = "\<Space>"
nnoremap <Leader>w :w<CR> 
nnoremap <Leader>q :q<CR> 
inoremap <silent> jj <ESC>

" ---------------------------------------
"           window settings 
" ---------------------------------------
"Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" More window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l


" ---------------------------------------
"        open browser settings 
" ---------------------------------------
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)


" ---------------------------------------
"           indent settings 
" ---------------------------------------  
set expandtab                                                   
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
augroup vimrc-filetype
  autocmd!

" ---------------------------------------
"           php indent settings 
" ---------------------------------------
autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4

" ---------------------------------------
"          python indent settings 
" ---------------------------------------
autocmd FileType python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4


" ---------------------------------------
"           dein settings 
" ---------------------------------------
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim


let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir .  '/repos/github.com/Shougo/dein.vim'    
let s:toml_dir = expand('~/.config/nvim')    

if dein#load_state(s:dein_dir)    
 call dein#begin(s:dein_dir)    
 call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
 call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
 call dein#end()           
 call dein#save_state()    
endif                        

if dein#check_install()                                       
  call dein#install()      
endif     

let g:dein#auto_recache = 1



 " ---------------------------------------
 "               vim plug 
 " ---------------------------------------
if has('nvim')
  let g:plughome = stdpath("data").'plugged'
endif

call plug#begin()


"  ---------------------------------------
"                lspconfig 
"  ---------------------------------------
Plug 'neovim/nvim-lspconfig',


"  ---------------------------------------
"                lspsaga 
"  ---------------------------------------
Plug 'glepnir/lspsaga.nvim'
" show hover doc

"  ---------------------------------------
"              treesitter 
"  ---------------------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


"  ---------------------------------------
"               telescope 
"  ---------------------------------------
Plug 'nvim-telescope/telescope.nvim'
nnoremap <silent> <C-P> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-L> <cmd>Telescope live_grep<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>l <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>



"  ---------------------------------------
"                icons 
"  ---------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'


"  ---------------------------------------
"              status line 
"  ---------------------------------------
Plug 'hoob3rt/lualine.nvim'


Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" ---------------------------------------
"           formatter 
" ---------------------------------------
Plug 'mhartington/formatter.nvim'

" ---------------------------------------
"           rafamadriz/neon 
" ---------------------------------------
Plug 'rafamadriz/neon'


" ---------------------------------------
"        whatyouhide/vim-gotham
" ---------------------------------------
Plug 'whatyouhide/vim-gotham'


" ---------------------------------------
"     shaunsingh/moonlight.nvim 
" ---------------------------------------
Plug 'shaunsingh/moonlight.nvim'

"---------------------------------------
"         hrsh7th/nvim-compe 
" ---------------------------------------
Plug 'hrsh7th/nvim-compe'


" ---------------------------------------
"      vim-scripts/darktango.vim 
" ---------------------------------------
Plug 'vim-scripts/darktango.vim'


" ---------------------------------------
"        karb94/neoscroll.nvim
" ---------------------------------------
Plug 'karb94/neoscroll.nvim'



" - for flutter -------------------------
"      nvim-lua/plenary.nvim
" ---------------------------------------
Plug 'nvim-lua/plenary.nvim'


" - for flutter -------------------------
"     akinsho/flutter-tools.nvim
" ---------------------------------------
Plug 'akinsho/flutter-tools.nvim'


" - for dart formatter ------------------
"     dart-lang/dart-vim-plugin
" ---------------------------------------
Plug 'dart-lang/dart-vim-plugin'
let g:dart_format_on_save = 1


" - colorscheme ------------------
"    artanikin/vim-synthwave84
" ---------------------------------------
Plug 'artanikin/vim-synthwave84'


" - vim sandwich ------------------
"    machakann/vim-sandwich
" ---------------------------------
Plug 'machakann/vim-sandwich'


" - fzf ------------------
"    machakann/vim-sandwich
" ---------------------------------
Plug 'junegunn/fzf.vim'


" - colorscheme ------------------
"    ulwlu/elly.vim
" ---------------------------------
Plug 'ulwlu/elly.vim'

call plug#end()

" この位置(plug#end)じゃないとエラー
colorscheme elflord
