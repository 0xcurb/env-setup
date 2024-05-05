self="${BASH_SOURCE[0]}"

symlink "$(self-path $self)/fish" "$(config-dir)/$(self-dir-name $self)/fish"
symlink "$(self-path $self)/host-config" "$(config-dir)/$(self-dir-name $self)/host-config"
symlink "$(self-path $self)/zsh" "$(config-dir)/$(self-dir-name $self)/zsh"
