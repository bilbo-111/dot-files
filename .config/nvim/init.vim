" --- NVIM RESOURCE MANAGER ---

"  -- PLUGINS --

" Prevents potential conflicts with vscode nvim extension
if !exists('g:vscode')

"  Automatic installation for vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory
call plug#begin(stdpath('data') . '/plugged')

" Plugins list (don't forget :PlugInstall after adding new ones)
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " conquer of completion
Plug 'christoomey/vim-tmux-navigator'               " navigate seemlessly between vim and tmux splits
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder (interactive Unix filter for command-line)
Plug 'junegunn/fzf.vim'                             " INSTALL DEPENDENCIES: https://github.com/junegunn/fzf.vim#dependencies
Plug 'ryanoasis/vim-devicons'                       " icons, make sure a Nerd Font compatible font is installed (https://github.com/ryanoasis/nerd-fonts)
Plug 'mhinz/vim-signify'                            " use sign column to indicate lines changes by git
Plug 'tpope/vim-fugitive'                           " :Git <cmd> (or :G <cmd>) to call git commands, also used in vim-airline
Plug 'vim-airline/vim-airline'                      " status/tabline
Plug 'vim-airline/vim-airline-themes'               " official theme repo for vim-airline
Plug 'junegunn/rainbow_parentheses.vim'             " colorful parentheses
Plug 'nvim-lua/plenary.nvim'                        " highly extendable fuzzy finder over lists
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }          " highly extendable fuzzy finder over lists
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " improves telescope sorting performance
Plug 'nvim-telescope/telescope-file-browser.nvim'   " file browser extension for telescope

" Syntax
Plug 'hashivim/vim-terraform'                       " terraform syntax highlight and :Terraform command
Plug 'ekalinin/Dockerfile.vim'                      " syntax for dockerfiles
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }  " preview markdown in browser

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Archive - don't use these, keeping for now in case I change my mind
"Plug 'preservim/nerdtree'                           " file system explorer
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'      " adds syntax to NERDTree for most common file extensions
"Plug 'tpope/vim-obsession'                          " save the current state of vim
"Plug 'APZelos/blamer.nvim'                          " git blame

" List ends here. Plugins become visible to Vim after this call
call plug#end()
endif


" -- LOAD CONFIGS --
" Some commands are dependent on mapleader, so set it before loading configs
noremap <Space> <Nop>
"let mapleader = " "
let mapleader = "\<Space>"
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/airline_and_colorscheme.vim
source $HOME/.config/nvim/keybinds.vim


" -- GENERAL --
set autoread    " automatically reload file when changes are detected
set encoding=UTF-8
set noswapfile  " disable swap file
set number      " show line numbers
set ruler       " show line and column number in status line
set showcmd     " show (partial) command in status line
" highlight the current line in the current window and update the highlight as the cursor moves.
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END


" -- INDENT SETTINGS --
set expandtab                   " enter spaces when tab is pressed
set tabstop=2                   " define a tab as 4 spaces wide
set softtabstop=2               " move cursor 4 spaces when tab is pressed
set backspace=indent,eol,start  " make backspace more powerful
set autoindent                  " copy indent from current line when starting a new line
set shiftwidth=2                " number of spaces for autoindent


" -- FILE TYPES --
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufRead *Dockerfile* set filetype=Dockerfile
autocmd BufNewFile,BufRead *.tf set filetype=terraform


" -- SEARCH SETTINGS --
syntax on      " highlight syntax
set hlsearch   " highlight all results
set incsearch  " show search results as you type
set smartcase  " case-insensitive if you only use lowercase letters; otherwise, it will search in case-sensitive mode

" removes search highlighting until next search
nnoremap <silent> <leader>n :noh<CR>


" -- SPLIT PANES --
" Smart pane switching with awareness of Vim splits.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Toggle between the split windows and on window maximized
nnoremap <C-w>z :call MaximizeToggle()<CR>
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction


" -- DEVICONS --
let g:webdevicons_enable=1
"let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline=1

" whether or not to show the nerdtree brackets around flags
"let g:webdevicons_conceal_nerdtree_brackets = 1


" -- NERDTREE SETTINGS --
"nmap t :NERDTreeToggle<CR>
"nmap <silent> T :NERDTreeFind<CR>

"let NERDTreeQuitOnOpen=1 " close nerdtree after file is opened
"let NERDTreeShowHidden=1 " show hidden files
"let NERDTreeMinimalUI=1  " remove the 'Press ? for help' message
"let NERDTreeAutoDeleteBuffer=1 " automatically delete the buffer of the file you just deleted with nerdtree
"let NERDTreeIgnore=['\.Makefile[[dir]]', '__pycache__[[dir]]', '\.git', '\.terraform']
"let NERDTreeMapOpenVSplit='h' " wanted to use v, but gv is already mapped for re-selecting last visual selection. chose h because the vertical split gets opened to the left of existing pane
"let NERDTreeMapOpenSplit='s' " match the default vim window split key mapping

" Start NERDTree when Vim starts with a directory argument.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    "\ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif


" -- RAINBOW PARENTHESES --
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" Always activate
au VimEnter * RainbowParentheses


" -- MARKDOWN PREVIEW --
nmap <C-p> <Plug>MarkdownPreviewToggle
"nmap <C-s> <Plug>MarkdownPreview
" mac equivalent of M-m aka Option-m
"nmap ß <Plug>MarkdownPreviewStop


" -- GIT BLAMER PLUGIN --
"let g:blamer_enabled = 1
"let g:blamer_show_in_visual_modes = 0
"let g:blamer_show_in_insert_modes = 0
"let g:blamer_prefix = ' > '


" -- TELESCOPE --

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" telescope-file-browser commands
nnoremap <space>fe :Telescope file_browser<cr>
nnoremap <space>fE :Telescope file_browser path=%:p:h select_buffer=true<CR>

" lua heredoc script
" TODO: either move this to a separate init.lua file OR try lazy vim
lua << EOF
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require("telescope").load_extension('file_browser')
EOF
