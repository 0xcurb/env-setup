conf-key() {
    key=$1

    is-mac && def_conf_file="$HOST_CONF_DIR/default-mac.json"
    is-linux && def_conf_file="$HOST_CONF_DIR/default-linux.json"

    host_conf_file="$HOST_CONF_DIR/$(hostname).json"
    [[ ! -e $host_conf_file ]] && host_conf_file=''

    custom_host_conf_file="$CUSTOM_HOST_CONF_DIR/$(hostname).json"
    [[ ! -e $custom_host_conf_file ]] && custom_host_conf_file=''

    # Search in all files in order and take the first match (first file is highest precedence)
    jq $(printf '.%s' $key) $custom_host_conf_file $host_conf_file $def_conf_file | tr -d '"' | grep -v null | head -1
}