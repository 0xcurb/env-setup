is-linux() {
    [[ "$(uname | tr '[:upper:]' '[:lower:]')" =~ "linux" ]]
}

if is-linux; then
    _platform-find-pkg-mgr() {
    }
    
    _platform-install-pkg-mgr() {
    }

    _platform-install-pkg() {
        sudo yum install $pkg
    }

    _platform-find-pkg() {
    }

    _platform-add-pkg-mgr-to-path() {
    }
fi