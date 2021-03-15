## REQUIRED
autoload -U compinit && compinit
zmodload -i zsh/complist

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH:$HOME/bin"
export TERM=xterm-256color

for config (~/.zsh/*.zsh) source $config
if [ ! -z "$(ls -A ~/.zsh_private)" ]; then
    for config (~/.zsh_private/*.zsh) source $config
fi
source ~/.dotfiles/nord-prompt/prompt.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
