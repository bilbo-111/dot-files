" --- AIRLINE SETTINGS ---

" -- GENERAL --

" Enable caching of various syntax highlighting groups to prevent some of the
" more expensive :hi calls in vim
let g:airline_highlighting_cache = 1


" -- TABLINE --

" Automatically display all buffers when there is only one tab open
let g:airline#extensions#tabline#enabled = 1  

" Path formatter in tabs and current buffer indicator
let g:airline#extensions#tabline#formatter = 'jsformatter'

" Minimum of 2 buffers needed to display the tabline
let g:airline#extensions#tabline#buffer_min_count = 2

" File encoding section is not that useful, so remove it to declutter a bit
let g:airline_section_y=''
let g:airline_skip_empty_sections = 1 " Remove separators for empty sections


" -- EXTENSIONS --

" By default, airline attempts to load any extension it can find in the 'runtimepath'
" For a minimalistic setup, instead opt-in which extensions get loaded with this list
let g:airline_extensions = ['branch', 'coc', 'hunks', 'tabline']

" Format coc warning/error section
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" -- THEME --

let g:airline_solarized_bg='light'
let g:airline_theme='solarized'

" Get patched font for nice looking powerline symbols
" Note: Need to install powerline (https://powerline.readthedocs.io/en/master/installation.html
let g:airline_powerline_fonts = 1


" -- CUSTOM SYMBOLS --

" Note: You must define the dictionary first before setting values. Also, it's
" a good idea to check whether it exists as to avoid accidentally overwriting
" its contents. (see :help airline-customization)

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Unicode symbols
" This unicode symbols section is unnecessary if there is already a patched
" font, but it gives a nice fallback if a font is used which does not have the
" appropriate symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" Powerline symbols
" If symbols appear as boxes, may still need to install patched powerline
" fonts. See help pages for more info (:help airline-troubleshooting)
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'



" --- COLORSCHEME ---
syntax on
let g:solarized_termcolors=256
set t_Co=256 

" Default to light solarized theme
"set background=light
"colorscheme solarized
"" make CocMenu highlights easier to read
"highlight CocMenuSel ctermfg=3 guifg=#808000

" Default to dark theme
set background=dark
let g:airline_theme='onehalfdark'
colorscheme onehalfdark
" make CocMenu highlights easier to read
highlight CocMenuSel ctermbg=3 guibg=#808000


" --- TOGGLE LIGHT/DARK MODE ---

function! TurnOffLights()
  set background=dark
  let g:airline_theme='onehalfdark'
  let g:airline_solarized_bg='dark' | :AirlineRefresh
  colorscheme onehalfdark
  " Use bg in dark mode
  highlight CocMenuSel ctermbg=3 guibg=#808000
  echo "Lights out!"
endfunction

function! TurnOnLights()
  set background=light
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='light' | :AirlineRefresh
  colorscheme solarized
  " Use fg in light mode
  highlight CocMenuSel ctermfg=3 guifg=#808000
  echo "Let there be light!"
endfunction

function! ToggleMode()
  if (&background == 'light')
    :call TurnOffLights()
  else
    :call TurnOnLights()
  endif
endfunction

" Mapping to quickly call ToggleMode
nmap <leader>tm :call ToggleMode()<cr>

