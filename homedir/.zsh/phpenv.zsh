if command -v phpenv >/dev/null 2>&1; then
    export PATH="$HOME/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
fi
