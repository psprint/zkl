# Command / group separator
export A="1"

# HELPERS {{{1
myls()
{
    [ "$PWD" != "${PWD%Dropbox*}" ] && echo -e '\x1b[5m<Dropbox>\x1b[0m'
    if [ ! -d _darcs ]; then
        if [ ! -d .git ]; then
            # Normal
            command ls "$@"
            return
        fi
    fi

    if [ "$PWD" = "$HOME" ]; then
        # In $HOME - still normal
        command ls "$@"
        return
    fi

    # Full listing if in a git/darcs repository
    command ls -A "$@"
}
# 1}}}

#
# Install / remember options
#

(( ABSD )) && {
    alias ls="ls -G"
} || {
    alias ls="ls --color=auto -bGh"
}
alias l=ls
alias l.='ls -d .*'
alias la='ls -a'
alias ll='ls -lhct'
alias rm='rm -i'
alias grep="grep --colour=auto"
alias lynx="lynx -accept-all-cookies"
alias df='df -h'
alias du='du -h'
alias cp='cp -v'
alias mv='mv -v'
alias plast="last -20"
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

#
# Global aliases
#

[ "$SHELL" = "zsh" ] && {
    alias -g SPRNG="| curl -F 'sprunge=<-' http://sprunge.us"
}

# Git
alias g${A}log_branches="git log --color=always --oneline --decorate --graph --branches"
alias g${A}log_branches_intag="echo You can append a tag name; LANG=C sleep 0.5; \
git log --color=always --oneline --decorate --graph --branches"
alias g${A}log_simplify_decfull="git log --color=always --decorate=full --simplify-by-decoration"
alias g${A}log_simplify="git log --color=always --simplify-by-decoration --decorate"

# Image Magick
alias i${A}montage_concat_topbo_black="montage -mode concatenate -tile 1x -background black"
alias i${A}montage_concat_topbo_white="montage -mode concatenate -tile 1x -background white"
alias i${A}convert_append_topbo_black="convert -append -background black"
alias i${A}convert_append_topbo_white="convert -append -background white"
alias i${A}convert_append_lefri_black="convert +append -background black"
alias i${A}convert_append_lefri_white="convert +append -background white"

# ffmpeg
ff_tomp4() {
    if [ "$2" != "" ]; then
        ffmpeg -i "$1" -qscale 0 "$2"
    else
        ffmpeg -i "$1" -qscale 0 "${1%.*}.mp4"
    fi
}

# Homebrew
alias b${A}s="brew search"
alias b${A}i="brew install"
alias b${A}u="brew uninstall"
alias b${A}info="brew info"
alias b${A}desc="brew desc"
alias b${A}descs="brew desc --search"
alias b${A}ls="brew list"
alias b${A}muver="brew ls --versions --multiple"
alias b${A}leaves="brew leaves"
alias b${A}home="brew home"
alias b${A}upgrade="brew update; brew upgrade; brew cleanup"
alias b${A}uses_installed="brew uses --installed"
# Homebrew/cask
alias b${A}cask_s="brew cask search"
alias b${A}cask_i="brew cask install"
alias b${A}cask_u="brew cask uninstall"
alias b${A}cask_info="brew cask info"
alias b${A}cask_ls="brew cask list"
alias b${A}cask_home="brew cask home"

#
# Quick typing
#

alias n${A}keyfrogshell="ssh -t srnt,keyfrog@shell.sf.net create"
alias n${A}spodekshell="ssh -t srnt,spodek@shell.sf.net create"
alias n${A}ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias n${A}localip="ipconfig getifaddr en1"
alias n${A}ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias n${A}sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias n${A}httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
n1gglinks() {
    search=`echo "$1+$2+$3+$4+$5+$6+$7+$8+$9" | sed 's:\+*$::'`
    links google.com/search\?q="$search"
}
n1ggw3m() {
    search=`echo "$1+$2+$3+$4+$5+$6+$7+$8+$9" | sed 's:\+*$::'`
    w3m google.com/search\?q="$search"
}
n1ling() {
    search=`echo "$1+$2+$3+$4+$5+$6+$7+$8+$9" | sed 's:\+*$::'`
    w3m ling.pl/"$search"
}
n1diki() {
    search=`echo "$1+$2+$3+$4+$5+$6+$7+$8+$9" | sed 's:\+*$::'`
    w3m www.diki.pl/slownik-angielskiego/"?q=$search"
}
n1dict() {
    search=`echo "$1+$2+$3+$4+$5+$6+$7+$8+$9" | sed 's:\+*$::'`
    w3m dict.pl/dict"?word=$search"
}

