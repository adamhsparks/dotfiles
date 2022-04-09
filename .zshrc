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
plugins=(
    git
    colorize
	zsh-autosuggestions
	z
	zsh-syntax-highlighting
    github
)

source $ZSH/oh-my-zsh.sh
if [ -f ${HOME}/.zplug/init.zsh ]; then
    source ${HOME}/.zplug/init.zsh
fi
source ~/.zplug/init.zsh


# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"


zplug aperezdc/zsh-fzy

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# Load "emoji-cli" if "jq" is installed in this example
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh       # Then, source plugins and add commands to $PATH
zplug load

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
alias fdsx='ssh -X -i $HOME/.ssh/DPIRD_mbPro_key.pem ubuntu@146.118.68.148'
alias more="rich"

disable r
alias r="radian"
alias R='R --no-save'
alias julia='julia --threads 4' # start julia with 4 threads

# PATH modifications
export PATH=$HOME/.local/bin:$HOME/Library/Python/3.9/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/bin/python3:$PATH

# export custom Julia install
#export PATH=$HOME/Development/Github/julia:$PATH

# for some reason the R installation is not found, export path
#export PATH=/Library/Frameworks/R.framework/Resources:$PATH
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

export GPG_TTY=$TTY

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
(( ! ${+functions[p10k]} )) || p10k finalize
RICH_THEME=nord

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
