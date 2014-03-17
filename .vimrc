" =============== Vim Javascript development setup =================
" Installation:

"     1 Install HomeBrew if needed.

"         http://brew.sh/

"     2. Install MacVim with lua/python support using HomeBrew:

"        # Move any existing MacVim.app out of the way.
"        mv /Applications/MacVim.app /Applications/MacVim_Backup.app

"        # Run the brew install command:
"        brew install macvim --with-cscope --with-lua --python --HEAD

"        # Put the app in your /Applications directory
"        brew linkapps

"     3. Install vim-airline font:

"        open Fonts/Inconsolata-dz+for+Powerline.otf
"        # Click "Install Font"

"     3. Install node.js if you want JS features such as linting.

"     4. Install NeoBundle:

"       mkdir -p ~/.vim/bundle
"       git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"       # Then open Vim/MacVim and run:
"       :NeoBundleInstall

"
" MacVim Key Mappings Paradigm: (Please not the capitalization)
" ================================================================================
" ProTip: In Mac OSX keyboard settings, remap caps lock to escape
"
" Navigation:
" Control+l               Mega-escape. Use it. It "gets you out of everything".
"
" Tab Or Shift+Tab        (Command Mode) navigation between vertical splits.
" Space Or Shift+Space    (Command Mode) navigation between tabs.
"
" Command+L               Switch to the last open tab.
"
" Finding Files In General:
" - s                     Split vertically
" - Return                Open in new tab
"
" Finding Files In Left Nav:
" Command+e               Toggle Left Nav.
" s                       In Left nav when file focused, splits file vertically.
" o                       In Left nav when file focused, replaces existing open file with
" Return                  In Left nav when file focused, Opens existing file in new tab.
"
" Finding Files In Typeahead: (Control P)
" Command+p               Typeahead for all open files, files in git repo - everything!
" Command+t               Typeahead for open files.
" s                       When typeahead open, splits file vertically or opens existing file.
" Return                  When typeahead open, opens in new tab or opens existing file.
" Control+n               When typeahead open, moves cursor down.
" Control+p               When typeahead open, moves cursor up.
"
"   > With the way control P is configured, it will always jump to an existing
"   > file when possible.
"
" Code Auto Completion As You Type:
" Is enabled.
"
" When Not In Insert Mode (Normal Mode):
"
" Space or Shift+Space    Move to next/prev file tab.
" Tab or Shift+Tab        Move to next/prev vertical split.
" Command+Shift+L         Focus previously visited tab/split (like a "back button" for Vim).
"
" Vertical Split Auto Resize:
" Automatically Keeps current vertical split at 80chars. Evenly divides up
" remaining space. (You could configure this).
"
" Airline:
" Powerline style plugin. Color schemes also style this plugin.
"
" Consistent UI Styles:
" Hide distracting Vim characters such as `~`.
"
" Javascript Development:
" Inline JavaScript linting (underlining in red). Understands JSX.  Stock
" JavaScript snippets, JSHint/JSX, great JavaScript indentation as you type.
"
" TextMate Sublime Style Features:
" -Snippets via Ultisnips:
" Powerful snippets feature (JavaScript snippets by default). Add snippets to
" ~/.vim/myUltiSnippets/
"
" - Sort lines using <F5>
" - Toggle Left Nav via Command+e
"
" - Auto-brace completion: Uses the excellent auto-brace-bracket insertion
"   plugin "vim-PairTools.git". Other plugins do not even compare.  Auto inserts
"   HTML tags, even when using Javascript JSX!  <Typeahead> (automatically
"   inserts) "</Typeahead>"
"
" Spell Check:
" Command+P to toggle spell check on comments (underlines in red).
"
" IPhone Simulator Integration:
" Command+R saves the current file, opens Simulator and refreshes your page.
"
" Mac OSX Integration:
" Key mappings that are Mac-centric (lots of awesome CMD mappings)
"
"  To further improve the text rendering on Mac OSX:
"  1. From the shell: defaults write org.vim.MacVim MMCellWidthMultiplier 0.9
"  2. Opens all files from other apps in vert split defaults write
"  org.vim.MacVim MMVerticalSplit YES
"  3. If when changing monitors, your fonts go from nice and thin to ugly and
"  bold: This should fix it:
"   defaults -currentHost write -globalDomain AppleFontSmoothing -int 1
"
"
" Cygwin:
" Tested and should work. AutoHotkey recommended mappings create identical Mac
" OSX experience.
"
" Bundle System:
" Uses the NeoBundle system. Add bundles to ~/.vim/bundlesVimRc with:
" NeoBundle "git://github.com/youruser/something.git"
" Open New Vim Windows and it will ask you to install.
" Close and then reopen the vim window.
"
" Customization:
" Place custom vim setup in
"
" ~/.vim/gvimrc.custom.before/after  : Ran before/after this distributions gvimrc
"
" ~/.vim/vimrc.custom.before/after   : Ran before this distributions vimrc
"
"   - `before` runs before any plugins are installed.
"   - You can install your own plugins here using the `NeoBundle` command.
"   - There are some special settings that you can define here that the stock
"   setup will pay attention to:
"
"   g:textColumns   " Which column text wraps at (default 80)
"   g:tabSize       " How many spaces should a tab consume (default 2)
"
"   Other plugins that are installed obviously have their own global settings
"   that they look for - so define those in the `vimrc.custom.before` as well.
"

