if command -v register-python-argcomplete >/dev/null 2>&1; then
  autoload -U compinit && compinit
  eval "$(register-python-argcomplete pipx)"
fi
