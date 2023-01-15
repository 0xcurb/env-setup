function _install-bootstrap_tools -d 'Install tools needed for bootstrap'
    install-pkg-mgr
    install-pkg 'jq'
end

function _config-homebrew-path -d 'This function invokes homebrew to set the shell environment'
    eval (/opt/homebrew/bin/brew shellenv)
end

function conf-key -d 'This function retrieves a config key from the host config file'
    jq (printf '.%s' $argv) ~/.config/host-config/(hostname).json | string trim -c '"'
end

_config-homebrew-path