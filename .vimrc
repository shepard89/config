" Set bash as default shell
set shell=/bin/bash
set nocompatible
scriptencoding utf-8
"--------------------------------------------------
" NeoBundle Init

" Use 256 colors in vim
" some plugins not work without it
set t_Co=256

" Turn off filetype plugins before bundles init
filetype off
" Auto installing NeoNeoBundle
let g:isNpmInstalled = executable("npm")
let g:iCanHazNeoBundle=1
let g:neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    if !isNpmInstalled
        echo "==============================================="
        echo "Your need to install npm to enable all features"
        echo "==============================================="
    endif
    echo "Installing NeoBundle.."
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let g:iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" Determine make or gmake will be used for making additional deps for Bundles
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

"--------------------------------------------------
" Bundles

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundle 'Shougo/neobundle.vim'

" Instlall vimrpoc. is uses by unite and neocomplcache
" for async searches and calls
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'unix': g:make
\    },
\ }
NeoBundle 'Quramy/tsuquyomi'

NeoBundle 'syngan/vim-vimlint', {
    \ 'depends' : 'ynkdir/vim-vimlparser'}

" Some support functions used by delimitmate, and snipmate
NeoBundle 'vim-scripts/tlib'

" Improve bookmarks in vim
" Allow word for bookmark marks, and nice quickfix window with bookmark list
" NeoBundle 'AndrewRadev/simple_bookmarks.vim'

" Snippets engine with good integration with neocomplcache
NeoBundle 'SirVer/ultisnips'

" Dirr diff
NeoBundle 'vim-scripts/DirDiff.vim'

" Colorscheme solarazied for vim
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'wellsjo/wells-colorscheme.vim'
NeoBundle 'morhetz/gruvbox'

" Allow autoclose paired characters like [,] or (,),
" and add smart cursor positioning inside it,
NeoBundle 'Raimondi/delimitMate'

" Add code static check on write
" need to be properly configured.
" I just enable it, with default config,
" many false positive but still usefull
NeoBundle 'scrooloose/syntastic'
" Install eslint and for syntastic
" Path to eslint if it not installed globally, then use local installation
"if !executable("eslint")
    "let g:syntastic_eslint_exec = '~/.vim/node_modules/.bin/eslint'
    "let g:syntastic_javascript_eslint_exec = '~/usr/local/lib/node_modules/eslint/.bin/eslint'
    "if isNpmInstalled && !executable(expand(g:syntastic_javascript_eslint_exec))
    "   silent ! echo 'Installing eslint' && npm --prefix ~/.vim/ install eslint
    "endif
"endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Great file system explorer, it appears when you open dir in vim
" Allow modification of dir, and may other things
" Must have
NeoBundle 'scrooloose/nerdtree'

" Provide smart autocomplete results for javascript, and some usefull commands
if has("python")
    NeoBundle 'marijnh/tern_for_vim'
    " install node dependencies for tern
    if isNpmInstalled && isdirectory(expand('~/.vim/bundle/tern_for_vim')) && !isdirectory(expand('~/.vim/bundle/tern_for_vim/node_modules'))
        silent ! echo 'Installing tern' && npm --prefix ~/.vim/bundle/tern_for_vim install
    endif
endif

" Add smart commands for comments like:
" gcc - Toggle comment for the current line
" gc  - Toggle comments for selected region or number of strings
" Very usefull
NeoBundle 'tomtom/tcomment_vim'

" Best git wrapper for vim
" But with my workflow, i really rarely use it
" just Gdiff and Gblame sometimes
NeoBundle 'tpope/vim-fugitive'

" Fix-up dot command behavior
" it's kind of service plugin
NeoBundle 'tpope/vim-repeat'

" Add usefull hotkey for operation with surroundings
" cs{what}{towhat} - inside '' or [] or something like this allow
" change surroundings symbols to another
" and ds{what} - remove them
NeoBundle 'tpope/vim-surround'

" Syntax highlighting for Stylus
NeoBundle 'wavded/vim-stylus'

" Add aditional hotkeys
" Looks like i'm not using it at all
"NeoBundle 'tpope/vim-unimpaired'

