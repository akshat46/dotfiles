# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/akshat/.oh-my-zsh
fpath+=$HOME/.zsh/pure
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME=""

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

plugins=(
    git colorize dirhistory extract zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

# .zshrc
autoload -U promptinit; promptinit
prompt pure

zstyle :prompt:pure:git:stash      show  yes
zstyle :prompt:pure:path           color white
zstyle :prompt:pure:git:branch     color yellow
zstyle :prompt:pure:prompt:success color blue

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

##########
# Alias
##########

function dict_define () { dict -f -d gcide "$1" | colorit | less }
function size_of_package() { apt-cache --no-all-versions show "$@" | grep 'Installed-Size: ' }
function open_zathura() { zathura "$1" & }
function copy_cat() { /bin/cat "$1" | copy }
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R "

alias findp="apt-cache search"
alias sop='size_of_package'
alias vop='apt-cache policy'
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'
alias cat="highlight -O ansi --force"
alias uncat="highlight -O ansi --force"
alias l="/bin/ls -lha"
alias ls="exa -a -G --group-directories-first"
alias ds="du -sh -- "
alias svim="sudo vim"
alias svim="sudo nvim"
alias vim="nvim"
alias sgedit="sudo gedit"
alias ag-update="sudo apt-get update"
alias ag-upgrade="sudo apt-get upgrade"
alias ag-install="sudo apt-get install"
alias ..="cd .."
alias copy="xsel -ib"
alias copycat='copy_cat'
alias d="kitty +kitten diff"
alias pdf="open_zathura"
alias open="dolphin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Created by `userpath` on 2019-12-21 05:23:02
export PATH="$PATH:/home/akshat/.local/bin:$HOME/.cargo/bin"
##blur for  yakuake
#if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake$' ]]; then
#        for wid in $(xdotool search --pid $PPID); do
#            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
#fi
