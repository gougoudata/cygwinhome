set nocompatible
filetype plugin on
filetype indent on
set guifont=Consolas:h11:cANSI
set guioptions-=T
set guioptions-=r
set guioptions-=m
syntax on
set number
set cursorline
set mouse=a
set autoindent
set si
set history=1000
set noexpandtab                 " tabs are tabs, not spaces
set shiftwidth=4
set tabstop=4
set ignorecase
set incsearch
set hlsearch
set showmatch
set backspace=indent,eol,start  " backspace for dummys
set t_Co=256
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set pastetoggle=<F12>            " pastetoggle (sane indentation on pastes)
set completeopt=longest,menuone,preview "don't autoselect first item in omnicomplete,show if only one item(for preview)    
colorscheme solarized
set background=dark
au FileType cs set omnifunc=OmniSharp
set omnifunc=OmniSharp
set gdefault                    " the /g flag on :s substitutions by default
"inoremap <C-Space> <C-x><C-o>
highlight Pmenu ctermbg=238 gui=bold
set makeprg=build
set errorformat=\ %#%f(%l\\\,%c):\ %m
"Java anonymous classes. Sometimes, you have to use them.
"set cinoptions+=j1
"set tags=/home/jason/workspace/LateRoomsAndroidClient
"Make window smaller
"map - <C-W>-
"Make window bigger
"map = <C-W>+
"Switch window
map <F6> <C-W>w
" Supertab settings
noremap <C-C> :q<cr>
" " supertab + eclim == java win
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabLongestHighlight = 1
" F2 - Reformat XML
"map <F2> <Esc>:1,$!xmllint --format -<CR>r
"map <F5> :Ant debug<cr>
"map <C-T> :LocateFile<cr>
"map <C-R> :JavaRename
"map <F12> :JavaSearchContext<cr>
"" Eclim settings
"" " ,i imports whatever is needed for current line
"nnoremap <silent> <LocalLeader>i :JavaImport<cr>
"" " ,d opens javadoc for statement in browser
"nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
"" " ,<enter> searches context for statement
"nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
"" " ,jv validates current java file
"nnoremap <silent> <LocalLeader>jv :Validate<cr>
"" " ,jc shows corrections for the current line of java
"nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
"" " 'open' on OSX will open the url in the default browser without issue
"let g:EclimBrowser='open'h
" bind function to the tab key
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let g:partialWord= "none"
function! OmniSharp(findstart, base)
	if a:findstart
		let g:partialWord= expand('<cword>')
		echo g:partialWord
		"locate the start of the word
		 let line = getline('.')
		 let start = col(".") - 1
		 while start > 0 && line[start - 1] =~ '\a'
			 echo line[start]
			 let start -= 1
		 endwhile
		 return start
		
	else
		let res = []
:ruby << EOF
require 'socket'
 
host = '10.0.2.15'     
port = 2000                           

body = []
cursorPosition = VIM::evaluate('line2byte(line("."))+col(".")')
currentLine = VIM::evaluate('line(".")')
body << cursorPosition
body << VIM::evaluate('a:base')
body << VIM::Buffer.current.name
1.upto(VIM::Buffer.current.count) { |line| body << VIM::Buffer.current[line] }
request = body.join("\n")

socket = TCPSocket.open(host,port)  # Connect to the server
socket.print(request)               # Send request
response = socket.read              # Read complete response
print response   
words = response.split  ("\n")
words.each { |word| VIM::evaluate(word) }
EOF
		return res
	endif
endfunction
