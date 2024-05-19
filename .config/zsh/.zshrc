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
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Search History
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

zle_highlight=('paste:none')

unsetopt BEEP
setopt AUTO_CD
setopt GLOB_DOTS
setopt NOMATCH
# setopt MENU_COMPLETE
setopt EXTENDED_GLOB
setopt INTERACTIVE_COMMENTS

# Rehash to find new completions
zstyle ':completion:*' rehash true

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
plug "zsh-users/zsh-history-substring-search"

plug "$HOME/.config/shell/aliasrc"
plug "$HOME/.config/shell/functionrc"
