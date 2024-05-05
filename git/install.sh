self="${BASH_SOURCE[0]}"

symlink "$(self-path $self)/ignore" "$(config-dir)/$(self-dir-name $self)/ignore"
