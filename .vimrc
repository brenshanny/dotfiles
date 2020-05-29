execute pathogen#infect()
syntax enable
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set expandtab
set nu
set hls
set lazyredraw
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set synmaxcol=180
set foldmethod=indent

:autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))


" Whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

map <Space> <Leader>

set backspace=indent,eol,start

let g:BASH_Ctrl_j = 'off'

let g:fzf_launcher = "/Users/brendanshanny/iterm_preferences/scripts/fzf_MacVim.scpt %s"

" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" indoors
set background=dark
colorscheme GruvBox

" Outdoors
" set background=light
" colorscheme PaperColor

set rtp+=/usr/local/opt/fzf
set nobackup
set noswapfile

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

:nnoremap <C-p> :%!python -m json.tool <CR>

nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <C-u> kddpk
nnoremap <C-y> ddp

:nnoremap <C-b> :GFiles <CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" vim-ruby
let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'

" Ale Linting
let g:ale_fixers = { 'javascript': ['prettier'] }
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_linters_explicit = 0
let g:ale_fix_on_save = 0
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_javascript_eslint_use_global = 0

nmap <silent> <C-m> <Plug>(ale_next_wrap)
nmap <silent> <C-n> <Plug>(ale_previous_wrap)

let g:gruvbox_contrast_dark = 'hard'

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

