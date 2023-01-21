#! /usr/bin/env sh

ENV_SETUP_CONFIG_DIR="$HOME/.config"
CURRENT_DIR=$(realpath $(dirname $0))

function _link_dir() {
    src=$1
    dst=$2

    test -d "$dst" && echo "Found directory $dst, deleting to replace with a symlink" && rm -rf $dst
    test -L "$dst" && ls -l $(dirname $dst) | grep -q $src && echo "Found symlink $dst pointing to $src. Not touching." && return 0

    mkdir -p $(dirname $dst)
    echo "Creating a symlink from $src to $dst"
    ln -s $src $dst
}


function _link_file() {
    src=$1
    dst=$2

    test -f "$dst" && echo "Found file $dst, deleting to replace with a symlink" && rm -rf $dst
    test -L "$dst" && ls -l $(dirname $dst) | grep -q $src && echo "Found symlink $dst pointing to $src. Not touching." && return 0

    echo "Creating a symlink from $src to $dst"
    ln -s $src $dst
}


function install_fish() {
    _link_dir "$CURRENT_DIR/fish/conf.d" "$ENV_SETUP_CONFIG_DIR/fish/conf.d"
}

function install_zsh() {
    _link_dir "$CURRENT_DIR/zsh/zshd" "$ENV_SETUP_CONFIG_DIR/zsh/conf.d"
    _link_file "$CURRENT_DIR/zsh/zshrc.zsh" "$HOME/.zshrc"
}

function install_host_config() {
    _link_dir "$CURRENT_DIR/host-config" "$ENV_SETUP_CONFIG_DIR/host-config"
}

install_host_config
install_fish
install_zsh