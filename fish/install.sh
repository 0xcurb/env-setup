self="${BASH_SOURCE[0]}"

symlink "$(self-path $self)/conf.d" "$(config-dir)/$(self-dir-name $self)/conf.d"
symlink "$(self-path $self)/config.fish" "$(config-dir)/$(self-dir-name $self)/config.fish"
