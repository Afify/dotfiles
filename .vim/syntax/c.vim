syn keyword Type chararray pid_t uid_t gid_t mode_t Task Task_t Pane Entry Bookmark Rule Key Evkey Cpair Arg
" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc Function
