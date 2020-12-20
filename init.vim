" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
  " Neovim lsp plugins for rust development
  "Plug 'prabirshrestha/vim-lsp'
  "Plug 'neovim/nvim-lsp'
  "Plug 'neovim/nvim-lspconfig'
  "Plug 'nvim-lua/completion-nvim'
  "Plug 'tjdevries/nlua.nvim'
  "Plug 'tjdevries/lsp_extensions.nvim'

  " *** CODE
  " Intellisense 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " TypeScript syntax
  Plug 'HerringtonDarkholme/yats.vim'
  " Rust support
  Plug 'rust-lang/rust.vim'
  " auto set indent settings
  Plug 'tpope/vim-sleuth'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Golang
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " *** File tree + git
  " File tree
  Plug 'scrooloose/nerdtree'
  " Show files that have been modified via git
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Syntax highlighting for nerdtree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  " Show lines that have been changed via git
  Plug 'airblade/vim-gitgutter'
  " Git commands
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'

  " Icons
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " *** Fuzzy finders
  " fuzzy find files
  Plug 'ctrlpvim/ctrlp.vim' 
  " Another fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

  " ***MISC
  " Comments
  Plug 'scrooloose/nerdcommenter'
  "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  " Tmux navigator
  Plug 'christoomey/vim-tmux-navigator'
  " File navigation UI
  Plug 'vim-airline/vim-airline'
  " Surround
  Plug 'tpope/vim-surround'
  Plug 'liuchengxu/vista.vim'
  " Find and replace
  Plug 'brooth/far.vim'
  " Auto change html tags
  Plug 'AndrewRadev/tagalong.vim'
  " Hex colorizer 
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  "***Themes
  Plug 'morhetz/gruvbox'
  Plug 'joshdick/onedark.vim'

  " Debugging
  Plug 'puremourning/vimspector'

" Initialize plugin system
call plug#end()

" General settings
syntax on
filetype plugin indent on

set exrc
set guicursor=
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
"set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set ttimeoutlen=100
set signcolumn=yes
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set ruler

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set textwidth=120
set colorcolumn=120
highlight ColorColumn ctermbg=grey guibg=grey
colorscheme gruvbox 

inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeWinSize=50

" open NERDTree automatically
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree 

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-java',
  \ 'coc-go',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ 'coc-docker',
  \ 'coc-html',
  \ 'coc-python',
  \ 'coc-sql',
  \ 'coc-yaml',
  \ 'coc-actions',
  \ 'coc-rls'
  \ ]

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call SyncTree()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
