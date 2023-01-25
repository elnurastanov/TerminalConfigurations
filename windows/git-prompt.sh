# This conf for windows git bash
# Will locate this path: "/[disk]/Users/[user]/.config/git/git-prompt.sh

PS1='\[\033]0;Git Bash\007\]'  # set window title
PS1="$PS1"'\[\033[32m\]'       # change to brownish yellow
PS1="$PS1"'\W'                 # current working directory
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"' => '               # prompt: always =>

# This loads nvm (Node Version Manager)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
