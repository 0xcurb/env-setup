conf-key() {
    key=$1

    is-mac && def_conf_file="$HOST_CONF_DIR/default-mac.json"
    is-linux && def_conf_file="$HOST_CONF_DIR/default-linux.json"
    host_conf_file="$HOST_CONF_DIR/$(hostname).json"
    [[ ! -e $host_conf_file ]] && host_conf_file=''

    # Search in both files (if existing) and print the output on a single line,
    # remove nulls in case the key is not found in one of the files, then take the first output
    # (which effectively prioritise the $host_conf_file if found)
    jq $(printf '.%s' $key) $host_conf_file $def_conf_file | tr -d '"' | grep -v null | head -1
}