function conf-key -a key -d 'This function retrieves a config key from the host config file'
    if is-mac
        set def_conf_file "$HOST_CONF_DIR/default-mac.json"
    else
        set def_conf_file "$HOST_CONF_DIR/default-linux.json"
    end

    set host_conf_file "$HOST_CONF_DIR/$(hostname).json"
    if test ! -e $host_conf_file
        set host_conf_file
    end

    # Search in both files (if existing) and print the output on a single line,
    # remove nulls in case the key is not found in one of the files, then take the first output
    # (which effectively prioritise the $host_conf_file if found)
    jq (printf '.%s' $key) $host_conf_file $def_conf_file | string trim -c '"' | grep -v null | head -1
end
