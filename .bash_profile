SOURCE_DIR=$(dirname "$(readlink ${BASH_SOURCE[0]})")

# Export environment variables
export PS1="\[\033[1;31m\]\u\[\033[0m\] \[\033[1;33m\]\w\[\033[0;37m\]\$(__git_ps1) > "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=~/Documents/moz-git-tools:/usr/local/sbin:$PATH

# Load scripts
source ${SOURCE_DIR}/git-prompt.sh
source ${SOURCE_DIR}/git-completion.bash

# Alias commands
alias vim=nvim

