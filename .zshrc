# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=/Users/joaoqalves/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras jira)

# User configuration

source $ZSH/oh-my-zsh.sh

# My Config
DEFAULT_USER="joaoqalves"

# Functions
gdf() { git diff --color $@ | diff-so-fancy }
rbi() { merge_base=$(git merge-base "$1" HEAD); git checkout "$1"; git pull --rebase origin "$1"; git checkout -; git rebase -i "${merge_base}" --autosquash  }

source "${HOME}/.zshrc_work"

# Aliases
alias cdp="cd $HOME/p"
alias cdc="cd $HOME/p/config"

# Java
export JAVA_HOME="~/.sdkman/candidates/java/current"

# PyEnv
export PATH="$HOME/.local/bin:$PATH"
eval "$(pyenv init -)"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# AWS
export AWS_SHARED_CREDENTIALS_FILE="$HOME/.aws/credentials"
export AWS_DEFAULT_PROFILE="jeffrey"
export SAML2AWS_IDP_ACCOUNT="${AWS_DEFAULT_PROFILE}"
export AWS_DEFAULT_REGION="eu-west-1"

# AWLESS + ec2sh
source /usr/local/share/zsh/site-functions/_awless
autoload -Uz ec2sh
autoload -Uz fak
autoload -Uz kpod
autoload -Uz king
autoload -Uz kdpl
autoload -Uz kall
autoload -Uz krestart

# ZSH Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# GPG
export GPG_TTY=$(tty)

# Go
export GOPATH=$HOME/p/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# ProtoBuf path
export PATH="/usr/local/opt/protobuf@2.5/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$GEM_HOME/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/joaoqalves/.sdkman"
[[ -s "/Users/joaoqalves/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/joaoqalves/.sdkman/bin/sdkman-init.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
