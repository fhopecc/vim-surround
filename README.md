# vim-surround
 surrond text-object support for vim

# install 
PlugInstall fhopecc/vim-surround

# command 

|command|function                                                 |
|:-----:|:-------------------------------------------------------:|
|ds     |delete the nearest surround symbols.                     |
|dss    |delete the nearest surround symbols.                     |
|dis    |delete the nearest surround content.(not imp)            |
|das    |delete the nearest surround content and symbols.(not imp)|

Ex.
    There is a (parenthesys). -[ds]-> There is a parenthesys.
