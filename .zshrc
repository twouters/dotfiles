HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000

# inlcude local zsh functions
fpath=(~/.local/share/zsh/functions $fpath)

setopt appendhistory
setopt print_exit_value
setopt correct
setopt interactivecomments
setopt completeinword

# load required functions
#  `-U` skips alias expansion while loading the functions
autoload -U compinit promptinit
compinit
promptinit

# autocomplete custom defined functions/aliases
zstyle :compinstall filename '~/.zshrc'

# auto rehash completion - useful for newly installed packages
zstyle ':completion:*' rehash true

# use gentoo style prompt
#  see `~/.local/share/zsh/functions/prompt_gentoo_setup`
prompt gentoo

# use colors for ls and add `-F` to append indicator (one of */=>@|) to entries
if [[ -x "`whence -p dircolors`" ]]; then
  eval `dircolors`
  alias ls='ls -F --color=auto'
else
  alias ls='ls -F'
fi

# use zle vi mode
#  this can be autodetected by using EDITOR, but force anyway.
bindkey -e

# bind special keys according to readline configuration
eval "$(sed -n 's/^/bindkey /; s/: / /p' /etc/inputrc)"

# set TERM to rxvt, as rxvt-unicode can cause problems on remote servers.
alias ssh='TERM=rxvt ssh'

# use libvirt as vagrant provider
export VAGRANT_DEFAULT_PROVIDER=libvirt

# default editor is vim
export EDITOR=vim

# Base16 Shell color scheme
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# zsh-syntaxt-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Include work related stuff
source ~/.zshrc_work
