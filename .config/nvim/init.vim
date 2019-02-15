"Introduce
"
" This vim configure file is Using neobundle
"
" if you have not install neobundle, please install neobundle
" install guide(linux) : curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | install.sh
" neobundle link: https://github.com/Shougo/neobundle.vim
"


"@NeoBundle Scripts----------------------------------------------------
if has('vim_starting')
  " Required
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"#Begin Plugin---------------------------

"execution library for Vim.
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\    },
\ }


" base
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell'		"requirement vimproc

" normal
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'vim-scripts/SyntaxRange'
NeoBundle 'tpope/vim-speeddating'
"NeoBundle 'FredKSchott/CoVim.git'
NeoBundle 'christoomey/vim-tmux-navigator'	"you need tmux and search!
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'vim-scripts/ZoomWin'		"using: <c-w>o

" Powerline
"Don't use 'powerline/powerline', becaese Doesn't have theme, recommend airline
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" dev
"NeoBundle 'Valloric/YouCompleteMe'	"you need compile and search!
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'vim-scripts/taglist.vim'	"you need ctags utils

" disable
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'vimwiki/vimwiki'
"NeoBundle 'edkolev/tmuxline.vim'
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'artur-shaik/vim-javacomplete2'
"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'Shougo/neocomplete.vim'

"#End Plugin-----------------------------

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"@End NeoBundle Scripts-----------------------------------------------

"@Begin Plugin Setting------------------------------------------------

"#begin requirement######
set tags+=./tags
syntax on

" for 24 bit
"if has("termguicolors")
"	set termguicolors
"endif

"if &term == "screen"
"	let g:solarized_termcolors=256
"	"set t_Co=256
"endif

"#NERDTree###############
" like emacs style
map <C-x>d :NERDTreeToggle<CR>
" follow README" follow README
map <C-n> :NERDTreeToggle<CR>

"#Airline################
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'

" status bar
set laststatus=2

" Tab/buffers line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_symbols = {}
let g:airline_symbols.space = ' '

"#Ctrlp##################
" 기본 무시 설정
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
\ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" 가장 가까운 .git 디렉토리를 cwd(현재 작업 디렉토리)로 사용
" 버전 관리를 사용하는 프로젝트를 할 때 꽤 적절하다.
" .svn, .hg, .bzr도 지원한다.
let g:ctrlp_working_path_mode = 'r'

" 단축키를 리더 키로 대체
nmap <leader>p :CtrlP<cr>

" 여러 모드를 위한 단축키
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"#Buffergator
"화면 오른쪽을 사용
let g:buffergator_viewport_split_policy = 'R'

" 단축키를 직접 지정하겠음
let g:buffergator_suppress_keymaps = 1

" 버퍼 돌기 (Looper buffers)
"let g:buffergator_mru_cycle_loop = 1

" 이전 버퍼로 이동
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" 다음 버퍼로 이동
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" 모든 버퍼 보기
nmap <leader>bl :BuffergatorOpen<cr>

" 위의 첫번재 해결책과 공유하는 단축키 (버퍼 닫기를 뜻함)
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>


"#YouCompleteMe##########
" base
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" operation method
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_auto_trigger = 1
let g:ycm_warning_symbol = '#>'		"not working, why?

" shortcut key
nnoremap <leader>g :YcmCompleter GoTo<CR>
"nnoremap <leader>gg :YcmCompleter GoToImprecise<CR>
nnoremap <leader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>p :YcmCompleter GetParent<CR>

" preview
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" debuging
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'


"#disable################

"#Syntastic##############
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"#vim-javacomplete2######
"autocmd FileType java setlocal omnifinc=javacomplete#Complete
"nmap <F4> <Plug>(JavaComplete-Imports-Add)
"imap <F4> <Plug>(JavaComplete-Imports-Add)
"nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
"nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
"nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)

"@End Plugin Setting--------------------------------------------------


"@Begin Personal Setting-------------------------------------------------------

"#Base###################
" theme
set t_Co=256
set background=dark
"colorscheme molokai
colorscheme solarized
let g:airline_theme='solarized'

" normal
set nocompatible	" 오리지날 VI와 호환하지 않음
set nowrapscan		" 검색할 때 문서의 끝에서 처음으로 안돌아감
set scrolloff=4
"set hlsearch

" backup
set nobackup
" set backupdir+=~/.config/nvim/backup
" set dir+=~/.config/nvim/swap

" indent
set cindent
set autoindent
set smartindent

" tab length
set tabstop=8
set shiftwidth=8

" other
set mouse-=a
"let mapleader = "/"

" LBS 
"set cursorline
"set cursorcolumn

"set ruler		" 상태표시줄에 커서 위치를 보여줌

" linked nasm
au BufRead,BufNewFile *.nasm set filetype=nasm

" edit xxd
augroup Binary
  au!
  au BufReadPre  *.bin,*.hex,*.o let &bin=1
  au BufReadPost *.bin,*.hex,*.o if &bin | %!xxd
  au BufReadPost *.bin,*.hex,*.o set ft=xxd | endif
  au BufWritePre *.bin,*.hex,*.o if &bin | %!xxd -r
  au BufWritePre *.bin,*.hex,*.o endif
  au BufWritePost *.bin,*.hex,*.o if &bin | %!xxd
  au BufWritePost *.bin,*.hex,*.o set nomod | endif
augroup END

"#Buffers
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden

" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>T :enew<CR>
" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>
" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>
" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>
" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>

"@End Personal Setting----------------------------------------------------------
