#! /usr/bin/env sh

ENV_SETUP_CONFIG_DIR="$HOME/.config"
CURRENT_DIR=$(realpath $(dirname $0))

function _link() {
    src=$1
    dst=$2

    test -d "$dst" && echo "Found directory $dst, deleting to replace with a symlink" && rm -rf $dst
    test -L "$dst" && ls -l $(dirname $dst) | grep -q $src && echo "Found symlink $dst pointing to $src. Not touching." && return 0

    rm -rf $dst
    echo "Creating a symlink from $src to $dst"
    ln -s $src $dst
}
function install_fish() {
    _link "$CURRENT_DIR/fish/conf.d" "$ENV_SETUP_CONFIG_DIR/fish/conf.d"
}

function install_host_config() {
    _link "$CURRENT_DIR/host-config" "$ENV_SETUP_CONFIG_DIR/host-config"
}

install_host_config
install_fish