# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lui/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Ignore case sensitive
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Theme
setopt prompt_subst
source ~/.config/zsh/themes/af-magic.zsh-theme
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_hist
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Aliases
alias vim=nvim
alias spark=spark-shell
