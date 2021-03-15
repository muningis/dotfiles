# Dotfiles

## Download
```bash
git clone --recurse-submodules git@github.com:RokasMuningis/dotfiles.git ~/.dotfiles
git submodule update --init --recursive 
./setup.sh
python3 homedir/.vim/pack/plugins/start/YouCompleteMe/install.py --ts-completer --rust-completer
```
