" --- KEYBINDS ---
"  Note these are for regular vim operations. Keep all configs specific to
"  plugins together either in init.vim or in a separate .vim file

" Reload nvim config. Make sure $MYVIMRC is set in .bashrc
noremap <leader>rr :source $MYVIMRC<cr>

" Exit insert mode
imap jk <esc>
imap fd <esc>
" Mac version of <M-j> aka <Option-j>
" Exit insert more and move one line down
imap ∆ <esc>j
" Mac version of <M-k> aka <Option-k>
" Exit insert mode and move one line up
imap ˚ <esc>k

" Continue editing at the beginning/end of current line
" Mac version of <M-h>
imap ˙ <esc>I
" Mac version of <M-l>
imap ¬ <esc>A

" File operations
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
nmap <leader>z :wq<cr>

" Buffer navigation
nmap <silent> <C-n> :bn<cr>
nmap <silent> <C-b> :bp<cr>
nmap <silent> <C-x> :bd<cr>
nmap <leader>' :b#<cr>

" Toggle signcolumn and line numbers (useful for copying)
function! ToggleColumns()
  set invnumber
  exe "set signcolumn=" .. (&signcolumn == "yes" ? "no" : "yes" )
endfunction
nmap <leader>tc :call ToggleColumns()<cr>

" Move a line up/down and recenter
no <leader><down> ddpzz
no <leader><up> ddkPzz

" Insert new line with extra blank line padding
nmap gO O<esc>O<esc>o
nmap go o<cr><esc>O

"Use tab / s-tab to indent/unindent
vmap <Tab> >gv
vmap <S-Tab> <gv

" Recenter the screen after movement
nmap <C-r> <C-r>zz
nmap u uzz
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz
nmap % %zz
nmap j jzz
nmap k kzz
nmap h hzz
nmap l lzz
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
vmap } }zz
vmap { {zz
vmap j jzz
vmap k kzz
vmap h hzz
vmap l lzz

