autoload -U colors && colors
setopt PROMPT_SUBST
precmd() { git-prompt }

_GIT_PROMPT=''

git-prompt() {
    if [[ ! -d .git ]]; then
        _GIT_PROMPT='' && return 0
    fi

    branch=''
    modified=0
    added=0
    deleted=0
    untracked=0

    o=$(git status --porcelain --branch)
    for line in ${(f)o}; do
        status_indicators=$(echo $line | awk '{print $1}')
        if [[ $status_indicators = "##" ]]; then
            branch=$(echo $line | awk '{print $2}' | awk -F'.' '{print $1}')
        fi
        if [[ $status_indicators = "??" ]]; then
            ((untracked++))
        fi
        if [[ $status_indicators == *M* ]]; then
            ((modified++))
        fi
        if [[ $status_indicators == *D* ]]; then
            ((deleted++))
        fi
        if [[ $status_indicators == *A* ]]; then
            ((added++))
        fi
    done

    stat=''
    brief='%B%F{green}✓%f%b'
    [[ $untracked -ne 0 ]] && stat="${stat}|${untracked}⁇"
    [[ $modified -ne 0 ]] && stat="${stat}|${modified}✐"
    [[ $added -ne 0 ]] && stat="${stat}|${added}✚"
    [[ $deleted -ne 0 ]] && stat="${stat}|${deleted}⌫"
    [[ -n $stat ]] && brief='%B%F{yellow}✱%f%b'
    
    _GIT_PROMPT="%B%F{white}[%f%F{blue}${branch}%f ${brief}${stat}%F{white}]%f%b"
}

hostname-colour() {
    [[ $? -eq 0 ]] && printf 'green' || printf 'red'
}

PROMPT='%B%F{white}[%f%F{$(hostname-colour)}$(conf-key 'prompt_hostname')%f%F{white}][%f%F{yellow}%1d%f%F{white}]%f%f%b$_GIT_PROMPT'$'\n''➜ ';
