"cが遠いので代用する。
noremap <C-j> <esc>
noremap! <C-j> <esc>
nnoremap <C-]> g<C-]>
noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap <Space>n  :NERDTree<CR>

"PHP開発環境
" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1


""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'

" インデントに色を付けて見やすくする
" Plug 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1

" 余談: neocompleteは合わなかった。ctrl+pで補完するのが便利

call plug#end()


syntax on
set number

augroup vimrc-filetype
  autocmd!
  " PHPだったらインデント幅が４で
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd FileType php setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
augroup END
" PHP コンパイルエラチェック
function! s:PHPLint()
  let s:result = system('php -l ' . bufname(""))
  let s:count = split(s:result, "\n")
  echo s:result
endfunction
" 
augroup php-lint
  autocmd!
  autocmd BufWritePost *.php call <SID>PHPLint()
augroup END

