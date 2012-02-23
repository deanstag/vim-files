" Vim color file
" Maintainer:   Stefan Karlsson <stefan.74@comhem.se>
" Last Change:  14 July 2004


set background=light

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="chela_light"


"= Syntax Groups =============================================

hi comment      guibg=#ffffff   guifg=#339933   gui=none

hi constant     guibg=#ffffff   guifg=#ff3333   gui=none
hi specialchar  guibg=#ffffff   guifg=#ff3333   gui=underline

hi identifier   guibg=#ffffff   guifg=#3333ff   gui=none

hi statement    guibg=#ffffff   guifg=#3333ff   gui=none
hi label        guibg=#ffffff   guifg=#3333ff   gui=none

hi preproc      guibg=#ffffff   guifg=#3333ff   gui=none
hi include      guibg=#ffffff   guifg=#3333ff   gui=none
hi precondit    guibg=#ffffff   guifg=#cc00cc   gui=none

hi type         guibg=#ffffff   guifg=#3333ff   gui=none

hi special      guibg=#ffffff   guifg=#cc00cc   gui=none

hi error        guibg=#ff3333   guifg=#ffffff   gui=none

hi todo         guibg=#339933   guifg=#ffffff   gui=none


"= General Groups ============================================

hi cursor       guibg=#000000   guifg=#ffffff   gui=none

hi directory    guibg=#ffffff   guifg=#3333ff   gui=none

hi diffadd      guibg=#66ff66   guifg=#000000   gui=none
hi diffdelete   guibg=#ff6666   guifg=#ff6666   gui=none
hi diffchange   guibg=#ffff00   guifg=#cccc99   gui=none
hi difftext     guibg=#ffff00   guifg=#000000   gui=none

hi errormsg     guibg=#ff3333   guifg=#ffffff   gui=none

hi vertsplit    guibg=#3333ff   guifg=#3333ff   gui=none

hi folded       guibg=#eeeeee   guifg=#3333ff   gui=none
hi foldcolumn   guibg=#eeeeee   guifg=#999966   gui=none

hi linenr       guibg=#ffffff   guifg=#999966   gui=none

hi modemsg      guibg=#ffffff   guifg=#999966   gui=none

hi moremsg      guibg=#339933   guifg=#ffffff   gui=none
hi question     guibg=#339933   guifg=#ffffff   gui=none

hi nontext      guibg=#ffffff   guifg=#999966   gui=none

hi normal       guibg=#ffffff   guifg=#000000   gui=none

"hi search       guibg=#ffff00   guifg=#000000   gui=none
hi search       guibg=#cc00cc   guifg=#ffffff   gui=none
hi incsearch    guibg=#ff3333   guifg=#ffffff   gui=none

hi specialkey   guibg=#ffffff   guifg=#cc00cc   gui=none

hi statusline   guibg=#3333ff   guifg=#ffffff   gui=none
hi statuslinenc guibg=#3333ff   guifg=#999999   gui=none

hi title        guibg=#ffffff   guifg=#6666ff   gui=none

hi visual       guibg=#bbbbbb   guifg=#333333   gui=none

hi warningmsg   guibg=#ffffff   guifg=#ff0000   gui=none

hi wildmenu     guibg=#339933   guifg=#ffffff   gui=none


" [eof]

