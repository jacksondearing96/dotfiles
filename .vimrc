" Enable vim features not compatible with Vi.
set nocompatible

" Don't wrap text.
set nowrap

" Copy to system clipboard by default.
set clipboard=unnamedplus

" Set both relative and absolute line numbers.
set number
set relativenumber

" Auto-indent on a new line.
set autoindent

" Set backspace amount for each instance.
set backspace=indent,eol,start

" Tab with spaces intelligently.
set smarttab

" Show cursor column and row.
set ruler

" Better tab completion menus.
set wildmenu

" Give status line to all windows.
set laststatus=2

" Assume \g by default for substitutions.
set gdefault

" Space configurations.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80

" Intelligent tab expansion.
set expandtab

" Intelligent indent.
set smartindent

" Set fast terminal connection for smoother redraws.
set ttyfast

" Automatically reload changed files with no unsaved changes in buffer.
set autoread
" Make sure autoread always triggers when we expect it to.
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Show message in the status bar when autoread triggers.
autocmd FileChangedShellPost *
	\ echol WarningMsg | echo "File changed on disk. Buffer reloaded." | echol None

" Show the line where the cursor is.
set cursorline

call plug#begin()
	Plug 'easymotion/vim-easymotion' " Easy navigation using character mappings.
	Plug 'christoomey/vim-tmux-navigator' " Consistent navigation between VIM and TMUX.
	Plug 'takac/vim-hardtime' " Make vim harder!

	Plug 'rakr/vim-one' " Colour scheme.
    Plug 'gosukiwi/vim-atom-dark'

	Plug 'scrooloose/nerdcommenter' "Comment out code.
	Plug 'vim-airline/vim-airline' " Pretty status line.

    Plug 'ycm-core/YouCompleteMe'

	Plug 'vim-airline/vim-airline-themes' " Airline themes.
	Plug 'mhinz/vim-signify' " Highlight file changes.
	Plug 'farmergreg/vim-lastplace' "Remember where you were last in the file.
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './insall --all' } " Fuzzy find files.
	Plug 'junegunn/fzf.vim' " Fzf for vim.
	" Plug 'tpope/vim-obsession' " Session saving.
call plug#end()

"Automatically change the working path to the path of the current file.
set autochdir

" Enable file type based indent configuration and syntax highlighting.
filetype plugin indent on
syntax on

" TODO: provide you complete me plugin.

" TODO: provide auto formatter.
map <leader>k :AutoFormatBuffer<CR>

" TODO: provide an importer.
" map <leader>ii :IMPORTERFUNCTION<CR>

" TODO: provide linter.
" map <leader>lint :LINTFUNCTION<CR>

" TODO: provide plugin for related files.
" map <leader>rf :RelatedFilesWindow<CR>

" jk to escape.
:imap jk <Esc>

" Set leader to space.
:let mapleader = ' '

" Set color scheme.
let g:airline_theme='one'
colorscheme atom-dark-256
set background=dark

" Set airline theme and remove encoding section.
let g:airline_theme='murmur'
let g:airline_section_y=''

" Enable airline extensions.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ycm#enabled = 1

" Show just the filename in tab.
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Space when moving cursor vertically near edges.
set scrolloff=8

" Space when moving cursor horizontally near edges.
set sidescrolloff=8

" Open a new empty buffer.
map <leader>t :enew<CR>

" Move to the next buffer.
map <leader>] :bnext<CR>

" Move to the previous buffer.
map <leader>[ :bprevious<CR>

" Close the current buffer and move to the previous one.
map <leader>w :bp <BAR> bd! #<CR>

" Close the current window.
map <leader>q <C-w>q

" Save the current file.
map <leader>s :w<CR>

" Open a new file to edit.
map <leader>e :e<Space>

" Open last closed file.
map <leader>T :split<CR>

" Open horizontal  split.
map <leader>" :split<CR>

" Open vertical split.
map <leader>% :vsplit<CR>

" NERDCommenter tweaks.
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhiteSpace = 1
map <Leader>/ :call NERDComment(0, "toggle")<CR>

" Add Fzf as prefix to Fzf commands.
let g:fzf_command_prefix = 'Fzf'

" Customize fzf colours to match color scheme.
let g:fzf_colors = 
    \ { 'fg':   ['fg', 'Normal'],
    \ 'bg':     ['bg', 'Normal'],
    \ 'hl':     ['fg', 'Comment'],
    \ 'fg+':    ['bg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'hl+':    ['fg', 'Statement'],
    \ 'info':   ['fg', 'PreProc'],
    \ 'border': ['fg', 'Ignore'],
    \ 'prompt': ['fg', 'Conditional'],
    \ 'pointer':['fg', 'Exeption'],
    \ 'marker': ['fg', 'Keyword'],
    \ 'spinner':['fg', 'Label'],
    \ 'header': ['fg', 'Comment'] }

" Fuzzy find.
command! FzfAllFiles execute 'FzfFiles' '~/Desktop/'
map <leader>ff :FzfAllFiles<CR>

" Keep search results at the centre of screen.
map n nzz
map N Nzz
map * *zz
map # #zz
map g* g*zz
map g# g#zz

" Replace the word under the cursor.
map <Leader>r :%s/\<<C-r><C-w>\>/

" Resize windows in steps.
nnoremap <silent> <Leader>= :wincmd =<CR>
nnoremap <silent> <expr> <Leader>i v:count1 * 10 . '<C-w>+'
nnoremap <silent> <expr> <Leader>u v:count1 * 10 . '<C-w>-'
nnoremap <silent> <expr> <Leader>o v:count1 * 10 . '<C-w>>'
nnoremap <silent> <expr> <Leader>y v:count1 * 10 . '<C-w><'

" Turn hardmode on!
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 500
let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 3

" Don't comment new lines automatically.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open splits bottom-right by default.
set splitbelow splitright

" 
" ***** STUFF I DON'T UNDERSTAND ****
" ***********************************
" ***********************************

" Netrw sucks, don't load it.
let loaded_netrwPlugin = 1



" Disable search highlighting.
map <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" Highlight and include search by default.
set hls incsearch

" Adds highlighted column limits.
set colorcolumn=+1,+2,+3
highlight ColorColumn ctermbg=gray guibg=gray9

" Highlight the column limit.
set colorcolumn=80

" Adds highlighting to lines that are too long.
function! HighlightTooLongLines()
	highlight def link ReightMargin Error
	if &textwidth != 0
		exec ('match RightMargin /\%<' . (&textwidth + 3) . 'v.\%>' . (&textwidth + 1) . 'v/')
	endif
endfunction

" Add highlighting for too long lines.
augroup highlight_toolong
" au!
" au FileType, BufEnter * call HighlightTooLongLines()
augroup END








" ***********************************
" ***********************************
" ***********************************
