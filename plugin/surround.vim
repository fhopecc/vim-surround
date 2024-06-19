py3 from zhongwen.text import 取最近環繞符號, 插入環繞符號
" dss 刪除最近一個環繞符號
function! surround#delete_surround() abort
    let [bufnum, line_number, col_number; rest] = getcursorcharpos()
    let curline = strcharpart(getline(line_number), 0, col_number)
    let content = curline
    python3 << EOF
import vim
content = vim.eval('content')
最近環繞符號 = 取最近環繞符號(content)
命令字串 = r"s/" + 最近環繞符號[0] +"\(.\{-}\)" + 最近環繞符號[1] + r"/\1"
vim.command(命令字串)
EOF
    call setcursorcharpos(line_number, col_number-1)
endfunction
nmap dss :call surround#delete_surround()<cr>

function! surround#insert_surround(surround)
    let [bufnum, line_number, col_number; rest] = getcursorcharpos()
    let curline = getline(line_number)
    python3 << EOF
import vim
curline = vim.eval('curline')
col_number = int(vim.eval('col_number'))
surround = vim.eval('a:surround')
結果列 = 插入環繞符號(curline, surround, col_number)
EOF
    call setline(line_number, py3eval('結果列'))
endfunction
nmap ysw" :call surround#insert_surround('"')<cr>
nmap ysw( :call surround#insert_surround('(')<cr>
nmap ysw{ :call surround#insert_surround('{')<cr>
