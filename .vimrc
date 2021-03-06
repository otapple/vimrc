"取消兼容
set nocompatible
"设置全屏
set fu

let mapleader=","

"vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bufexplorer.zip'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'syntastic'
Plugin 'delimitMate.vim'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized' " vim theme
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-commentary'
Plugin 'mileszs/ack.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'Tabular'
"Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'justinj/vim-react-snippets'
Plugin 'tpope/vim-surround'
Plugin 'rizzatti/dash.vim'

call vundle#end()
filetype plugin indent on

"显示行号
set nu
"语法高亮
syntax on
set incsearch    " search as you type"

filetype on 
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set laststatus=2
set encoding=utf-8
set ignorecase
set nobackup
set nowb
set guifont=Monaco:h18
set lines=50 columns=150

" autocmd FileType javascript set tabstop=2 
" autocmd FileType javascript set softtabstop=2 
" autocmd FileType javascript set shiftwidth=2
"let g:Powerline_symbols='fancy'

"ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ctrlp
let g:ctrlp_by_filename=1

"nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight '. a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match '. a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('lua', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('cpp', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('c', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('sh', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('m', 'Magenta', 'none', 'Magenta', '#151515')
call NERDTreeHighlightFile('mm', 'Magenta', 'none', 'Magenta', '#151515')
call NERDTreeHighlightFile('h', 'white', 'none', 'white', '#151515')

"vim-colors-solarized
let g:solarized_termcolors=256
set background=dark
let g:solarized_visibility="high"
let g:solarized_contrast="hight"
colorscheme solarized

"vim-gitgutter
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

"snips
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
 "自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>

let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"设置错误标志
let g:ycm_error_symbol='✗'
highlight YcmErrorLine guibg=#3F0000
"设置警告标记
let g:ycm_warning_symbol = '!'
highlight YcmWarningLine guibg=#777700

"ctrlp
set wildignore+=*/runtime/*,*/frameworks/*,*/log/*,*/tmp/*,*/writable/*,*.so,*.swp,*.zip,*png,*csb

"vim-ccommentary
autocmd FileType python,shell set commentstring=#\ %s
autocmd FileType lua set commentstring=--\ %s

"按键映射
nmap <F8> :TagbarToggle<CR><C-w>l/
nmap <F7> :TagbarToggle<CR>
nnoremap <F5> :!python run.py<CR><CR>
nnoremap <leader>= :Tab /=<CR>

if has("gui_macvim")
    set macmeta
    noremap <silent><c-tab> :tabprev<CR>
    inoremap <silent><c-tab> <ESC>:tabprev<CR>
    noremap <silent><d-1> :tabn 1<cr>
    noremap <silent><d-2> :tabn 2<cr>
    noremap <silent><d-3> :tabn 3<cr>
    noremap <silent><d-4> :tabn 4<cr>
    noremap <silent><d-5> :tabn 5<cr>
    noremap <silent><d-6> :tabn 6<cr>
    noremap <silent><d-7> :tabn 7<cr>
    noremap <silent><d-8> :tabn 8<cr>
    noremap <silent><d-9> :tabn 9<cr>
    noremap <silent><d-0> :tabn 10<cr>
    inoremap <silent><d-1> <ESC>:tabn 1<cr>
    inoremap <silent><d-2> <ESC>:tabn 2<cr>
    inoremap <silent><d-3> <ESC>:tabn 3<cr>
    inoremap <silent><d-4> <ESC>:tabn 4<cr>
    inoremap <silent><d-5> <ESC>:tabn 5<cr>
    inoremap <silent><d-6> <ESC>:tabn 6<cr>
    inoremap <silent><d-7> <ESC>:tabn 7<cr>
    inoremap <silent><d-8> <ESC>:tabn 8<cr>
    inoremap <silent><d-9> <ESC>:tabn 9<cr>
    inoremap <silent><d-0> <ESC>:tabn 10<cr>
    noremap <silent><d-o> :browse tabnew<cr>
    inoremap <silent><d-o> <ESC>:browse tabnew<cr>
endif

"ack 搜索
nnoremap <a-f> :Ack -i 

"SET Comment START
function SetComment()
	if expand("%:e") == 'lua'
		let comstr='--'
		let comspa='	'
		" call setline(1, comstr.' lua file')
	elseif expand("%:e") == 'cpp'
		let comstr='//'
		let comspa='	'
		" call setline(1, comstr.'c++ file')
	elseif expand("%:e") == 'py'
		let comstr='#'
		let comspa=''
		" call setline(1, comstr.'!/usr/bin/env python')
	else 
		return
	endif

	call append(0, comstr)
	call append(1, comstr.'	Filename:	'.comspa.expand("%:t"))
	call append(2, comstr.'	Author:		'.comspa.'fengqiang')
	call append(3, comstr.'	Create:		'.comspa.strftime("%Y-%m-%d %H:%M:%S"))
	call append(4, comstr.'	Last Modified:	'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(5, comstr)
endf

autocmd BufNewFile *.lua,*.cpp,*.py call SetComment() | normal G
nnoremap <C-H> :call SetComment()<cr>

"update last modified time
function FQUpdateModTime()
	if expand("%:e") == 'lua'
		let comstr='--'
	elseif expand("%:e") == 'cpp'
		let comstr='//'
	elseif expand("%:e") == 'py'
		let comstr='#'
	endif

	let save_cursor = getcurpos()
	call cursor(6, 1)
	if search('Last Modified') != 0
		let line = line('.')
		call setline(line, comstr.'	Last Modified:	'.strftime("%Y-%m-%d %H:%M:%S"))
	endif
	call setpos('.', save_cursor)
endf	

autocmd FileWritePre,BufWritePre *lua,*cpp,*py call FQUpdateModTime()

"syntastic
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--codes --config luacheckrc"

let g:syntastic_style_error_symbol = "✗"
let g:syntastic_style_warning_symbol = "!"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "!"

highlight SyntasticErrorLine guibg=#3f0000
highlight SyntasticWarningLine guibg=#777700
highlight SyntasticStyleErrorLine guibg=#3f0000
highlight SyntasticStyleWarningLine guibg=#777700

"enable jsx for files with the .js extension
let g:jsx_ext_required = 0

"Ctrlp funky
nnoremap <F4> :CtrlPFunky<cr>
" narrow the list down with a word under cursor
" nnoremap <C-S-M> :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_funky_nolim = 1
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
