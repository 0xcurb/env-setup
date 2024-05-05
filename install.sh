#! /usr/bin/env bash

function symlink-target() {
    local symlink=$1
    echo -n "$(ls -al $(dirname $dst) | grep "$(basename $dst)" | awk '{print $NF}')"
}

function symlink() {
    local src=$1
    local dst=$2

    test -L "$dst" && symlink-target $dst | grep -q $src && echo "Found symlink '$dst' pointing to '$src'. Skipping." && return 0
    test -e "$dst" && echo "Found $dst, deleting to replace with the correct symlink." && rm -rf $dst

    mkdir -p $(dirname $dst)
    echo "Creating a symlink from '$src' to '$dst'."
    ln -s $src $dst
}

function self-path() {
    local script_path=$1
    echo -n $(realpath $(dirname $script_path))
}

function self-dir-name() {
    local script_path=$1
    echo -n $(basename $(self-path $script_path))
}

function config-dir() {
    echo -n "$HOME/.config"
}


for install_script in $(find -L $(self-path "${BASH_SOURCE[0]}")/*/* -type f -name 'install.sh'); do
    source $install_script    
done
