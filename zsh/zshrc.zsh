CONFIG_DIR="$HOME/.config"
ZSH_CONF_DIR="$CONFIG_DIR/zsh/conf.d"

source $ZSH_CONF_DIR/platform-specific/*.zsh
source $ZSH_CONF_DIR/platform-independent.zsh

source $ZSH_CONF_DIR/bootstrap.zsh
source $ZSH_CONF_DIR/base-aliases.zsh

source $ZSH_CONF_DIR/prompts.zsh
