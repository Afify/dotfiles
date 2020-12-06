" setlocal spell spelllang=en_us
" syn match T_header  /^\[\s.*\s]$/
syn match makeIdent    /\t\[\s.*\s]$/
syn match n_red        /\t\?-\s\[u\]\s.*/
syn match n_purple     /\t\?-\s\[w\]\s.*/
syn match Sgreen        /\t\?-\s\[x\]\s.*/
syn match Comment      /\t\?-\s\[l\]\s.*/

syn match blue         /^### .*/
syn match yellow       /\t\?## .*/
syn match magenta      /\t\?# .*/
syn match f_blue       /^-> .*/