" ================== Bundling ======================:
" ============ How to Install plugins ==============:
" 1. Open up ~/.vim/vimrc.custom.before and write
"
"     NeoBundle "theirGithubName/theirProjectName"
"
" 2. Open up yet another VIM window, to install newly added plugins.

filetype plugin on " Required for NeoBundle and also good.
filetype indent on " Required for NeoBundle and also good.
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if filereadable(expand("~/.vim/vimrc.custom.before"))
  source ~/.vim/vimrc.custom.before
endif

set noswapfile     " Don't make backups.
set nowritebackup " Even if you did make a backup, don't keep it around.
set nobackup

syntax on
set virtualedit=block
set tabstop=2
set nonumber
set noswapfile

set mouse=a
set nospell
set ic
set scs

" TODO: Set up mappings to toggle between text mode and code mode.
" Editing code
set nowrap
set wrapmargin=0
let &textwidth=exists('g:textColumns') && !empty(g:textColumns) ? g:textColumns : 80
set nolinebreak

set hlsearch
set formatoptions+=or

let &tabstop=exists('g:tabSize') ? g:tabSize : 2
let &softtabstop=exists('g:tabSize') ? g:tabSize : 2
let &shiftwidth=exists('g:tabSize') ? g:tabSize : 2
set expandtab
set ignorecase
set infercase
let g:omni_syntax_ignorecase=1
set wildmode=full
set wildignore+=*node_modules*
set sm!  " show matching brace/paren
set visualbell
" Should avoid "Hit Enter" annoyingness (Does *not* work)
" set shortmess+=filmnrxoOtT

" Mac Support bootstrap
set wildignore+=*.DS_Store

" Remove ugly folds
set nofoldenable
" nofoldenable doesn't work in diff mode so do something similar
set diffopt=filler,context:9999

" ============= Configure as Privacy Plugin =========================
" All sensitive data is not stored in your ~/.vimrc folder
" Configure the spelling language and file.
set spelllang=en
set spellfile=$HOME/vim_spell/en.utf-8.add
" UndoDir:
if has('win32') || has ('win64')
  let s:homeFolder = $VIM     " Close enough:
else
  let s:homeFolder = $HOME
endif
let s:undoDir = s:homeFolder . '/vimUndo'
set undofile
" " Create undo dir if needed - not in your dotVim folder! It should be local to
" " your computer.
if !isdirectory(s:undoDir)
	call mkdir(s:undoDir)
endif
execute "set undodir=".s:undoDir
" ================================================================

" http://stackoverflow.com/questions/6852763/vim-quickfix-list-launch-files-in-new-tab
set switchbuf+=usetab,newtab

" A better diff link for macvim
" alias mvimdiff="mvim -O  \"+windo set diff scrollbind scrollopt+=hor nowrap\""

" All ObjC/C++ files are ObjCPP.
" All snipets for ObjC are in ~/.vim/myUltiSnippets/objcpp.snippets
au BufNewFile,BufRead *.cpp set filetype=objcpp
au BufNewFile,BufRead *.h set filetype=objcpp
au BufNewFile,BufRead *.m set filetype=objcpp

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

source ~/.vim/.bundlesVimRc
source ~/.vim/.guiSettingsVimRc   " Must come after .bundlesVimRc
source ~/.vim/.keysVimRc
source ~/.vim/.customFunctions.vim

NeoBundleCheck

if filereadable(expand("~/.vim/vimrc.custom.after"))
  source ~/.vim/vimrc.custom.after
endif
