" --- FUZZY FINDER (FZF) ---      
" Configuration originally sourced from https://github.com/junegunn/fzf/blob/master/README-VIM.md#examples      
      
" -- CUSTOMIZATIONS --      
      
" Restart ripgrep whenever the query string is updated      
" Allows regex to still be used after ripgrep started      
function! RipgrepFzf(query, fullscreen)      
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'      
  let initial_command = printf(command_fmt, shellescape(a:query))      
  let reload_command = printf(command_fmt, '{q}')      
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}      
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)      
endfunction      
      
" Use a new command so that we can still access default :Rg version      
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)      
      
" Easier to read in reverse and info inline      
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'      
      
" Enable per-command history      
" - History files will be stored in the specified directory      
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and      
"   'previous-history' instead of 'down' and 'up'.      
let g:fzf_history_dir = '~/.local/share/fzf-history'      
      
      
" -- KEY BINDINGS --      
      
" This is the default extra key bindings      
let g:fzf_action = {      
  \ 'ctrl-t': 'tab split',      
  \ 'ctrl-s': 'split',      
  \ 'ctrl-v': 'vsplit' }      
      
" Temporarily stopped using this in favour of telescope plugin
" Custom key binding to start search quickly      
"nnoremap <leader>p :Files<CR>      
"nnoremap <leader>b :Buffers<CR>
" fzf kept adding a space (from the leader key) to the search string and the only solution I could find for now is adding a backspace
"nnoremap <leader>rg :RG<CR><BS>


" -- LAYOUT --
" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Prefer the popup window, but leaving this here if I ever change my mind
" Window using a Vim command
" - Anchored to top of current window
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10new' }


" -- COLORS --

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

