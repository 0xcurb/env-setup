#! /usr/bin/env sh

ENV_SETUP_CONFIG_DIR="$HOME/.config"
CURRENT_DIR=$(realpath $(dirname $0))

function _link_dir() {
    src=$1
    dst=$2

    test -L "$dst" && ls -al $(dirname $dst) | grep -q $src && echo "Found symlink $dst pointing to $src. Skipping." && return 0
    test -d "$dst" && echo "Found directory $dst, deleting to replace with a symlink" && rm -rf $dst

    mkdir -p $(dirname $dst)
    echo "Creating a symlink from $src to $dst"
    ln -s $src $dst
}


function _link_file() {
    src=$1
    dst=$2

    test -L "$dst" && ls -al $(dirname $dst) | grep -q $src && echo "Found symlink $dst pointing to $src. Skipping." && return 0
    test -f "$dst" && echo "Found file $dst, deleting to replace with a symlink" && rm -rf $dst

    echo "Creating a symlink from $src to $dst"
    ln -s $src $dst
}


function install_fish() {
    _link_dir "$CURRENT_DIR/fish/conf.d" "$ENV_SETUP_CONFIG_DIR/fish/conf.d"
    _link_file "$CURRENT_DIR/fish/config.fish" "$ENV_SETUP_CONFIG_DIR/fish/config.fish"
}

function install_zsh() {
    _link_dir "$CURRENT_DIR/zsh/conf.d" "$ENV_SETUP_CONFIG_DIR/zsh/conf.d"
    _link_file "$CURRENT_DIR/zsh/zshrc.zsh" "$HOME/.zshrc"
}

function install_host_config() {
    _link_dir "$CURRENT_DIR/host-config" "$ENV_SETUP_CONFIG_DIR/host-config"
}

function install_custom() {
    _link_dir "$CURRENT_DIR/custom" "$ENV_SETUP_CONFIG_DIR/custom"
}

function install_git_config() {
    _link_dir "$CURRENT_DIR/git" "$ENV_SETUP_CONFIG_DIR/git"
}

install_host_config
install_fish
install_zsh
install_custom
install_git_config
