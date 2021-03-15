#!/usr/bin/env bash

echo "[.] Starting setup"
echo "[.] Installing dependencies"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

command -v brew >/dev/null 2>&1 || {
  echo "  [.] Brew (latest)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
command -v nvm >/dev/null 2>&1 || {
	echo "  [.] Node Version Mananger (v0.35.3)"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}
command -v cargo >/dev/null 2>&1 || {
	echo "  [.] Rust (latest)"
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
command -v spt >/dev/null 2>&1 || {
	echo "  [.] spotify-tui (latest)"
	brew install spotify-tui
}
command -v code >/dev/null 2>&1 || {
	echo "  [.] VSCode (latest)"
	brew install visual-studio-code --cask
}

echo "[.] Fixing permissions on zsh"
sudo chmod -R 755 /usr/local/share/zsh
sudo chmod -R 755 /usr/local/share/zsh/site-functions

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
    continue
  fi
  echo "    [.] Copying/updating ${dir}"
  if [[ -d ~/.config/$dir ]]; then
      mkdir -p ~/.config_backup/$now
      mv ~/.config/$dir ~/.config_backup/$now/$dir
  fi
  unlink ~/.config/$dir > /dev/null 2>&1
  ln -s ~/.dotfiles/config/$dir ~/.config/$dir
done

popd > /dev/null 2>&1

echo "[.] Installing VSCode extensions"
pkglist=(
  pkief.material-icon-theme,
  enkia.tokyo-night
)

for i in ${pkglist[@]}; do
  echo "  [.] $i"
  code --install-extension $i &> /dev/null
done

echo "[.] Done!"
