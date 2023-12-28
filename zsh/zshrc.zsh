CONF_DIR="$HOME/.config"
ZSH_CONF_DIR="$CONF_DIR/zsh/conf.d"
ZSH_CUSTOM_CONF_DIR="$CONF_DIR/custom/zsh"

for c in $(ls $ZSH_CONF_DIR | sort -g); do
    source $ZSH_CONF_DIR/$c
done

for c in $(ls $ZSH_CUSTOM_CONF_DIR | sort -g); do
    source $ZSH_CUSTOM_CONF_DIR/$c
done