" HTML5 + inline SVG omnicomplete funtion, indent and syntax for Vim.
NeoBundle 'othree/html5.vim'

" Jade syntax
NeoBundle 'digitaltoad/vim-jade'

" Syntax highlighting for .jsx (js files for react js)
NeoBundle 'mxw/vim-jsx'

" Highlights the matching HTML tag when the cursor
" is positioned on a tag.
NeoBundle 'gregsexton/MatchTag'

" Add Support css3 property
NeoBundle 'hail2u/vim-css3-syntax'

" Smart indent for javascript
" http://www.vim.org/scripts/script.php?script_id=3081
NeoBundle 'lukaszb/vim-web-indent'

" Plugin for changing cursor when entering in insert mode
" looks like it works fine with iTerm Konsole adn xerm
" Applies only on next vim launch after NeoBundleInstall
NeoBundle 'jszakmeister/vim-togglecursor'

" Nice statusline/ruler for vim
NeoBundle 'bling/vim-airline'

" Airline themes
NeoBundle 'vim-airline/vim-airline-themes'

" Improve javascritp syntax higlighting, needed for good folding,
" and good-looking javascritp code
NeoBundle 'jelera/vim-javascript-syntax'

"code-completion for jquery, lodash e.t.c
NeoBundle 'othree/javascript-libraries-syntax.vim'

" Improved json syntax highlighting
NeoBundle 'elzr/vim-json'

" Code complete
NeoBundle 'Shougo/neocomplcache.vim'

" Most recent files source for unite
NeoBundle 'Shougo/neomru.vim'

" Plugin for chord mappings
NeoBundle 'kana/vim-arpeggio'

" EasyMotion
NeoBundle 'Lokaltog/vim-easymotion'

" Control P
NeoBundle 'kien/ctrlp.vim'

" CtrlP-Funky
NeoBundle 'tacahiroy/ctrlp-funky'

" Scss Syntax
NeoBundle 'cakebaker/scss-syntax.vim'

" JSDoc
NeoBundle 'heavenshell/vim-jsdoc'

" Ack
NeoBundle 'mileszs/ack.vim'

" CleverTab
NeoBundle 'exdis/vim-clevertab', 'ultisnips-expand-or-jump-setting'

" TypeScript
NeoBundle 'leafgarland/typescript-vim'
" NeoBundle 'clausreinke/typescript-tools.vim'

" Rust
NeoBundle 'rust-lang/rust.vim'

" Go
NeoBundle 'fatih/vim-go'

" Vim argwrap
NeoBundle 'FooSoft/vim-argwrap'

" Angular
NeoBundle 'burnettk/vim-angular'

call neobundle#end()

" Enable Indent in plugins
filetype plugin indent on
" Enable syntax highlighting
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------------------------------------
" Bundles settings

"-------------------------
" NERDTree

" Tell NERDTree to display hidden files on startup
let g:NERDTreeShowHidden=1

" Disable bookmarks label, and hint about '?'
let g:NERDTreeMinimalUI=1

" Display current file in the NERDTree ont the left
nmap <silent> <leader>f :NERDTreeFind<CR>
map <silent> <C-n> :NERDTreeToggle<CR>

"-------------------------
" Syntastic
let g:syntastic_shell = "/bin/sh"
let g:syntastic_aggregate_errors=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

" Enable autochecks
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" For correct works of next/previous error navigation
let g:syntastic_always_populate_loc_list=0
let g:syntastuc_auto_loc_list=0
let g:tsuquyomi_disable_quiclfix=1

" check json files with eslint
let g:syntastic_filetype_map = { "json": "javascript", }

