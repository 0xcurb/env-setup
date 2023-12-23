autoload -U colors && colors
setopt PROMPT_SUBST
precmd() { git-prompt }

_GIT_PROMPT=''

git-prompt() {
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
    brief=✓
    [[ $untracked -ne 0 ]] && stat="${stat}|${untracked}⊙"
    [[ $modified -ne 0 ]] && stat="${stat}|${modified}✍"
    [[ $added -ne 0 ]] && stat="${stat}|${added}⊕"
    [[ $deleted -ne 0 ]] && stat="${stat}|${deleted}⊗"
    [[ -n $stat ]] && brief=✱
    
    _GIT_PROMPT="[${branch} ${brief}${stat}]"
}

PS1='%B%F{255}[%f%b%F{green}$(conf-key 'prompt_hostname')%f%B%F{255}]%f%b$_GIT_PROMPT > ';
RPROMPT='%B%F{yellow}[%~]%f%b'