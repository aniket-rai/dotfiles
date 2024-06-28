# Install brew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install antidote and load plugins
ZDOTDIR="$HOME/.config"
if [ ! -d "$ZDOTDIR/.antidote" ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git $ZDOTDIR/.antidote
fi
source $ZDOTDIR/.antidote/antidote.zsh
antidote load

# Install starship and load it
if ! command -v starship &> /dev/null; then  
  curl -sS https://starship.rs/install.sh | sh
fi
eval "$(starship init zsh)"

# Emacs keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Historical searching
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completions
autoload -Uz compinit && compinit
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# CLI utilities installations - runs async
# enable on fresh install or if installing a new tool
# $HOME/.util/install_tools.zsh

# Util setup
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(zoxide init --cmd cd zsh)"

# Util aliases
alias c="clear"
alias cat="bat"
alias top="btop"
alias htop="btop"
alias ls="eza -a"
alias ll="eza --long"
alias tree="eza --tree"

# Load other aliases
source ${HOME}/.util/dev_aliases.zsh
source ${HOME}/.util/hashideploy_aliases.zsh

# Environment variables
source $HOME/.util/dev_vars.zsh
source $HOME/.util/secrets.zsh

# iTerm2 shell integration
if [[ ! -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
  curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
fi
source $HOME/.iterm2_shell_integration.zsh
