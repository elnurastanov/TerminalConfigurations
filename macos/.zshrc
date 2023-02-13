# Colors

BLUE="038"
RED="160"
GREEN="112"
ORANGE="166"
YELLOW="220"
WHITE="015"
BLACK="000"

# Git

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Node
FILE_NAME="package.json"

get_node_version(){
	if [[ -f "$FILE_NAME" ]]; then
		node -v 2> /dev/null | sed 's/\(.*\)/ [Node: \1]/'
	fi
}

# Prompt

PS1='%F{$BLUE}%1~%f${vcs_info_msg_0_}%F{$GREEN}$(get_node_version)%f $ '

# Git info formatting

zstyle ":vcs_info:git:*" formats " %F{$YELLOW}(on %b)%f"

# Aliases

alias la="ls -la"
alias gl="git log --graph"
alias glo="git log --graph --oneline"

# Paths

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
