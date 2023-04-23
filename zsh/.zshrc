bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey -e
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias nvim='PATH=/usr/local/bin/nvim'
# export PGDATA=/usr/local/var/postgres
alias vim='nvim'

# ref. https://webrandum.net/zsh-prompt-name/
PROMPT='%F{37}%# %~ > %f'

# load personal settings 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
