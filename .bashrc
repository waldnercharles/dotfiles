#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.aliases
source ~/.exports
source ~/.functions

#PS1='[\u@\h \W]\$ '

prompt () {
    _ERR=$?
    _UID=$(id -u)
    _JOB=$(jobs | wc -l)

    [ $_UID -eq 0 ] && echo -n '━' || echo -n -e '─'
    [ $_JOB -ne 0 ] && echo -n '!' || echo -n -e '─'
    [ $_ERR -ne 0 ] && echo -n '!' || echo -n -e '─'
}

PS1='$(prompt) '

# define a standard background and foreground variable.
getTermColor() {
    echo -n "#$( cat ~/.config/termite/config | grep  "$1" | head -n 1 | grep -oE "#[a-zA-Z0-9]{6}" | cut -c 2- )";
}

export defaultBG="$(getTermColor background)"
export defaultFG="$(getTermColor foreground)"
export activeFG="$(getTermColor color15)"

# auto-complete for pacman when using sudo:
complete -cf sudo
