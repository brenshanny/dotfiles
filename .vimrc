execute pathogen#infect()
syntax enable
filetype plugin indent on

set tabstop=4
set shiftwidth=2
set expandtab
set nu
set hls
set lazyredraw
:set colorcolumn=79

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:BASH_Ctrl_j = 'off'

let g:fzf_launcher = "/Users/brendanshanny/iterm_preferences/scripts/fzf_MacVim.scpt %s"


autocmd vimenter * NERDTree
autocmd vimenter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set background=dark
colorscheme gruvbox

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

map <Leader> <Plug>(easymotion-prefix)

nnoremap <C-K> kddpk
nnoremap <C-J> ddp

:nnoremap <C-\> :FZF ~/SecureDocs/source/vdr-app/ <CR>

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

" create directory on save if directory does not exist
" https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
