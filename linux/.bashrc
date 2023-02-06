# Colors

BLACK="\[\033[1;30m\]"
RED="\[\033[1;31m\]"
GREEN="\[\033[1;32m\]"
YELLOW="\[\033[1;33m\]"
BLUE="\[\033[1;34m\]"
PURPLE="\[\033[1;35m\]"
CYAN="\[\033[1;36m\]"
WHITE="\[\033[1;37m\]"

RESET_COLOR="\[\033[00m\]"

# Git

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt

PS1="$CYAN\W$RESET_COLOR $YELLOW\$(parse_git_branch)$RESET_COLOR $ "

# Aliases

alias la="ls -la"

# Paths
