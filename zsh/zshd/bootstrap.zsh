_install-bootstrap-tools() {
    install-pkg-mgr
    install-pkg 'jq'
}

conf-key() {
    jq $(printf '.%s' $argv) "$CONFIG_DIR/host-config/$(hostname).json" | tr -d '"'
}
