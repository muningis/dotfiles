#!/usr/bin/env bash

if ! command -v brew &> /dev/null
then
    echo "[.] Installing Brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v kitty &> /dev/null
then
    echo "[.] Installing Kitty Terminal"
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if ! command -v nvm &> /dev/null
then
    echo "[.] Installing Node Version Mananger (v0.35.3)"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

if ! command tmux-spotify-info &> /dev/null
then 
    git clone https://github.com/jdxcode/tmux-spotify-info.git
    mkdir ~/bin
    mv tmux-spotify-info/tmux-spotify-info ~/bin/tmux-spotify-enfo
fi

if ! command limelight &> /dev/null
then
    mv limelight/bin/limelight ~/bin/limelight
fi
if ! command spt &> /dev/null
then
    brew install spotify-tui
fi
