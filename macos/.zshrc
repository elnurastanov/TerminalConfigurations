# Colors

BLUE="038"
RED="160"
GREEN="112"
ORANGE="166"
YELLOW="220"
WHITE="015"
BLACK="000"

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

# Git changes

get_git_changes(){
	if [[ -n "${vcs_info_msg_0_}" ]]; then
		git status | grep "modified:" | wc -l
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
setopt prompt_subst
autoload -Uz compinit && compinit

PS1='%F{$BLUE}%1~%f%F{$ORANGE}$(get_git_info)%f%F{$GREEN}$(get_node_version)%f $ '

# Aliases

alias la="ls -la"
alias gl="git log --graph"
alias glo="git log --graph --oneline"

# Paths

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
