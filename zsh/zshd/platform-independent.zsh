install-pkg-mgr() {
    _platform-find-pkg-mgr

    if [[ $? -ne 0 ]] then
        _platform-install-pkg-mgr
    fi

    add-pkg-mgr-to-path
}

install-pkg() {
    find-pkg $pkg
    
    if [[ $? -ne 0 ]] then
        _platform-install-pkg $pkg
    fi
}

find-pkg() {
    _platform-find-pkg $pkg
}

add-pkg-mgr-to-path() {
    _platform-add-pkg-mgr-to-path
}