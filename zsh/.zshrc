bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey -e
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias nvim='PATH=/usr/local/bin/nvim'
# export PGDATA=/usr/local/var/postgres
# alias vim='nvim'
alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/user/sbin:/sbin brew'

# ref. https://webrandum.net/zsh-prompt-name/
PROMPT='%F{37}%# %~ > %f'

# macbook defalut PATH
# /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# load personal settings 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
