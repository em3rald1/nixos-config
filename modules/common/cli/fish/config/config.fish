# fish_config theme choose Catppuccin\ Mocha
set -U fish_greeting
set GPG_TTY $(tty)
alias ls=lsd

function fish_prompt -d Prompt
  set -l shell_depth (
    if test $SHLVL -ne 1
      echo -n "🗲 [$SHLVL]"
    end
  )

  printf "%s%s %s%s\n%sλ%s " (set_color $fish_color_cwd) (basename $PWD) (set_color $fish_color_command) "$shell_depth" \
        (set_color $fish_color_param) (set_color $fish_color_normal)
end

zoxide init fish | source
