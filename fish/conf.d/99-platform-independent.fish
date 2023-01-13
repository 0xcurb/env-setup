function install-pkg-mgr -d 'Install the platform package manager, if applicable'
    _platform-install-pkg-mgr
end

function install-pkg -a pkg -d 'Install a package'
    _platform-install-pkg $pkg
end

function find-pkg -a pkg -d 'Finds if the given package is installed or not, returns 0 if installed and 1 otherwise'
    _platform-find-pkg
end