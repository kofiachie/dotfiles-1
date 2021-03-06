let mapleader = " "

" set terminal title
set title
set titleold=""
set titlestring=vim\ %F

if $TERM =~# '^\%(screen\|tmux\)'
  let &t_ts = "\e]2;" " Set pane title in tmux
endif

set backspace=2    " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile     " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler          " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch      " do incremental searching
set laststatus=2   " Always display the status line
set autowrite      " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Load bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Colorscheme
colorscheme github

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=255 guibg=#ECECEC

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Numbers
set number
set numberwidth=5
set relativenumber

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Startify Configuration
let g:startify_files_number = 5
let g:startify_bookmarks = [
  \{'b': '~/src/our-boxen'},
  \{'d': '~/dotfiles'},
  \{'v': '~/.vimrc'},
  \{'z': '~/.zshrc'}
  \]

" Syntastic
let g:syntastic_check_on_open = 1 " Show linting errors immediately
let g:syntastic_javascript_checkers = ['eslint', 'flow']

" Avoid escape
:imap jj <Esc>
:imap jk <Esc>
:imap kk <Esc>

" Markdown
let g:markdown_fenced_languages = ['html', 'coffee', 'json', 'javascript',
  \'js=javascript', 'python', 'bash=sh']

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
