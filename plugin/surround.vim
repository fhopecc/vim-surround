py3 from zhongwen.text import 取最近環繞符號
" ds -> 刪除最近一個環繞符號
function! surround#delete_surround_symbol() abort
    let [bufnum, line_number, col_number; rest] = getcursorcharpos()
    let curline = strcharpart(getline(line_number), 0, col_number)
    let content = curline
    " 使用 Python 函數處理緩衝區內容
    python3 << EOF
import vim
content = vim.eval('l:content')
最近環繞符號 = 取最近環繞符號(content)
命令字串 = r"s/" + 最近環繞符號[0] +"\(.*\)" + 最近環繞符號[1] + r"/\1"
vim.command(命令字串)
EOF
endfunction
