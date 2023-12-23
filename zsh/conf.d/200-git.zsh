test "$(git config --get alias.lol)" || git config --global --add alias.lol "log --graph --decorate --pretty=oneline --abbrev-commit --all"
test "$(git config --get core.excludesfile)" || git config --global --add core.excludesfile "$HOME/.gitignore_global"
