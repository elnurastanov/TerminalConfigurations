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

get_git_info(){
	HAS_GIT="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

	if [[ "$HAS_GIT" == "true" ]]; then
		GIT_START=" (on "
		GIT_BRANCH="$(git branch | awk '/^\*/ {print $2}')"
		GIT_END=")"

		echo "$GIT_START$GIT_BRANCH$GIT_END"
	fi
}

# Node

FILE_NAME="package.json"

get_node_version(){
	if [[ -f "$FILE_NAME" ]]; then
		node -v 2> /dev/null | awk '{print " [" substr($0, 2) "]"}'
	fi
}

# Prompt

PS1="$CYAN\W$RESET_COLOR$YELLOW\$(get_git_info)$RESET_COLOR$GREEN\$(get_node_version)$RESET_COLOR $ "

# Aliases

alias la="ls -la"
alias gl="git log --graph"
alias glo="git log --graph --oneline"

# Paths

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env"
