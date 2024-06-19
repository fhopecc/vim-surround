" test_surround.vim

" 載入待測模組
"

let s:testee = fnamemodify(expand('<sfile>:p:h'), ':h') . '\plugin\surround.vim'
execute "source " . s:testee 
let s:current_buffer = bufnr('%')

" 將多行字串設置為 buffer 的內容
function! Setup()
    let v:errors = []
    e test
    let test_text = "'日期欄位'"
    call setline(1, test_text)
endfunction

function! Test()
    normal l
    call assert_equal([0, 1, 2, 0], getcharpos('.'))
    normal dss
    call assert_equal('日期欄位', getline(1))
    call assert_equal([0, 1, 1, 0], getcharpos('.'))
    normal ysa"
    call assert_equal("日期欄位", getline(1))
    call assert_equal([0, 1, 1, 0], getcharpos('.'))
    let test_text = "'同行'有兩組'單引號'"
    call setline(1, test_text)
    call setcursorcharpos(1, 2)
    normal dss
    call assert_equal("同行有兩組'單引號'", getline(1))
endfunction

function! Teardown()
    execute 'bdelete! ' . bufnr('test')
    if v:errors != []
        for error in v:errors
            echon string(error)->strtrans()
            echon "\n"
        endfor
    endif
    execute 'buffer ' . s:current_buffer
endfunction

function! Run()
    call Setup()
    call Test() 
    call Teardown()
endfunction

" 運行測試
call Run()
