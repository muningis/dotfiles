#!/usr/bin/env bash

command -v brew >/dev/null 2>&1 || {
  echo "[.] Installing Brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

ls ~/.nvm/nvm.sh >/dev/null 2>&1 || {
	echo "[.] Installing Node Version Mananger (v0.35.3)"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}

command -v cargo >/dev/null 2>&1 || {
	echo "[.] Installing rust"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

command -v spt >/dev/null 2>&1 || {
	echo "[.] Installing spotify-tui"
	brew install spotify-tui
}

command -v code >/dev/null 2>&1 || {
	echo "[.] Installing VSCode"
	brew install visual-studio-code --cask
}
