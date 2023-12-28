conf-key() {
    key=$1

    is-mac && def_conf_file="$HOST_CONF_DIR/default-mac.json"
    is-linux && def_conf_file="$HOST_CONF_DIR/default-linux.json"

    host_conf_file_name="$(hostname).json"
    host_conf_file="$(find -L $HOST_CONF_DIR -name $host_conf_file_name | head -1)"
    custom_host_conf_file="$(find -L $CUSTOM_HOST_CONF_DIR -name $host_conf_file_name | head -1)"

    # Search in all files in order and take the first match (first file is highest precedence)
    jq $(printf '.%s' $key) $custom_host_conf_file $host_conf_file $def_conf_file | tr -d '"' | grep -v null | head -1
}
