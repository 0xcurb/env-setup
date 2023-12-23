function is-mac -d 'Returns 0 if the current platform is Mac'
    test "$(uname | tr [:upper:] [:lower:])" = 'darwin'
end

if is-mac

    function _platform-find-pkg-mgr -d 'Checks if the package manager exists'
        set brew_possible_paths '/opt/homebrew/bin'

        for brew_path in $brew_possible_paths
            if test -e "$brew_path/brew"
                return 0
            end
        end

        return 1
    end
    
    function _platform-install-pkg-mgr -d 'Installs brew if not found'
        curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
    end

    function _platform-setup-pkg-mgr-env -d 'Performs any necessary env configuration for the package manager'
        eval (/opt/homebrew/bin/brew shellenv)
    end

    function _platform-install-pkg -a pkg
        brew install $pkg
    end

    function _platform-find-pkg -a pkg
        brew ls | grep -q $pkg
    end

end
