function fish_prompt -d 'Write out the prompt'
  set -l laststatus $status

  set -l git_info
    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        set git_branch (set_color -o blue)"$git_branch"
        set -l git_status
        if not command git diff-index --quiet HEAD --
            if set -l count (command git rev-list --count --left-right $upstream...HEAD 2>/dev/null)
                echo $count | read -l ahead behind
                if test "$ahead" -gt 0
                    set git_status "$git_status"(set_color red)⬆
                end
                if test "$behind" -gt 0
                    set git_status "$git_status"(set_color red)⬇
                end
            end
            for i in (git status --porcelain | string sub -l 2 | sort | uniq)
                switch $i
                    case "."
                        set git_status "$git_status"(set_color green)✚
                    case " D"
                        set git_status "$git_status"(set_color red)✖
                    case "*M*"
                        set git_status "$git_status"(set_color green)✱
                    case "*R*"
                        set git_status "$git_status"(set_color purple)➜
                    case "*U*"
                        set git_status "$git_status"(set_color brown)═
                    case "??"
                        set git_status "$git_status"(set_color red)≠
                end
            end
        else
            set git_status (set_color green)✓
        end
        set git_info "[$git_branch $git_status"(set_color -o white)"]"
    end
  
  set git_prompt "$(set_color white)$git_info"
  set prompt_hostname (conf-key 'prompt_hostname')
  set current_dir (basename (pwd))

  if test $laststatus -eq 0
    set display_color (set_color -o green)
  else
    set display_color (set_color -o red)
  end

  printf "%s[%s%s%s][%s%s%s]%s%s%s \n➜%s " (set_color -o white) $display_color $prompt_hostname (set_color -o white) (set_color -o yellow) $current_dir (set_color -o white) $git_prompt $display_color (set_color normal)
end
