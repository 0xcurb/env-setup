is-mac() {
    [[ "$(uname | tr '[:upper:]' '[:lower:]')" =~ "darwin" ]]
}

if is-mac; then
    _PKG_MGR_PATH=''

    _platform-find-pkg-mgr() {
        brew_possible_paths='/opt/homebrew/bin'

        for brew_path in $brew_possible_paths; do
            if [[ -e "$brew_path/brew" ]]; then
                _PKG_MGR_PATH=$brew_path
                return 0
            fi
        done

        return 1
    }
    
    _platform-install-pkg-mgr() {
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    }

    _platform-install-pkg() {
        brew install $pkg
    }

    _platform-find-pkg() {
        brew ls | grep -q $pkg
    }

    _platform-add-pkg-mgr-to-path() {
        eval $($_PKG_MGR_PATH/brew shellenv)
    }

fi
