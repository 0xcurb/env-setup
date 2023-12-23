conf-key() {
    key=$1
    jq $(printf '.%s' $key) "$HOST_CONF_DIR/$(hostname).json" | tr -d '"'
}