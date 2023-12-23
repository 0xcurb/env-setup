is-linux() {
    [[ "$(uname | tr '[:upper:]' '[:lower:]')" =~ "linux" ]]
}