set history=200
set number
set background=dark
set visualbell t_vb=
set incsearch
set hlsearch
set ignorecase
set smartcase
set whichwrap=b,s,h,l,<,>,~,[,]
set title
set fileencoding=utf-8 
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double
set tabstop=4
set shiftwidth=4
inoremap <silent> jj <ESC>

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap ' ''<LEFT>
inoremap " ""<LEFT>
nnoremap bd :bd<CR>

" Airline "2016/08/05
set laststatus=2
set showtabline=2 
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

"---------------------------
" Start Vimtex Settings.
" cf. https://texwiki.texjp.org/?VimTeX#rdcb7242
" cf. https://bombrary.github.io/blog/posts/vim-latex-setup/
"---------------------------

let g:tex_flavor = "latex"
let maplocalleader=' '
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }

"---------------------------
" End Vimtex Settings.
"---------------------------

"---------------------------
" Start Pratical Vim
"---------------------------

"p103
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"p153 
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"p136
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"p116
noremap <silent> [b :bprevious<CR>
noremap <silent> ]b :bnext<CR>
noremap <silent> [B :bfirst<CR>
noremap <silent> ]B :blast<CR>
"p209
:set autoindent

"---------------------------
" End Pratical Vim
"---------------------------

"---------------------------
" Start dein.vim Settings.
"---------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('neoclide/coc.nvim', {'merged':0,'rev':'release'})
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('nvim-tree/nvim-web-devicons')
  call dein#add('romgrk/barbar.nvim')
  call dein#add('w0ng/vim-hybrid')

  " call dein#add('ryanoasis/vim-devicons')
  " call dein#add('vim-airline/vim-airline')
  " call dein#add('vim-airline/vim-airline-themes')
  " call dein#add('lambdalisue/fern.vim')
  " call dein#add('lambdalisue/nerdfont.vim')
  " call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
  " call dein#add('lambdalisue/fern-git-status.vim')
  " call dein#add('lervag/vimtex')
  " call dein#add('cocopon/iceberg.vim')
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')
  
  " Required:
  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable
filetype plugin on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""---------------------------
" End dein.vim Settings.
"---------------------------


""---------------------------
" Start colorscheme Settings.
"---------------------------
" syntax on
" colorscheme iceberg
colorscheme hybrid

""---------------------------
" End colorscheme Settings.
"---------------------------


""fernでアイコンを表示する
let g:fern#renderer = 'nerdfont'

"Fern Settings-------------------------

"" Start with fern
""augroup __fern__au!
""	autocmd VimEnter * ++nested Fern . -drawer -stay -keep -toggle -reveal=%
""augroup END
" nnoremap ,t :<c-u>Fern .  -drawer -stay -keep -toggle -reveal=%<cr>

""---------------------------
" Start Coc.nvim Settings.
""---------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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

" \ 'coc-flutter',
" \ 'coc-go',
" \ 'coc-rls',
" \ 'coc-omnisharp',
" \ 'coc-svelte',
" \ 'coc-tsserver',
" \ 'coc-vetur',
" \ 'coc-css',
" \ 'coc-spell-checker',

let g:coc_global_extensions = [
     \ 'coc-sql',
     \ 'coc-vimlsp',
     \ 'coc-docker',
     \ 'coc-markdownlint',
     \ 'coc-json',
     \ 'coc-xml',
     \ 'coc-yaml',
     \ 'coc-cssmodules',
     \ 'coc-snippets'
	 \ ]
     
""---------------------------
" End Coc.nvim Settings.
""---------------------------


