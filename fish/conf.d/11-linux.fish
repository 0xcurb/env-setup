function is-linux -d 'Returns 0 if the current platform is Linux'
    test "$(uname | tr [:upper:] [:lower:])" = 'linux'
end

if is-linux
    #only supports yum atm

    function _platform-find-pkg-mgr -d 'Checks if the package manager exists'
        # Linux package manager is installed by default
        return 0
    end
    
    function _platform-install-pkg-mgr -d 'Installs package manager if not found'
        # Linux package manager is installed by default
        return 0
    end

    function _platform-setup-pkg-mgr-env -d 'Performs any necessary env configuration for the package manager'
        # Linux package manager is installed by default
        return 0
    end

    function _platform-install-pkg -a pkg
        switch $pkg
        case 'pyenv'
            curl https://pyenv.run | bash
        case '*'
            sudo yum install $pkg
        end
    end

    function _platform-find-pkg -a pkg
        switch $pkg
        case 'pyenv'
            test -e "$HOME/.pyenv/bin/pyenv"
        case '*'
            yum list installed | grep -q $pkg
        end
    end
end