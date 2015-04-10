set nocompatible               " be iMproved

" Vundle {
  filetype off                   " required!
  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle
  " required!
  Plugin 'gmarik/Vundle.vim'

    " Plugins {
    " github plugins

        "Plugin 'Lokaltog/vim-powerline'
        "Plugin 'Shougo/neocomplcache'
        "Plugin 'Shougo/neosnippet'
        "Plugin 'vim-scripts/JavaScript-Indent'
        Plugin 'Valloric/YouCompleteMe'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'bling/vim-airline'
        Plugin 'corntrace/bufexplorer'
        Plugin 'kien/ctrlp.vim'
        Plugin 'lambdalisue/nodeunit.vim.git'
        Plugin 'marijnh/tern_for_vim'
        Plugin 'matchit.zip'
        Plugin 'mattn/gist-vim'
        Plugin 'mattn/webapi-vim'
        Plugin 'mileszs/ack.vim'
        Plugin 'mustache/vim-mustache-handlebars'
        Plugin 'pangloss/vim-javascript'
        Plugin 'reinh/vim-makegreen'
        Plugin 'rizzatti/dash.vim'
        Plugin 'rizzatti/funcoo.vim'
        Plugin 'scrooloose/nerdcommenter'
        Plugin 'scrooloose/syntastic'
        Plugin 'tpope/vim-fugitive'
        Plugin 'tpope/vim-markdown'
        Plugin 'tpope/vim-surround'
        Plugin 'vim-scripts/Colour-Sampler-Pack'
        Plugin 'vim-scripts/Liquid-Carbon.git'
        Plugin 'wincent/Command-T'
        Plugin 'yaroot/vissort'
        Plugin 'mxw/vim-jsx'
        Plugin 'tfnico/vim-gradle'
        Plugin 'suan/vim-instant-markdown'
        "Plugin 'myusuf3/numbers.vim'
        if executable('ctags')
            Plugin 'majutsushi/tagbar'
        endif

      " vim script plugins
        Plugin 'FuzzyFinder'
        Plugin 'Indent-Guides'
        Plugin 'L9'
        Plugin 'The-NERD-tree'
        Plugin 'cscope.vim'
        Plugin 'file-line'
        Plugin 'repeat.vim'
        "Plugin 'yaifa.vim'

        call vundle#end()            " required
        filetype plugin indent on     " required!
    " }
" }

" General {
    set background=dark         " Assume a dark background
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    set mouse=a                 " automatically enable mouse usage
    scriptencoding utf-8
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " always switch to the current file directory.

    "set autowrite                  " automatically write a file when leaving a modified buffer
    "set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    "set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set nospell                       " spell checking off
    set hidden                      " allow buffer switching without saving

    " Setting up the directories {
        set backup                      " backups are nice ...
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif
        " Could use * rather than *.*, but I prefer to leave .files unsaved
"        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
"        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
    " }
" }

