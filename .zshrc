# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Path to your oh-my-zsh installation.
export ZSH="/Users/adamsparks/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=13

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"

disable r
alias r="radian"

# PATH modifications
export PATH=$HOME/.local/bin:$HOME/Library/Python/3.9/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/bin/python3:$PATH

# export custom Julia install
#export PATH=$HOME/Development/Github/julia:$PATH

# for some reason the R installation is not found, export path
export PATH=/Library/Frameworks/R.framework/Resources:$PATH
export DYLD_LIBRARY_PATH=/opt/Homebrew/lib
export LDFLAGS="-L/opt/homebrew/include"
export CFLAGS="-I/opt/homebrew/include"

# GDAL things
export GDAL_DRIVER_PATH=/usr/local/lib/gdalplugins
export GDAL_DATA=/usr/local/opt/osgeo-gdal/share/gdal/

export PATH="/usr/local/opt/osgeo-gdal/bin:$PATH"

# ccache things
export PATH="/opt/homebrew/opt/ccache/libexec:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

export GITHUB_TOKEN="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"
