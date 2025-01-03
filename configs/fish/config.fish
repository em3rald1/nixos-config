set fish_greeting

function fish_prompt -d "Write out the prompt"
	printf '[ '
	if fish_is_root_user
		printf '%s' (set_color $fish_color_quote)
	else
		printf '%s' (set_color $fish_color_command)
	end

	printf '%s%s ] %s%s%s\n'             $USER       (set_color $fish_color_normal) \
		(set_color $fish_color_command) (prompt_pwd) (set_color $fish_color_normal)

	if fish_is_root_user
		printf '# '
	else
		printf '> '
	end
end
