"____VIMRC John Degen____"
"--------------------OpenBSD version------------------------"
"-----------------------------------------------------------" 
"-------------------<____Settings____>----------------------"
"-----------------------------------------------------------" 
"
" set the runtime path to include vim-plug and initialize
set rtp+=~/.vim/plugged
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" coc.vim from latest tag
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()

"************************************************************
"From coc.nvim github maybe weed it later
"<Begin>
"
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
nnoremap <silent> <,>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <,>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <,>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <,>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <,>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <,>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <,>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <,>p  :<C-u>CocListResume<CR>

"**************************************************
"Here ends the coc.nvim config section
"**************************************************


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line
" For proper highlighting in coc.vim configuration file
autocmd FileType json syntax match Comment +\/\/.\+$+
" settings for coc
"source /home/john/.vim/cocsupplement.vim
set encoding=utf-8
"Menu language of gui == default language of OS
set langmenu=en
set nocompatible

"Fuzzy file search
"use tab completion and * in pattern to use
set path=.,/usr/include,/home/john/.vim,,**
set wildmenu

"set up netrw
"cheat sheet:
" - = up a dir; D = delete; <CR> = open file
"
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_altv=1
let g:netrw_liststyle=3	"tree view


"no visual bell, no terminal bell, no bell at all
"needs to go in .gvimrc as well
set vb t_vb=
"redraw screen to remove artefact $q q
autocmd VimEnter * redraw!

"highlight search patterns
set hls

"persistent undo
set undofile
set undolevels=10240
set undodir=/home/john/hdd/backup/vimundo

"tabstops and indent (shiftwidth) == 4 (default 8)
"check if this messes up display of files in other apps
set shiftwidth=4
set tabstop=4

"backspace over everything in sight
set backspace=2

" For terminal (but working towards one for both term and gui)
" mushroom seems to be the one (Oct 2019)
colorscheme mushroom
" colorscheme
" For gui
if has ('gui_running')
	colorscheme mushroom
endif

set linebreak
syntax on

"nice informative statusline, including time at the end
"set statusline=%<%f\ %h%m%r%y%=%-14.(\l.\ %l\ \c.\ %c%)\ %P%{strftime(\"\|\|%H:%M\")}
"====Airline Settings====
"replaced the above by airline settings
"needs work
let g:airline_section_y = '%{strftime("%H:%M")}' 
let g:airline_detect_crypt=0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
"No checking of whitespace
silent! call airline#extensions#whitespace#disable()

"====End of Airline Settings====

set history=200

"Cursor is horizontal line for Insert mode (much nicer)
set guicursor=i-ci:hor10-Cursor/lCursor,

"No menu, toolbar or scrollbars
set guioptions -=m 
"Removes the menubar.
set guioptions -=T

"Mouse in terminal, yes
set mouse=a
"No scrollbar (right and Left)	
set guioptions -=r
set guioptions -=L
"Show as much of a long line as possible instead of @@@@@@
set display=lastline

"==completion colors and lines==
"Menu for completion more subdued colors
"Copy to colorscheme file or it is overridden.
highlight Pmenu guifg=white guibg=darkblue
highlight PmenuSel guifg=white guibg=red
"Number of lines of completion matches (default many)
set pumheight=10

"Other workable values for highlighting current line (:set cul)
"are darkcyan, Purple. Update: darkmagenta background and italic chars
" is currently my favourite. Syntax colors remain visible this way.
"highlight CursorLine gui=NONE guifg=NONE guibg=darkmagenta
highlight CursorLine gui=underline,bold guifg=NONE guibg=NONE 
"Columns likewise (set cuc)
highlight CursorColumn gui=italic guifg=NONE guibg=darkmagenta

"Disable Alt+<letter> to access guimenus. More mappings 
"available this way (left here for old times' sake)
set winaltkeys=no

"command line area 2 lines high
set ch=2

"Always statusline
set laststatus=2

"set guifont=Bitstream\ Vera\ Sans\ Mono:h14:cANSI
set guifont=Bitstream\ Vera\ Sans\ Mono\ 16

"Gui colors are set in /home/john/.vim/colors/delek.vim

