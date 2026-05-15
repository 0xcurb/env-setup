self="${BASH_SOURCE[0]}"

symlink "$(self-path $self)/conf.d" "$(config-dir)/$(self-dir-name $self)/conf.d"
local_zshrc_path="$(self-path $self)/zshrc.zsh"
source_cmd="source $local_zshrc_path"
grep "$source_cmd" $HOME/.zshrc 1>/dev/null 2>&1 && echo "$local_zshrc_path is sourced in $HOME/.zshrc" || echo "$source_cmd" >> $HOME/.zshrc
