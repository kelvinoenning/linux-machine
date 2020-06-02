call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-go', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

colorscheme gruvbox
set background=dark

set hidden
set number
" set relativenumber
set inccommand=split
set clipboard=unnamedplus
" gf config
set path+=**

let mapleader=","

" Enable mouse
" set mouse=a

" Saves and exit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :wq!<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Ident
nnoremap <F8> gg=G<C-o><C-o>

" Splits
nnoremap <Leader>vs :vsp<cr>
nnoremap <Leader>hs :sp<cr>

" Searchs
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

" Open config files
nnoremap <leader>foc :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>fuc :source ~/.config/nvim/init.vim<cr>

" Resize
nnoremap <leader>6 :vertical resize +10<CR>
nnoremap <leader>4 :vertical resize -10<CR>
nnoremap <leader>2 :resize +10<CR>
nnoremap <leader>8 :resize -10<CR>


nnoremap <F7> :NERDTree<CR>

let g:go_fmt_command = "goimports"

" ===== +TERMINAL =====
function! VTerm()
	botright vsplit term://bash
	startinsert
endfunction

nnoremap <leader>t :call VTerm()<cr>

function! HTerm()
	below split term://bash
	startinsert
endfunction

nnoremap <leader>T :call HTerm()<cr>

tnoremap <Esc> <C-\><C-n>
" ===== -TERMINAL =====
