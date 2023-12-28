CONF_DIR="$HOME/.config"
ZSH_CONF_DIR="$CONF_DIR/zsh/conf.d"
ZSH_CUSTOM_CONF_DIR="$CONF_DIR/custom/zsh"

source-conf() {
    source_dir=$1
    # sort -g does not work with the full paths, using this rudimentary way for now to sort the find output
    for c in $(find -L $source_dir -type f -name '*.zsh' | awk -F'/' '{printf "%s~-~",$NF; print}' | sort -g | awk -F'~-~' '{print $2}'); do
        source $c
    done
}

source-conf $ZSH_CONF_DIR
source-conf $ZSH_CUSTOM_CONF_DIR