" Vim UI {
    color candycode " load a colorscheme
    "color solarized  load a colorscheme
    "color liquidcarbon " load a colorscheme
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line

    if has('cmdline_info')
        set ruler                   " show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
        set showcmd                 " show partial commands in status line and
                                    " selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\    " Filename
        set statusline+=%w%h%m%r " Options
        set statusline+=%{fugitive#statusline()} "  Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " filetype
        set statusline+=\ [%{getcwd()}]          " current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set scrolloff=3                 " minimum lines to keep above and below cursor
    set foldenable                  " auto fold code
    set list
    set listchars=tab:,.,trail:.,extends:#,nbsp:. " Highlight problematic whitespace

" }
"
" Formatting {
    set wrap
    set colorcolumn=80              " show margin at 80
    set shiftwidth=4                " use indents of 4 spaces
    set tabstop=4                   " an indentation every 4 columns
    set softtabstop=4               " let backspace delete indent
    set expandtab                   " spaces and not tabs

    " Remove trailing whitespaces and ^M chars
    " autocmd BufWritePre  *.{cpp,h,c,conf,restdown,md,java,js,python,twig,xml,yml,rb,py,pm,pl,md,etc}  call StripTrailingWhite()
    autocmd BufWritePre  *.* call StripTrailingWhite()

    function! StripTrailingWhite()
        let l:winview = winsaveview()
        silent! %s/\s\+$//
        call winrestview(l:winview)
    endfunction

    "set lines?
    "set columns?
    set nospell
    "turn off the bell
    set noeb vb t_vb=

    " Enable paste togle
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set showmode
    " copy a highlighted portion to eh paste buffer
    command -range Copy silent '<,'>w ! pbcopy
" }


" Key (re)Mappings {

    "The default leader is '\', but many people prefer ',' as it's in a standard
    "location
    let mapleader = ','

    " Making it so ; works like : for commands. Saves typing and eliminates :W style typos due to lazy holding shift.
    nnoremap ; :

    " Easier moving in tabs and windows
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    "clearing highlighted search
    nmap <silent> <leader>/ :nohlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv
    " For when you forget to sudo.. Really Write the file.
    "cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=
" }

" Plugins {
  " Buffer explorer {
    nmap <leader>b :BufExplorer<CR>
  " }

  " airline {
      if !exists('g:airline_symbols')
          let g:airline_symbols = {}
      endif
      let g:airline_symbols.space = "\ua0"
      let g:airline#extensions#tabline#enabled = 1
  " }
  " gist-vim {
      let g:gist_clip_command = 'pbcopy'
  " }

  " NerdTree {
      let NERDTreeMapToggleHidden=1
      map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
      map <leader>e :NERDTreeFind<CR>
      nmap <leader>nt :NERDTreeFind<CR>

      let NERDTreeShowBookmarks=1
      let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
      let NERDTreeChDirMode=0
      let NERDTreeQuitOnOpen=1
      let NERDTreeShowHidden=1
      let NERDTreeKeepTreeInNewTab=1
  " }
  " Ack {
      let g:ackprg = 'ag --nogroup --nocolor --column'
  " }

  " syntastic settings {
      let g:syntastic_check_on_open=1
      "let g:syntastic_auto_loc_list=1
  " }

  " Ctags {
      set tags=./tags;/,~/.vimtags
  " }

  " TagBar {
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
  "}

  " Vim Indent Guides {
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  "}

  " OmniComplete {
      if has("autocmd") && exists("+omnifunc")
          autocmd Filetype *
              \if &omnifunc == "" |
              \setlocal omnifunc=syntaxcomplete#Complete |
              \endif
      endif

      hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
      hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
      hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

      " automatically open and close the popup menu / preview window
      au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
      set completeopt=menu,preview,longest
  " }
  " javascript.vim {
    "set compiler=nodeunit
  " }

  "" neocomplcache {
    "let g:neocomplcache_enable_at_startup = 1
    "let g:neocomplcache_enable_camel_case_completion = 1
    "let g:neocomplcache_enable_smart_case = 1
    "let g:neocomplcache_enable_underbar_completion = 1
    "let g:neocomplcache_min_syntax_length = 3
    "let g:neocomplcache_enable_auto_delimiter = 1

    "" AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 0

    "" SuperTab like snippets behavior.
    "imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

    "" Plugin key-mappings.
    "imap <C-k>     <Plug>(neocomplcache_snippets_expand)
    "smap <C-k>     <Plug>(neocomplcache_snippets_expand)
    "inoremap <expr><C-g>     neocomplcache#undo_completion()
    "inoremap <expr><C-l>     neocomplcache#complete_common_string()


    "" <CR>: close popup
    "" <s-CR>: close popup and save indent.
    "inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    "inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup() "\<CR>" : "\<CR>"
    "" <TAB>: completion.
    "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    "" <C-h>, <BS>: close popup and delete backword char.
    "inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    "inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    "inoremap <expr><C-y>  neocomplcache#close_popup()
    "inoremap <expr><C-e>  neocomplcache#cancel_popup()

    "" Enable omni completion.
    "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    "" Enable heavy omni completion.
    "if !exists('g:neocomplcache_omni_patterns')
        "let g:neocomplcache_omni_patterns = {}
    "endif
    "let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    ""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    "let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    "let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

    "" For snippet_complete marker.
    "if has('conceal')
        "set conceallevel=2 concealcursor=i
    "endif

  "" }
"" }


" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " remove the toolbar
        set lines=40                " 40 lines of text instead of 24,
        if has("gui_gtk2")
            set guifont=Menlo:h11
        else
            set guifont=Menlo:h11
        endif
        if has('gui_macvim')
            set transparency=5          " Make the window slightly transparent
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }
 " Functions {

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
