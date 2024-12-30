#!/usr/bin/env bash

HOMEBREW_NO_INSTALL_UPGRADE=1
HOMEBREW_NO_ENV_HINTS=1

while getopts "v" arg; do
    case "${arg}" in
        v) WITH_VS_CODE_EXT="t" ;;
    esac
done
echo "[.] Starting setup"
echo "[.] Installing dependencies"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

command -v brew >/dev/null 2>&1 || {
  echo "  [.] Brew (latest)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

command -v aerospace >/dev/null 2>&1 || {
  echo "  [.] Aerospace"
  brew install --cask nikitabobko/tap/aerospace
}

command -v spotify_player >/dev/null 2>&1 || {
  echo "  [.] Spotify Player (lateset)"
  brew install spotify_player
}

## Javascript/Typescript
command -v bun >/dev/null 2>&1 || {
  echo "  [.] bun (latest)"
  curl -fsSL https://bun.sh/install | bash
}
command -v nvm >/dev/null 2>&1 || {
	echo "  [.] Node Version Mananger (v0.40.1)"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
}
command -v nvim >/dev/null 2>&1 || {
  echo "  [.] Neovim (latest)"
  /bin/bash -c "brew install neovim"
}

## Zig
command -v zig >/dev/null 2>&1 || {
  echo "  [.] Zig (latest)"
  brew install zig
}

## Rust
command -v cargo >/dev/null 2>&1 || {
	echo "  [.] Rust (latest)"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

## Terminal
command -v ghostty >/dev/null 2>&1 || {
  echo "  [.] Ghostty"
  /bin/bash -c "brew install ghostty"
}
command -v tmux >/dev/null 2>&1 || {
  echo "  [.] tmux (latest)"
  /bin/bash -c "brew install tmux"
}
command -v fzf >/dev/null 2>&1 || {
  echo "  [.] fzf (latest)"
  /bin/bash -c "brew install fzf"
}
command -v delta >/dev/null 2>&1 || {
  echo "  [.] delta (latest)"
  /bin/bash -c "brew install git-delta"
}
command -v bat >/dev/null 2>&1 || {
  echo "[.] bat (latest)"
  /bin/bash -c "brew install bat"
}
command -v eza >/dev/null 2>&1 || {
  echo "[.] eza (latest)"
  /bin/bash -c "brew install eza"
}
command -v zellij >/dev/null 2>&1 || {
  echo "[.] zellij (latest)"
  /bin/bash -c "brew install zellij"
}

echo "[.] Setting up themes"
bat cache --build

# command -v spt >/dev/null 2>&1 || {
# 	echo "  [.] spotify-tui (latest)"
# 	brew install spotify-tui
# }

# echo "[.] Fixing permissions on zsh"
# sudo chmod -R 755 /usr/local/share/zsh
# sudo chmod -R 755 /usr/local/share/zsh/site-functions

if [ ! -d ~/.dotfiles/homedir/.zsh_private ]; then
    echo "  [.] Creating folder for private zsh configs"
    mkdir ~/.dotfiles/homedir/.zsh_private
fi

pushd homedir > /dev/null 2>&1
now=$(date +"%Y_%m_%d_%H_%M_%S")


echo "  [.] Creating sym-links for .dotfiles"
for file in .*; do
  if [[ $file == "." || $file == ".." ]]; then
    continue
  fi
  echo "    [.] Copying/updating ${file}"
  if [[ -e ~/$file ]]; then
      mkdir -p ~/.dotfiles_backup/$now
      mv ~/$file ~/.dotfiles_backup/$now/$file
  fi
  unlink ~/$file > /dev/null 2>&1
  ln -s ~/.dotfiles/homedir/$file ~/$file
done

popd > /dev/null 2>&1
pushd config > /dev/null 2>&1

echo "  [.] Creating sym-links for configs"
for dir in *; do
  if [ ! -d "${dir}" ]; then
    if [[ -f ~/.config/$dir ]]; then
      mkdir -p ~/.config_backup/$now
      mv ~/.config/$dir ~/.config_backup/$now/$dir
    fi
    unlink ~/.config/$dir > /dev/null 2>&1
    ln ~s /.dotfiles/config/$dir ~/.config/$dir
  fi
  echo "    [.] Copying/updating ${dir}"
  if [[ -d ~/.config/$dir ]]; then
      mkdir -p ~/.config_backup/$now
      mv ~/.config/$dir ~/.config_backup/$now/$dir
  fi
  unlink ~/.config/$dir > /dev/null 2>&1
  ln -s ~/.dotfiles/config/$dir ~/.config/$dir
done