alias ydlstat="ps -axo etime,state,pid,command | egrep --color=always '(python.*youtube-dl)|(/n1auto-youtube-dl.sh)' | grep -v egrep ; ls -1 ~/Dropbox/var/youtube-dl | grep -c .txt"
alias ydtail='tail -n 100 -f /Users/sgniazdowski/Safe/ydl.log'

# Show/hide hidden files in Finder
alias x${A}show_hidden="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias x${A}hide_hidden="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias x${A}hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias x${A}show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable / enable Spotlight
alias x${A}spotoff="sudo mdutil -a -i off"
alias x${A}spoton="sudo mdutil -a -i on"

# Flush Directory Service cache
alias x${A}flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

alias x${A}mute="osascript -e 'set volume output muted true'"
alias x${A}lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Email screenshot
alias x${A}email_screen="screencapture -C -M screen-`date +%d.%m.%Y-%H`.png"
alias x${A}email_screen10s="screencapture -T 10 -C -M screen-`date +%d.%m.%Y-%H`.png"
alias x${A}email_window="screencapture -W -M screen-`date +%d.%m.%Y-%H`.png"
alias x${A}email_snippet="screencapture -s -M screen-`date +%d.%m.%Y-%H`.png"

# Convert iso to dmg
x1iso2dmg() {
    hdiutil convert -format UDRW -o "${1%.iso}".dmg "${1}"
}

g1zip() {
    f=`basename $(pwd)`-`date +%Y%m%d` ; rm -vf "$f".zip ; git archive --output "$f".zip --prefix "$f/" master ; du "$f".zip
}


#
# General tools
#

alias biggest_files='find 2>/dev/null . -type f -ls | sed -e "s/[[:blank:]][[:blank:]]*/ /g" | cut -d" " -f 7,11- | sort -nr | head -25 | awk "{ printf \"%6d\", int( \$1/1048576 ); print \" MiB   \" \$2 \" \" \$3 \" \" \$4 \" \" \$5 \" \" \$6 \" \" \$7 \" \" \$8 \" \" \$9 \" \" \$10 \" \" \$11 \" \" \$12 }" | sed -e "s:MiB   \./:MiB   :" -e "s:\\\ : :g"'
alias recently_changed='find . -newerct "15 minute ago" -print'
recently_changed_x() { find . -newerct "$1 minute ago" -print; }
alias newest_ls="ls -lcth | head -25"
alias cpfile="rsync --progress"
alias zmv='noglob zmv -W'

alias g${A}reset_all="g${A}all reset --hard"
alias g${A}pull_all="g${A}all pull"
alias g${A}diff_all="g${A}all diff"

countdown() {
    __time=$1
    vramsteg --start=3 --percentage --style text --width 30 --min 0 --max 10 --current 3
    echo
    sleep 1
}

#
# Remember things
#

alias clonekeyfrog="git clone ssh://srnt@git.code.sf.net/p/keyfrog/code keyfrog-newclone; cd keyfrog-newclone; git config user.email srnt@users.sf.net; git config user.name 'Sebastian Gniazdowski'; cd .."

#
# Patches for various problems
#

alias slocate='locate'
alias updatedb="sudo /usr/libexec/locate.updatedb"

#
# Advanced
#

# alias ls=myls ... - retain ls options but substitute the command with myls
if altxt=`alias ls`; then
    altxt="${altxt#alias }" # for sh
    if [ "$altxt" != "${altxt#ls=\'ls}" ]; then
        altxt=${altxt#ls=\'ls}
        altxt=${altxt%\'}
        altxt="ls=myls$altxt"
        alias "$altxt"
    fi
else
    alias ls="myls"
fi

# Foreach *.git directory
g1all() {
    PAUSE=0
    for i in *.git; do
        echo -e "\n$i\n"
        LANG=C sleep $PAUSE
        cd "$i"
        git "$@"
        cd ..
        PAUSE="0.5"
    done
}

# List all grouped commands
list_commands() {
    echo "Aliases:"
    alias | egrep "[a-z]${A}.[a-z]+" | sed 's/^alias //' | cut -f 1 -d'=' | sort

    echo
    echo "Scripts:"
    ls -1 /usr/local/bin /usr/bin | egrep "^[a-z]${A}.[a-z]+" | sort
}

# vim:ft=zsh
