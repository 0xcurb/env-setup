autoload -U colors && colors

PS1="%B%F{255}[%f%b%F{green}$(conf-key 'prompt_hostname')%f%B%F{255}]%f%b > ";
RPROMPT='%B%F{yellow}[%~]%f%b'