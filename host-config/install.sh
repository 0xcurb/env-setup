self="${BASH_SOURCE[0]}"

symlink "$(self-path $self)/default-linux.json" "$(config-dir)/$(self-dir-name $self)/default-linux.json"
symlink "$(self-path $self)/default-mac.json" "$(config-dir)/$(self-dir-name $self)/default-mac.json"
