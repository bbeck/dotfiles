if [ -f "/opt/boxen/env.sh" ]; then
  source /opt/boxen/env.sh
fi

# Better tab completion
autoload -U compinit
compinit

# Changes the definition of "word", e.g. with ^W.
autoload select-word-style
select-word-style shell

# Better history navigation
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Keep a really long history
HISTFILE=${HOME}/.zhistory
HISTSIZE=SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# Share history across shells
setopt sharehistory
setopt extendedhistory

# Keyboard shortcuts
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Prompt
export PROMPT="%m ➔ "
export PS2="> "

# Virtual Environments
export WORKON_HOME="${HOME}/.virtualenvs"
source /opt/boxen/homebrew/share/python/virtualenvwrapper.sh
