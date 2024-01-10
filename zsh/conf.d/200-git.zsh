test "$(git config --get alias.lol)" || git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
