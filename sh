#bindkey "^[/" _history-complete-older
#zstyle ':completion:*:history-words' remove-all-dups true
#zstyle ':completion:*' range 50000:10000

#autoload transpose-words-match
#zle -N transpose-words-match
#bindkey "^[t" transpose-words-match

#backward-kill-shell-word() {
#  zle select-in-shell-word
#  ((++CURSOR))  # adjust for vi vs. emacs region
#  zle kill-region
#}
#zle -N backward-kill-shell-word
#bindkey "^[w" backward-kill-shell-word

#autoload incremental-complete-word
#zle -N incremental-complete-word
#bindkey "^T" incremental-complete-word
#zstyle ':completion:incremental:*' completer _complete _ignored
#zstyle :incremental stop-keys $'[\e\C-b\C-f\C-n\C-p\C-u-\C-x]'

#RPROMPT='[%D{%L:%M:%S %p}]'
#TMOUT=1
#TRAPALRM() {
#    zle reset-prompt
#}

# vim:ft=zsh
