## REQUIRED
autoload -U compinit && compinit
zmodload -i zsh/complist

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export TERM=xterm-256color
export PATH="$HOME/.bun/bin:/opt/homebrew/opt/llvm/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

alias code=codium
alias node=''

for config (~/.zsh/*.zsh) source $config
if [ ! -z "$(ls -A $HOME/.zsh_private)" ]; then
    for config (~/.zsh_private/*.zsh) source $config
fi
