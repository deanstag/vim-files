set autoindent
set smartindent

map <F2>	<esc>:w<return><esc>


"-----------------------------------------------------------------------------
" SET ENVIRONMENT
"-----------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby.eruby-rails
autocmd BufNewFile,BufRead *.snippet set filetype=snippet
set magic
set expandtab
set smarttab
set ruler
set tabstop=8
set shiftwidth=3
set showmatch         
set showmode        
set hlsearch
set nowrap
set ruler             
set noinsertmode      
set laststatus=2      
set nocompatible
set ai                        
set bs=2              
set cindent
set incsearch 
"colorscheme wintersday
colorscheme wombat
set t_Co=256
set updatecount=20      " Number of characters typed before doing an update
set updatetime=500      " Number of milliseconds before doing an update
set history=100         " Number of history commands to remember
set viminfo='50,\"200   " read/write a .viminfo file, remember filemarks for 50
                        " files and store 200 lines of registers
set tags=./tags,tags,~/$PROJECT/tags

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
    unlet g:qfix_win
  else
    copen 10
    let g:qfix_win = bufnr("$")
  endif
endfunction


if &diff
   colorscheme wombat
endif
" -----rails start
filetype plugin on
filetype on
set viminfo^=!
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['eruby'] = 'eruby,eruby-rails'


" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

syntax enable
set novisualbell
set noerrorbells

nmap ,r :!(cd %:p:h;ctags *.[ch])&<CR> "recreate ctags in the directory
nnoremap <silent> ,t :TlistToggle<CR><C-W><C-W> "taglist toggle
map <C-n> :cn<CR>
map <C-p> :cp<CR>
map <F4> :!cc_co -nc -f %<CR><CR>L<CR>
map <C-g> /><CR>
nmap <Esc><Left> :tabp<CR>
nmap <Esc><Right> :tabn<CR>
map <C-T> :tabe %<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-k> :cfirst<CR>
map <C-l> :clast<CR>
map <silent> ,n :tn<CR>
map <silent> ,h :tp<CR>
map <C-m> :QFix<CR>
set pastetoggle=<F2>

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
  autocmd BufReadPost *
  \ if expand("<afile>:p:h") !=? $TEMP |
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \ let JumpCursorOnEdit_foo = line("'\"") |
  \ let b:doopenfold = 1 |
  \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
  \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
  \ let b:doopenfold = 2 |
  \ endif |
  \ exe JumpCursorOnEdit_foo |
  \ endif |
  \ endif
  " Need to postpone using "zv" until after reading the modelines.
  autocmd BufWinEnter *
  \ if exists("b:doopenfold") |
  \ exe "normal zv" |
  \ if(b:doopenfold > 1) |
  \ exe "+".1 |
  \ endif |
  \ unlet b:doopenfold |
  \ endif
augroup END

        fun SetupVAM()
          " YES, you can customize this vam_install_path path and everything still works!
          let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
          exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

          " * unix based os users may want to use this code checking out VAM
          " * windows users want to use http://mawercer.de/~marc/vam/index.php
          " to fetch VAM, VAM-known-repositories and the listed plugins
          " without having to install curl, unzip, git tool chain first
          " -> BUG [4] (git-less installation)
          if !filereadable(vam_install_path.'/vim-addon-manager/.git/config') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
            exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
            " VAM run helptags automatically if you install or update plugins
            exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
          endif

          " Example drop git sources unless git is in PATH. Same plugins can
          " be installed form www.vim.org. Lookup MergeSources to get more control
          " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

          call vam#ActivateAddons()
          " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
          " - look up source from pool (<c-x><c-p> complete plugin names):
          " ActivateAddons(["foo", ..
          " - name rewritings:
          " ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
          " ..ActivateAddons(["github:user/repo", .. => github://user/repo
          " Also see section "2.2. names of addons and addon sources" in VAM's documentation
        endfun
        call SetupVAM()
        " experimental: run after gui has been started (gvim) [3]
        " option1: au VimEnter * call SetupVAM()
        " option2: au GUIEnter * call SetupVAM()
        " See BUGS sections below [*]
        " Vim 7.0 users see BUGS section [3]


