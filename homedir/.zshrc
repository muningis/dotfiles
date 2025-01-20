## REQUIRED
autoload -U compinit && compinit
zmodload -i zsh/complist

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export TERM=xterm-256color

BINS_PATH="$HOME/.local/bin:/usr/local/go/bin:/usr/local/bin/zig"
ANACONDA_PATH="/opt/homebrew/anaconda3/bin:/usr/local/anaconda3/bin"
BUN_PATH="$HOME/.bun/bin"
HOMEBREW_PATH="/opt/homebrew/opt/llvm/bin"
GO_PATH="/usr/local/go/bin:$HOME/go/bin";
COMPOSER_PATH="$HOME/.composer/vendor/bin"

export PATH="$PATH:$BINS_PATH:$ANACONDA_PATH:$BUN_PATH:$HOMEBREW_PATH:$GO_PATH:$COMPOSER_PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# alias code=zed

for config (~/.zsh/*.zsh) source $config
if [ ! -z "$(ls -A $HOME/.zsh_private)" ]; then
    for config (~/.zsh_private/*.zsh) source $config
fi

/usr/bin/ssh-add --apple-use-keychain ~/.ssh/id_ed25519

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
