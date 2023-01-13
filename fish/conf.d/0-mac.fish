if test "$(uname | tr [:upper:] [:lower:])"=='darwin'
    function _platform-install-pkg-mgr
    end

    function _platform-install-pkg -a pkg
        brew install $pkg
    end

    function _platform-find-pkg -a pkg
        test (brew ls | grep $pkg)
    end
end