" open quicfix window with all error found
nmap <silent> <leader>ll :Errors<cr>
" previous syntastic error
nmap <silent> { :lprev<cr>
" next syntastic error
nmap <silent> } :lnext<cr>
" first syntastic error
nmap <silent> <leader>{ :lfirst<cr>

" Do not compile typescript files
let g:syntastic_typescript_tsc_fname = ''
let g:typescript_compiler_binary='tsc'
let g:typescript_compiler_options=''
let g:typescript_indent_disable=0
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"-------------------------
" Fugitive

" Blame on current line
nmap <silent> <leader>b :.Gblame<cr>
" Blame on all selected lines in visual mode
vmap <silent> <leader>b :Gblame<cr>
" Git status
nmap <silent> <leader>gst :Gstatus<cr>
" like git add
nmap <silent> <leader>gw :Gwrite<cr>
" git diff
nmap <silent> <leader>gd :Gdiff<cr>
" git commit
nmap <silent> <leader>gc :Gcommit<cr>
" git commit all
nmap <silent> <leader>gca :Gcommit -a<cr>
" git fixup previous commit
nmap <silent> <leader>gcf :Gcommit -a --amend<cr>


"-------------------------
" DelimitMate

" Delimitmate place cursor correctly n multiline objects e.g.
" if you press enter in {} cursor still be
" in the middle line instead of the last
let g:delimitMate_expand_cr = 1

" Delimitmate place cursor correctly in singleline pairs e.g.
" if x - cursor if you press space in {x} result will be { x } instead of { x}
let g:delimitMate_expand_space = 1

"-------------------------
" Tern_for_vim

let g:tern_show_signature_in_pum = 1

" Find all refs for variable under cursor
nmap <silent> <leader>tr :TernRefs<CR>

" Smart variable rename
nmap <silent> <leader>tn :TernRename<CR>

"-------------------------
" Solarized

" if You have problem with background, uncomment this line
" let g:solarized_termtrans=1
let g:solarized_termcolors=256

"-------------------------
" vim-airline

" Colorscheme for airline
let g:airline_theme='understated'

" Enable airline for tab-bar
let g:airline#extensions#tabline#enabled = 1

" Don't display buffers in tab-bar with single tab
let g:airline#extensions#tabline#show_buffers = 0

" Display only filename in tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't display encoding
let g:airline_section_y = ''

" Don't display filetype
let g:airline_section_x = ''

"-------------------------
" neocomplcache

" Enable NeocomplCache at startup
let g:neocomplcache_enable_at_startup = 1

" Max items in code-complete
let g:neocomplcache_max_list = 10

" Max width of code-complete window
let g:neocomplcache_max_keyword_width = 80

" Code complete is ignoring case until no Uppercase letter is in input
let g:neocomplcache_enable_smart_case = 1

" Auto select first item in code-complete
let g:neocomplcache_enable_auto_select = 1

" Disable auto popup
let g:neocomplcache_disable_auto_complete = 1

" Undo autocomplete
inoremap <expr><C-e> neocomplcache#undo_completion()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" For cursor moving in insert mode
inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"

" disable preview in code complete
set completeopt-=preview

"-------------------------
" Arpeggio

" map jk to escape
"call arpeggio#map('i', '', 0, 'jk', '<ESC>')

"--------------------------------------------------
" Colorscheme

set background=dark

" Use wells-colors colorscheme
colorscheme gruvbox
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_termcolors=256

" set highlighting for colorcolumn
highlight ColorColumn ctermbg=8

"--------------------------------------------------
" General options

" Enable per-directory .vimrc files and disable unsafe commands in them
"set exrc secure

" Set up leader key <leader>, i use default \
"let mapleader = ','

" Buffer will be hidden instead of closed when no one display it
"set hidden

" Auto reload changed files
set autoread

" Always change current dirrectory to current-editing-file dir
"set autochdir

" Indicates fast terminal connection
set ttyfast

" Set character encoding to use in vim
set encoding=utf-8

" Let vim know what encoding we use in our terminal
set termencoding=utf-8

" Which EOl used. For us it's unix
" Not works with modifiable=no
if &modifiable
    set fileformat=unix
endif

" Enable Tcl interface. Not shure what is exactly mean.
" set infercase

" Interprete all files like binary and disable many features.
" set binary

"--------------------------------------------------
" Display options

" Hide showmode
" Showmode is useless with airline
set noshowmode

" Show file name in window title
set title

" Mute error bell
set novisualbell

" Remove all useless messages like intro screen and use abbreviation like RO
" instead readonly and + instead modified
set shortmess=atI

" Enable display whitespace characters
set list

" Setting up how to display whitespace characters
set listchars=tab:→\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Wrap line only on characters in breakat list like ^I!@*-+;:,./?
" Useless with nowrap
" set linebreak

" Numbers of line to scroll when the cursor get off the screen
" Useless with scrolloff
" set scrolljump=5

" Numbers of columns to scroll when the cursor get off the screen
" Useless with sidescrollof
" set sidescroll=4

" Numbers of rows to keep to the left and to the right off the screen
set scrolloff=10

" Numbers of columns to keep to the left and to the right off the screen
set sidescrolloff=10

" Vim will move to the previous/next line after reaching first/last char in
" the line with this commnad (you can add 'h' or 'l' here as well)
" <,> stand for arrows in command mode and [,] arrows in visual mode
set whichwrap=b,s,<,>,[,],

" Display command which you typing and other command related stuff
set showcmd

" Indicate that last window have a statusline too
set laststatus=2

" Add a line / column display in the bottom right-hand section of the screen.
" Not needed with airline plugin
" set ruler

" Setting up right-hand section(ruller) format
" Not needed with airline plugin
" set rulerformat=%30(%=\:%y%m%r%w\ %l,%c%V\ %P%)

" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline

" Disable wrapping long string
set nowrap

" Display Line numbers and relative line numbers
set number
set rnu

" Highlight line with cursor
set cursorline

" maximum text length at 80 symbols, vim automatically breaks longer lines
" set textwidth=80

" higlight column right after max textwidth
set colorcolumn=80,120


"--------------------------------------------------
" Tab options

" Copy indent from previous line
set autoindent

" Enable smart indent. it add additional indents whe necessary
set smartindent

" Replace tabs with spaces
" set expandtab

" Whe you hit tab at start of line, indent added according to shiftwidth value
" set smarttab

" number of spaces to use for each step of indent
set shiftwidth=4

" Number of spaces that a Tab in the file counts for
set tabstop=4

" Same but for editing operation (not shure what exactly does it means)
" but in most cases tabstop and softtabstop better be the same
set softtabstop=4

" Round indent to multiple of 'shiftwidth'.
" Indentation always be multiple of shiftwidth
" Applies to  < and > command
set shiftround

"--------------------------------------------------
" Search options

" Add the g flag to search/replace by default
set gdefault

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search patter ncontains upper case characters
set smartcase

" Live search. While typing a search command, show where the pattern
set incsearch

" Disable higlighting search result on Enter key
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Show matching brackets
set showmatch

" Make < and > match as well
set matchpairs+=<:>

" Alternative tab navigation
nmap <S-u> :tabprevious<CR>
nmap <S-i> :tabnext<CR>
nmap <S-j> :tabmove -1<CR>
nmap <S-k> :tabmove +1<CR>
nmap <C-t> :tabnew<CR>

"--------------------------------------------------
" Wildmenu

" Extended autocmpletion for commands
set wildmenu

" Autocmpletion hotkey
set wildcharm=<TAB>

"--------------------------------------------------
" Folding

" Enable syntax folding in javascript
let g:javaScript_fold=1

" No fold closed at open file
set foldlevelstart=99
set nofoldenable

" Keymap to toggle folds with space
" nmap <space> za

"--------------------------------------------------
" Edit

" Allow backspace to remove indents, newlines and old text
set backspace=indent,eol,start

" toggle paste mode on \p
set pastetoggle=<leader>p

" Add '-' as recognized word symbol. e.g dw delete all 'foo-bar' instead just 'foo'
set iskeyword+=-

" Disable backups file
set nobackup

" Disable vim common sequense for saving.
" By defalut vim write buffer to a new file, then delete original file
" then rename the new file.
set nowritebackup

" Disable swp files
set noswapfile

" Do not add eol at the end of file.
set noeol

"--------------------------------------------------
" Diff Options

" Display filler
set diffopt=filler

" Open diff in horizontal buffer
set diffopt+=horizontal

" Ignore changes in whitespaces characters
set diffopt+=iwhite

"--------------------------------------------------
" Hotkeys

" Open new tab
nmap <silent><leader>to :tabnew .<CR>

" Replace
nmap <leader>s :%s//<left>
vmap <leader>s :s//<left>

" Moving between splits
nmap <leader>w <C-w>w

"--------------------------------------------------
" Easy Motion
nmap s <Plug>(easymotion-s)

"--------------------------------------------------
" Aautocmd

" It executes specific command when specific events occured
" like reading or writing file, or open or close buffer
if has("autocmd")
    " Define group of commands,
    " Commands defined in .vimrc don't bind twice if .vimrc will reload
    augroup vimrc
    " Delete any previosly defined autocommands
    au!
        " Auto reload vim after your cahange it
        au BufWritePost *.vim source $MYVIMRC | AirlineRefresh
        au BufWritePost .vimrc source $MYVIMRC | AirlineRefresh

        " Restore cursor position :help last-position-jump
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
          \| exe "normal g'\"" | endif
" Set filetypes aliases
        au FileType htmldjango set ft=html.htmldjango
        au FileType scss set ft=scss.css
        au FileType less set ft=less.css
        au BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax clear | endif
        au BufRead,BufNewFile *.js set ft=javascript.javascript-jquery
        au BufRead,BufNewFile *.json set ft=json
        " Execute python \ -mjson.tool for autoformatting *.json
        au BufRead,BufNewFile *.bemhtml set ft=javascript
        au BufRead,BufNewFile *.xjst set ft=javascript
        au BufRead,BufNewFile *.tt2 set ft=tt2
        au BufRead,BufNewFile *.plaintex set ft=plaintex.tex

        " Auto close preview window, it uses with tags,
        " I don't use it
        autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
        autocmd InsertLeave * if pumvisible() == 0|pclose|endif

        " Disable vertical line at max string length in NERDTree
        autocmd FileType * setlocal colorcolumn=80,120
        autocmd FileType nerdtree setlocal colorcolumn=""

        " Enable Folding, uses plugin vim-javascript-syntax
        au FileType javascript* call JavaScriptFold()

    " Group end
    augroup END

endif

" Indent on open brace
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*.o,*.obj,.git,node_modules,dist,coverage

nnoremap <Leader>r :CtrlPFunky<Cr>

" CtrlP-Funky custom filter
function! ctrlp#funky#ft#javascript#filters()
    let filters = [
        \ { 'pattern': '\m\C^[\t ]*\(if\|for\)\@![_a-zA-Z]\+\s*(.*)\s{',
        \   'formatter': ['\m\C^[\t ]*', '', ''] }
    \ ]
    return filters
endfunction

nnoremap <silent> <F5> :vertical resize -5<CR>
nnoremap <silent> <F6> :vertical resize +5<CR>
nnoremap <silent> <F7> :resize -5<CR>
nnoremap <silent> <F8> :resize +5<CR>

nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

set pastetoggle=<F4>

set splitbelow
set splitright

cnoreabbrev qq tabclose

set clipboard=unnamedplus

" JSDoc settings
let g:jsdoc_enable_es6=1
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_access_descriptions=2
let g:jsdoc_underscore_private=1
nmap <silent> <leader>j <Plug>(jsdoc)

" Snippets
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" CleverTab
inoremap <silent><tab> <c-r>=CleverTab#Complete('start')<cr>
                      \<c-r>=CleverTab#Complete('tab')<cr>
                      \<c-r>=CleverTab#Complete('ultisnips')<cr>
                      \<c-r>=CleverTab#Complete('keyword')<cr>
                      \<c-r>=CleverTab#Complete('omni')<cr>
                      \<c-r>=CleverTab#Complete('stop')<cr>
inoremap <silent><s-tab> <c-r>=CleverTab#Complete('prev')<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Ack
ca ack Ack!
ca Ack Ack!
let g:ackhighlight=1
if executable('ag')
    let g:ackprg = 'ag -S --nogroup --nocolor --ignore vendors --ignore www --ignore tests'
endif

" Tern
nmap td :TernDef<CR>
nmap tr :TernRename<CR>
nmap tt :TernType<CR>
nmap tf :TernRefs<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

inoremap <silent> <leader>; <C-o>A;

" Airline powerline symbols
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" NerdTree arrows
let g:NERDTreeDirArrowExpandable = '➜'
let g:NERDTreeDirArrowCollapsible = '⬆'

" Vim-argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>
au BufRead,BufNewFile *.go let b:argwrap_tail_comma = 1

" autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
