GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="yes"
GIT_PS1_HIDE_IF_PWD_IGNORED="yes"
# The next line updates PATH for the Google Cloud SDK.
source '/Users/BN/Downloads/google-cloud-sdk/path.bash.inc'
source ~/.git-prompt.sh

# NVM
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
# The next line enables shell command completion for gcloud.
source '/Users/BN/Downloads/google-cloud-sdk/completion.bash.inc'

# Default Vim 
export EDITOR=/usr/local/bin/vim

# Add node modules installed globally to the path
export PATH=/usr/local/Cellar/node/10.11.0/bin:$PATH

shopt -s histappend
shopt -s histreedit
shopt -s histverify
HISTCONTROL='ignoreboth'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Git
# You must install Git first
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m' # requires you to type a commit message
alias gck='git checkout' # requires branch name or option + branch name
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline'
alias glps='git log -p --stat'
alias gshow='git show -p --stat' # requires SHA
alias grm='git rm $(git ls-files --deleted)'

# Color LS
colorflag="-G"
alias ls="command ls ${colorflag}"
alias l="ls -lF ${colorflag}" # all files, in long format
alias la="ls -laF ${colorflag}" # all files inc dotfiles, in long format
alias lsd='ls -lF ${colorflag} | grep "^d"' # only directories

# take notes from cli
notes() {
  if [ ! -z "$1" ]; then
    # Using the "$@" here will take all parameters passed into
    # this function so we can place everything into our file.
    echo "$@" >> "$HOME/notes.md"
  else
    # If no arguments were passed we will take stdout and place
    # it into our notes instead.
    cat - >> "$HOME/notes.md"
  fi
}

# exec before promt
before_prompt () {
  history -a; history -c; history -r;
  printf "\n%s: %s\n" "$USER" "$PWD"
}
# Prompt customization
# PROMPT_COMMAND=before_prompt
PROMPT_COMMAND='__git_ps1 "\u \w" "\\\ λ "'
PS1=' λ '

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/icu4c/bin:$PATH"

