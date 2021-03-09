#!/usr/bin/env bash

echo "[.] Installing VSCode extensions"
pkglist=(
  pkief.material-icon-theme,
  enkia.tokyo-night
)

for i in ${pkglist[@]}; do
  echo "  [.] Installing $i"
  code --install-extension $i &> /dev/null
done