# Vim
bindkey -v

# 履歴ファイルの保存先
HISTFILE=~/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# historyを共有
setopt share_history

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
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
