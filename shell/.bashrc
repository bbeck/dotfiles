##
## Prompt
##

function _prompt_command() {
  local VIRTUAL_ENV_PART=""
  if [[ -n "$VIRTUAL_ENV" ]]; then
    VIRTUAL_ENV_PART="(\[\033[36m\]${VIRTUAL_ENV##*/}\[\033[0m\]) "
  fi

  PS1="\[\033[0m\]${VIRTUAL_ENV_PART}\[\033[36m\]\w \[\033[37m\]➜\[\033[0m\] "
}
export PROMPT_COMMAND="_prompt_command"


##
## Path
##

# Include bin directory in path.
export PATH="${HOME}/src/dotfiles/bin:${PATH}"


##
## History
##

# Include timestamps in history items.
export HISTTIMEFORMAT="%F %T "

# Don't allow duplicate entries in the history.
export HISTCONTROL="ignoredups:erasedups"

# We don't care about remembering very basic commands.
export HISTIGNORE="bg:date:fg:ls:w"

# Keep a lot of history.
export HISTSIZE="100000"
export HISTFILESIZE="${HISTSIZE}"

# Always append to the history file and store commands on one line.
shopt -s histappend
shopt -s cmdhist

# Save and reload the history after each command (append, clear, reload).
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"


##
## Colors
##

# Enable colors in bash
export CLICOLOR=1

# Highlighting inside manpages and elsewhere.
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline


##
## Python virtual environments
##

export WORKON_HOME="${HOME}/.virtualenvs"
if [[ -e /usr/local/bin/virtualenvwrapper.sh ]]; then
 source /usr/local/bin/virtualenvwrapper.sh
fi


##
## Completion
##

# bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
fi

# homebrew completion
if [ -f "$(brew --prefix)/etc/bash_completion.d/brew" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/brew"
fi

# git completion
if [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ]; then
  source "$(brew --prefix)/etc/bash_completion.d/git-completion.bash"
fi


##
## SSH keys
##

for key in ${HOME}/.ssh/*id_rsa; do
  ssh-add -K "${key}" 2>/dev/null
done
