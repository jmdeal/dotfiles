################################################################################
##                               ENV Variables                                ##
################################################################################

export PATH=/opt/homebrew/bin:$HOME/go/bin:$HOME/bin:$PATH

# TMUX configuration
export ZSH_TMUX_AUTOSTART=$([[ "$TERM" = "alacritty" ]] && echo true || echo false)
export ZSH_TMUX_FIXTERM=false
export TERM="xterm-256color"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

################################################################################
##                                ZSH Plugins                                 ##
################################################################################

# Set plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

# Enable oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable vim mode
bindkey -v

# Enable standalone plugins
fpath+=$HOME/.zsh/pure
fpath+=$HOME/.zsh/completion
autoload -U promptinit; promptinit
prompt pure

################################################################################
##                                  Aliases                                   ##
################################################################################

alias ls=exa
alias nv=nvim

alias accel-control='defaults write .GlobalPreferences com.apple.mouse.scaling'
