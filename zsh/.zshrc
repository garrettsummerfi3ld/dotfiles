# # Antigen
# source /usr/local/share/antigen/antigen.zsh
# 
# antigen use oh-my-zsh
# 
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found
# antigen bundle gradle
# antigen bundle mvn
# antigen bundle macos
# antigen bundle python
# antigen bundle zsh-users/zsh-syntax-highlighting
# 
# antigen theme geometry-zsh/geometry
# 
# antigen apply


# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall


# Antidote
# source antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias neovim='nvim'

export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/Users/garrettsummerfi3ld/.shell:$PATH"
export PATH="/Users/garrettsummerfi3ld/Qt/6.5.2/macos/bin:$PATH"

export GEM_HOME="$HOME/.gem"

# Homebrew autocompletion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# oh-my-posh configuration
eval "$(oh-my-posh init zsh --config ~/.oh-my-posh/catppuccin_moca.omp.json)"

export PATH="$PATH:/Users/garrettsummerfi3ld/.local/bin" # Added by Docker Labs Debug Tools"
export PATH="$PATH:/Users/garrettsummerfi3ld/Library/Android/sdk/platform-tools" # ADB

# ls alias for lsd
alias ls='lsd'
eval "$(gh copilot alias -- zsh)"
