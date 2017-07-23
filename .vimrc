execute pathogen#infect()
syntax on
filetype plugin indent on
execute pathogen#infect('stuff/{}')
execute pathogen#infect('bundle/{}', '~/src/vim/bundle/{}')

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'		" let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree' 	    	" Project and file navigation
Plugin 'majutsushi/tagbar'          	" Class/module browser

"------------------=== Other ===----------------------
Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
Plugin 'tpope/vim-surround'	   	" Parentheses, brackets, quotes, XML tags, and more
Plugin 'ayu-theme/ayu-vim' 		" Ayu VIM theme
Plugin 'vim-airline/vim-airline-themes'	" Airline theme
Plugin 'airblade/vim-gitgutter'		" Integration git in VIM
Plugin 'Xuyuanp/nerdtree-git-plugin'	" Integration git in NerdTree
Plugin 'https://github.com/vim-scripts/project.tar.gz.git' " Project manager

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'		" Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
Plugin 'tomtom/tlib_vim'		" dependencies #2
Plugin 'honza/vim-snippets'		" snippets repo
Plugin 'mattn/emmet-vim'		" Emmet

""---------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'django.vim'			" Django template support

call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"====================================================
" SETTINGS
"====================================================

tab sball
set switchbuf=useopen

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}
colorscheme ayu


" отключаем пищалку и мигание
set visualbell t_vb= 
set novisualbell

set enc=utf-8	     " utf-8 по дефолту в файлах
set ls=2             " всегда показываем статусбар
set incsearch	     " инкреминтируемый поиск
set hlsearch	     " подсветка результатов поиска
set nu	             " показывать номера строк
set scrolloff=5	     " 5 строк при скролле за раз

" отключаем бэкапы и своп-файлы
"set nobackup 	     " no backup files
"set nowritebackup    " only in case you don't want a backup file while editing
"set noswapfile 	     " no swap files

" Настроки складирования backup и swap файлов
set dir=~/.vimtmp/swap
set dir=~/.vimtmp/backups

" Размер истории правок файла
set undolevels=10000

" прячем панельки
set guioptions-=m   " меню
set guioptions-=T   " тулбар
set guioptions-=r   " скроллбары

" настройка на Tab
set smarttab
set tabstop=4

set pastetoggle=
set smartindent

" изменяем табуляцию для html
autocmd FileType html set tabstop=2|set shiftwidth=2|set noexpandtab

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
  autocmd!
  autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
  autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
  autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 0 " автофокус на Tagbar при открытии

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
" "игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']  

" TaskList настройки
map <F2> :TaskList<CR> 	   " отобразить список тасков на F2

" Работа буфферами
map <C-q> :bd<CR> 	   " CTRL+Q - закрыть текущий буффер

" Emmet support
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css EmmetInstall
let g:user_emmet_leader_key='<Z>'

"=====================================================
"" Python-mode settings
"=====================================================

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" провека кода после сохранения
let g:pymode_lint_write = 1
" проверка кода 'на лету'
"let g:pymode_lint_on_fly = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

"============== Jedi settings ==============
" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

" Finally, if you don't want completion, but all the other features
let g:jedi#completions_enabled = 0

" Jedi actions
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

autocmd FileType python setlocal completeopt-=preview

"=====================================================
" Hotkeys
"=====================================================

" автокомплит через <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" Backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-Z is Undo
"noremap <C-z> u
"inoremap <C-z>

" CTRL-Y is Redo
"noremap <C-y> <C-R>
"inoremap <C-y> <C-O><C-R>

" " CTRL-A is Select all
" noremap <C-a> gggH<C-O>G
" inoremap <C-a> <C-O>gg<C-O>gH<C-O>G
" cnoremap <C-a> <C-C>gggH<C-O>G
" onoremap <C-a> <C-C>gggH<C-O>G
" snoremap <C-a> <C-C>gggH<C-O>G
" xnoremap <C-a> <C-C>ggVG

" CTRL-S is Quicksave command
noremap <C-s> :w <CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Settings for buffers
map <C-q> :bd!<CR>         " close current buffer
noremap <C-Right> :bn<CR> " move to next buffer
noremap <C-Left> :bp<CR>  " move to previous buffer

"autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

"=====================================================
"" Languages support
"=====================================================
" --- Python ---
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python set completeopt-=preview " раскомментируйте, вслучае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721
			\ --max-line-length=80'

