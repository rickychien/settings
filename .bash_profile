export PS1="\[\033[1;31m\]\u\[\033[0m\] \[\033[1;33m\]\w\[\033[0m\]\$(__git_ps1) > "
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
alias vim=nvim
export PATH=~/Documents/moz-git-tools:$PATH

# Load in the git branch prompt script.
source ~/Documents/settings/.git-prompt.sh