"-----------------------------------------------------------" 
"-------------------<____Mappings____>----------------------"
"-----------------------------------------------------------" 
" CTRL-Tab is Next window (from mswin.vim)
" Does not work in terminal, hence this workaround
nnoremap <Tab> <C-W>w
" Move to next tab (maybe add more)	
nnoremap <S-Tab> gt
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w

"Enter always searches next word
"nicely centered on the page
nnoremap <CR> nzz
"paste from "+ register
"nnoremap \p "+p
"yank to "+ register
nnoremap \y "+y
"Set search history to empty string and number
nmap <F5> :let @/ = ""<CR>

noremap <F6> :set number!<CR>:set number?<CR>

" Relative numbering
noremap <F7> <CR>:set rnu!<CR>:set rnu?<CR>	
nmap <F2> :set spell<CR>
nmap <S-F2> :set spelllang=nl<CR>
nmap <C-F2> :set spelllang=en<CR>

"Indicate active window with ~~~~~~ on statusline
"set fillchars=stl:~,vert:\|,fold:-,diff:-
" Reset statusline characters to nothing
set fillchars=
"
" Not in terminal
map <C-Space> A
imap <C-Space> <Esc>A
"change default register to "*" instead of "", so yanks go to Windows/X clipboard
"(not on Unix)
"set clipboard=unnamed
"This works better for Unix (default register is "+)
set clipboard=unnamedplus

"map <C-F12> :browse confirm e<CR>
map <F3> ZZ
imap <F3> <Esc>ZZ
map <S-Space> i
imap <S-Space> <Esc>
map <F12> :w<CR>
imap <F12> <Esc>:w<CR>
map <C-s> :w<CR>
imap <C-d> <Esc>dea
imap <C-s> <Esc>:w<CR>

"Start fzf
nnoremap <F10> :FZF<CR>
"Edit a file found with fzf
nnoremap <S-F10> call fzf#run({'sink': 'e'})<CR>
let $VIM = "/home/john/"
"source .vimrc
map <C-F8> :so $VIM/.vimrc<CR>
"Remove DOS line endings (^M)
map \M mz:%sub/\r//g<CR>`z

"Unix manpage like page down
map <Space> <C-F>

"Resize windows horizontally
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>-
nnoremap <C-Down> <C-w>+


"-----------------------------------------------------------" 
"------------------<___Abbreviations___>--------------------"
"-----------------------------------------------------------" 
"exclusively for Dutch. Maybe I should move them to a separate file
"but I can't remember why I would want to do that

iabbr th tot het
iabbr td tot de
iabbr seld geselecteerd
iabbr sli selectie
iabbr seln selecteren
iabbr dei die
iabbr ca camera
iabbr kn kunnen
iabbr dmv door middel van
iabbr afb afbeelding
iabbr gebt gebruikt
iabbr gebn gebruiken
iabbr geb gebruik
iabbr wt wordt
iabbr wn worden
iabbr uk u kunt
iabbr ku kunt u
iabbr ne en
iabbr ttp toe te passen
iabbr uuk U kunt
iabbr kuu Kunt u
iabbr utv uit te voeren
iabbr vor voor
iabbr hn hebben
iabbr dor door
iabbr EEn Eén
iabbr Uk U kunt
iabbr wgg weergegeven
iabbr selt selecteert
iabbr ipv in plaats van
iabbr vrh voor het
iabbr vre voor een
iabbr vrd voor de
iabbr vooor vóór
iabbr vna van
iabbr vh van het
iabbr vd van de
iabbr va van
iabbr ttv toe te voegen
iabbr tov ten opzichte van
iabbr tm tot en met
iabbr sv server
iabbr sftw software
iabbr nrh naar het
iabbr nre naar een
iabbr nrd naar de
iabbr mme met een
iabbr mh met het
iabbr md met de
iabbr Eeen Eén
iabbr eeen één
iabbr Ee Een
iabbr ee een
iabbr dwz dat wil zeggen
iabbr drh door het
iabbr dre door een
iabbr drd door de
iabbr db database
iabbr ae aan een
iabbr aa aan
iabbr Et Het
iabbr shebang #!/usr/local/bin/bash

"Only works if put last?
set showcmd
