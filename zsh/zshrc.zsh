ZSH_CONF_DIR="$HOME/.config/zsh/conf.d"

for c in $(ls $ZSH_CONF_DIR | sort -g); do
    source $ZSH_CONF_DIR/$c
done
