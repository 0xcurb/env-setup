function install-pkg-mgr -d 'Install the platform package manager, if not installed'
    _platform-find-pkg-mgr

    if test $status -ne 0
        _platform-install-pkg-mgr
    end
end

function setup-pkg-mgr-env -d 'Configure the environment for the package manager, if needed'
    _platform-setup-pkg-mgr-env
end

function install-pkg -a pkg -d 'Install a package, if not found'
    find-pkg $pkg
    
    if test $status -ne 0
        _platform-install-pkg $pkg
    end
end

function find-pkg -a pkg -d 'Finds if the given package is installed or not, returns 0 if installed and 1 otherwise'
    _platform-find-pkg $pkg
end
