function conf-key -a key -d 'This function retrieves a config key from the host config file'
    jq (printf '.%s' $key) ~/.config/host-config/(hostname).json | string trim -c '"'
end
