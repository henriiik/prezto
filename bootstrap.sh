#!/bin/zsh

set -xe;

git submodule update --init --recursive

ln -sf $PWD "${ZDOTDIR:-$HOME}/.zprezto"

mkdir -p ~/.config
ln -sf ~/.zprezto/starship.toml ~/.config/starship.toml

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

touch ${ZDOTDIR:-$HOME}/.zsh_history
ln -sf ~/.zprezto/.zsh_history ~/.zsh_history

sudo chsh -s /bin/zsh $USER

curl -sS https://starship.rs/install.sh | sh -s -- --force

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
