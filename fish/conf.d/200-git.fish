function find-git-config -a config_key -d 'Find the given config key, 0 if found, 1 otherwise'
    git config -l | grep -q $config_key
end

function add-git-config -a config_key -a config_value -d 'Install a git config key if not found'
    find-git-config $config_key
    if test $status -ne 0
        git config --global --add $config_key $config_value
    end
end

add-git-config 'alias.lol' 'log --all --abbrev-commit --oneline --graph'
