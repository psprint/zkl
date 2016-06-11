znt_functions_keywords=( "zplg" "zgen" "match" )
znt_list_instant_select=1
znt_list_border=1
znt_list_bold=1
znt_list_colorpair="green/black"
#znt_list_colorpair="white/17"
znt_cd_active_text="underline"
znt_kill_active_text="underline"
znt_history_active_text="underline"
znt_cd_hotlist=( "/usr/local/share/zsh" "~/github/zsh-navigation-tools" "~/github/ztrace/"
                 "~/github/zsh-cmd-architect" "~/github/zsh-editing-workbench" )
znt_kill_keywords=( "git" "git commit" "vim" "firefox" "mplayer" )
#znt_list_themes=( "green/black/1" "black/white/1" )

zle -N znt-cd-widget
bindkey "^B" znt-cd-widget
zle -N znt-kill-widget
bindkey "^Y" znt-kill-widget

# vim:ft=zsh
