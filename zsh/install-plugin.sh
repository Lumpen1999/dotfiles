#!/bin/zsh

# install zsh-autosuggestions
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
git -C ~/zsh-autosuggestions pull 2>/dev/null || git clone https://github.com/zsh-users/zsh-autosuggestions ~/zsh-autosuggestions
echo 'source ~/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc  
