#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           

# neofetch
fastfetch

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors

stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

zle_highlight=('paste:none')

unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
# setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS
setopt APPEND_HISTORY

# Rehash to find new completions
zstyle ':completion:*' rehash true

# Search History
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "raman08/starship-prompt"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zap-zsh/fzf"
plug "zap-zsh/vim"
plug "zap-zsh/completions"

plug "$HOME/.config/shell/aliasrc"
plug "$HOME/.config/shell/functionrc"

